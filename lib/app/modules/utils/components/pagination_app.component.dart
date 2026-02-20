import 'package:flutter/material.dart';

class PaginationAppComponent extends StatefulWidget {
  final int currentPage;
  final int totalPages;
  final int totalElements;
  final ValueChanged<int>? onPageChanged;

  const PaginationAppComponent({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.totalElements,
    this.onPageChanged,
  });

  @override
  State<PaginationAppComponent> createState() =>
      _PaginationAppComponentState();
}

class _PaginationAppComponentState extends State<PaginationAppComponent> {
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.currentPage;
  }

  void _goToPage(int page) {
    if (page < 1 || page > widget.totalPages) return;

    setState(() {
      _currentPage = page;
    });

    widget.onPageChanged?.call(page);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Botão anterior
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed:
              _currentPage > 1 ? () => _goToPage(_currentPage - 1) : null,
        ),

        // Páginas
        ...List.generate(widget.totalPages, (index) {
          final page = index + 1;
          final isSelected = page == _currentPage;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () => _goToPage(page),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Text(
                  page.toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: _currentPage < widget.totalPages
              ? () => _goToPage(_currentPage + 1)
              : null,
        ),
      ],
    );
  }
}
