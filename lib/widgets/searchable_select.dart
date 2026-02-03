import 'package:flutter/material.dart';

class SearchableSelect<T> extends StatefulWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T) itemLabel;
  final Function(T) onChanged;
  final String? hint;

  const SearchableSelect({
    super.key,
    required this.label,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.value,
    this.hint,
  });

  @override
  State<SearchableSelect<T>> createState() => _SearchableSelectState();
}

class _SearchableSelectState<T> extends State<SearchableSelect<T>> {
  void _showSearchModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Penting agar bisa custom tinggi
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        // Padding bottom mengikuti tinggi keyboard agar tidak tertutup
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: _SearchModalContent<T>(
            items: widget.items,
            itemLabel: widget.itemLabel,
            onSelected: (val) {
              widget.onChanged(val);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          Text(
            widget.label.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
        ],
        InkWell(
          onTap: () => _showSearchModal(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.value != null
                        ? widget.itemLabel(widget.value as T)
                        : (widget.hint ?? "Pilih..."),
                    style: TextStyle(
                      color: widget.value != null
                          ? Colors.black87
                          : Colors.grey[500],
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Internal Widget untuk Modal Pencarian
class _SearchModalContent<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T) itemLabel;
  final Function(T) onSelected;

  const _SearchModalContent({
    required this.items,
    required this.itemLabel,
    required this.onSelected,
  });

  @override
  State<_SearchModalContent<T>> createState() => _SearchModalContentState<T>();
}

class _SearchModalContentState<T> extends State<_SearchModalContent<T>> {
  String query = '';
  List<T> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  void _filter(String q) {
    setState(() {
      query = q;
      filteredItems = widget.items
          .where((item) =>
              widget.itemLabel(item).toLowerCase().contains(q.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Batasi tinggi maksimal modal (misal 85% layar)
    final double maxHeight = MediaQuery.of(context).size.height * 0.85;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min, // KUNCI: Tinggi menyesuaikan konten
        children: [
          // Drag Handle (Garis kecil di atas)
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Search Field
          TextField(
            autofocus: true, // Langsung fokus keyboard saat dibuka
            decoration: InputDecoration(
              hintText: "Cari...",
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            onChanged: _filter,
          ),
          
          const SizedBox(height: 10),

          // List Items
          // Flexible membuat list mengambil sisa ruang yang ada, 
          // tapi akan menyusut jika item sedikit.
          Flexible(
            child: filteredItems.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Data tidak ditemukan",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true, // Agar list tidak memaksa expand full height
                    itemCount: filteredItems.length,
                    separatorBuilder: (_, __) =>
                        const Divider(height: 1, thickness: 0.5),
                    itemBuilder: (ctx, index) {
                      final item = filteredItems[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        title: Text(widget.itemLabel(item)),
                        onTap: () => widget.onSelected(item),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}