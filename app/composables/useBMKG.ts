import { ref } from 'vue'

export const useBmkg = () => {
  const loading = ref(false)
  const error = ref(null)
  const tideData = ref<number[][] | null>(null)
  const tideBounds = ref<number[][] | null>(null)
  const lastUpdate = ref('')

  const formatDate = (date: Date) => {
    const yyyy = date.getUTCFullYear()
    const MM = String(date.getUTCMonth() + 1).padStart(2, '0')
    const dd = String(date.getUTCDate()).padStart(2, '0')
    const hh = String(date.getUTCHours()).padStart(2, '0')
    return `${yyyy}${MM}${dd}${hh}00`
  }

  const cleanIsoString = (isoStr: string) => {
    if (!isoStr) return ''
    const numbersOnly = isoStr.replace(/\D/g, '') 
    return numbersOnly.substring(0, 12)
  }

  const fetchTide = async () => {
    loading.value = true
    error.value = null
    
    try {
      // 1. Get Model Run Time
      console.log('📡 Fetching BMKG model run...')
      const runUrl = 'https://maritim.bmkg.go.id/pusmar/api23/modelrun'
      const resRun = await fetch(runUrl)
      if (!resRun.ok) throw new Error("Failed to fetch model run")
      const runText = await resRun.text()
      const baserunData = JSON.parse(runText)

      let rawIsoString = ''
      if (baserunData.inaflows && Array.isArray(baserunData.inaflows)) {
        rawIsoString = baserunData.inaflows[0]
      } else if (Array.isArray(baserunData)) {
        rawIsoString = baserunData[0]
      } else {
        rawIsoString = Object.values(baserunData)[0] as string
      }
      
      const baserun = cleanIsoString(rawIsoString)
      console.log('✅ Model run:', baserun)

      // 2. Fetch Zeta (Sea Level Anomaly) Data
      const dtime = formatDate(new Date())
      const zetaUrl = `https://maritim.bmkg.go.id/pusmar/api23/arr_req/inaflows/zeta/${baserun}/${dtime}/0`
      console.log(`📥 Fetching tide data: ${zetaUrl}`)
      
      const resZeta = await fetch(zetaUrl)
      if (!resZeta.ok) throw new Error("Failed to fetch zeta data")
      const zetaRawText = await resZeta.text()
      
      let rawResponse
      try {
        rawResponse = JSON.parse(zetaRawText)
        if (typeof rawResponse === 'string') {
          rawResponse = JSON.parse(rawResponse)
        }
      } catch (e) {
        throw new Error("Failed to parse JSON response")
      }

      const dataObj = Array.isArray(rawResponse) ? rawResponse[0] : rawResponse
      const { nx, ny, la1, la2, lo1, lo2 } = dataObj.header
      const flatData = dataObj.data 

      console.log('📊 Data dimensions:', { nx, ny, la1, la2, lo1, lo2 })
      console.log('📦 Flat data length:', flatData.length)

      // === COORDINATE MAPPING FIX ===
      // nx = Width (Columns/Longitude), ny = Height (Rows/Latitude)
      // flatData format: [row0_col0, row0_col1, ..., row1_col0, ...]
      
      const matrix = []
      
      // Step 1: Convert flat array to 2D matrix
      for (let y = 0; y < ny; y++) {
        const start = y * nx
        const end = start + nx
        const row = flatData.slice(start, end)
        matrix.push(row)
      }
      
      // Step 2: Fix orientation based on header coordinates
      // la1 is START lat, la2 is END lat
      // If la1 < la2 (data goes South→North), but Leaflet needs North→South
      // So we MUST reverse if la1 < la2
      if (la1 < la2) {
        console.log('🔄 Flipping vertically (la1 < la2)')
        matrix.reverse() // Flip vertically: bottom row becomes top
      }
      
      // Step 3: Check if longitude needs flipping
      // If lo1 > lo2 (data goes East→West), reverse each row
      if (lo1 > lo2) {
        console.log('🔄 Flipping horizontally (lo1 > lo2)')
        matrix.forEach(row => row.reverse())
      }

      tideData.value = matrix

      // Step 4: Set proper bounds [SouthWest, NorthEast]
      const south = Math.min(la1, la2)
      const north = Math.max(la1, la2)
      const west = Math.min(lo1, lo2)
      const east = Math.max(lo1, lo2)

      tideBounds.value = [
         [south, west],  // Southwest corner
         [north, east]   // Northeast corner
      ]
      
      console.log('🗺️ Bounds:', { south, north, west, east })
      console.log('✨ Matrix size:', matrix.length, 'x', matrix[0]?.length)
      console.log('📈 Sample values (first 5):', matrix[0]?.slice(0, 5))
      
      lastUpdate.value = `${baserun}`

    } catch (err: any) {
      console.error("❌ BMKG Error:", err)
      error.value = err.message
    } finally {
      loading.value = false
    }
  }

  return { 
    loading, 
    error, 
    tideData, 
    tideBounds, 
    lastUpdate, 
    fetchTide 
  }
}