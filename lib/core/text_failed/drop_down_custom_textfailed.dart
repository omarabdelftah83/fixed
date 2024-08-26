import 'package:flutter/material.dart';

class DropDownCustomTextfailed extends StatefulWidget {
  DropDownCustomTextfailed({
    Key? key,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.dropdownItems,
    this.onDropdownChanged,
    this.dropdownValue,
  }) : super(key: key);

  final String? hintText;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final List<String>? dropdownItems;
  final ValueChanged<String?>? onDropdownChanged;
  final String? dropdownValue;

  @override
  State<DropDownCustomTextfailed> createState() => _DropDownCustomTextfailedState();
}

class _DropDownCustomTextfailedState extends State<DropDownCustomTextfailed> {
  String? _selectedDropdownItem;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _selectedDropdownItem = widget.dropdownValue;
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleDropdown,
          child: AbsorbPointer(
            child: TextField(
              textAlign: TextAlign.right, // Align text to the right
              decoration: InputDecoration(
                hintText: _selectedDropdownItem ?? widget.hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: widget.prefixIcon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              ),
            ),
          ),
        ),
        if (_isDropdownOpen)
          Container(
            width: MediaQuery.of(context).size.width, // Make the container span the full width of the screen
            margin: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: widget.dropdownItems!.map((item) {
                bool isSelected = item == _selectedDropdownItem;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0), // Add padding between items
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDropdownItem = item;
                        _isDropdownOpen = false;
                        if (widget.onDropdownChanged != null) {
                          widget.onDropdownChanged!(_selectedDropdownItem);
                        }
                      });
                    },
                    child: Container(
                      width: 400,
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Same padding as TextField
                      decoration: BoxDecoration(
                        color: isSelected ?Colors.blue[100] : Colors.white,

                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(  color: Colors.grey.shade300),
                      ),
                      child: Text(
                        textAlign: TextAlign.right, // Align text to the right
                        item,
                        style: const TextStyle(fontSize: 12.0,fontWeight: FontWeight.w400),

                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
