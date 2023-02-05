import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/components/grocery_tile.dart';
import 'package:restaurant/models/grocery_item.dart';
import 'package:uuid/uuid.dart';

class GroceryItemScreen extends StatefulWidget {
  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  const GroceryItemScreen(
      {super.key,
      required this.onCreate,
      required this.onUpdate,
      this.originalItem})
      : isUpdating = (originalItem != null);

  @override
  State<GroceryItemScreen> createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  TextEditingController _nameController = TextEditingController();
  String _name = " ";
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;
  @override
  void initState() {
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(
        hour: date.hour,
        minute: date.minute,
      );
      _dueDate = date;
      _nameController.addListener(() {
        // setState(() {
        //   _name = _nameController.text;
        // });
        // _name = _nameController.text;
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameController.removeListener(() {
      _nameController;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                // TODO: Add callback handler
                final groceryItem = GroceryItem(
                  color: _currentColor,
                  name: _nameController.text,
                  date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day,
                      _dueDate.hour, _dueDate.minute),
                  importance: _importance,
                  quantity: _currentSliderValue,
                  id: widget.originalItem?.id ?? const Uuid().v1(),
                );
                if (widget.isUpdating) {
                  widget.onUpdate(groceryItem);
                } else {
                  widget.onCreate(groceryItem);
                }
              },
              icon: Icon(Icons.check))
        ],
        title: Center(
          child: Text(
            'Qamhawy\'s Items',
            style: GoogleFonts.lato(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildNameField(),
            const SizedBox(
              height: 10,
            ),
            buildImportanceField(),
            const SizedBox(
              height: 10,
            ),
            buildDateField(),
            const SizedBox(
              height: 10,
            ),
            buildTimeField(),
            const SizedBox(
              height: 15,
            ),
            buildColorPicker(),
            const SizedBox(
              height: 15,
            ),
            buildQuantityField(),
            GroceryTile(
                item: GroceryItem(
              color: _currentColor,
              date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day,
                  _dueDate.hour, _dueDate.minute, _dueDate.second),
              id: 'previewMode',
              importance: _importance,
              name: _nameController.text,
              quantity: _currentSliderValue,
            )),
          ],
        ),
      ),
    );
  }

  Column buildQuantityField() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            const SizedBox(width: 16.0),
            Text(
              _currentSliderValue.toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            ),
          ],
        ),
        Slider(
            activeColor: _currentColor,
            inactiveColor: Colors.black,
            min: 0,
            max: 100,
            divisions: 100,
            value: _currentSliderValue.toDouble(),
            onChanged: ((value) {
              setState(() {
                _currentSliderValue = value.toInt();
              });
            }))
      ],
    );
  }

  Row buildColorPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 10,
              color: _currentColor,
            ),
            const SizedBox(width: 8.0),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
          ],
        ),
        TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      actions: [
                        TextButton(
                          child: const Text('Save'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      backgroundColor: Colors.white,
                      content: BlockPicker(
                          pickerColor: Colors.white,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                            });
                          }),
                    );
                  }));
            },
            child: const Text('Select'))
      ],
    );
  }

  Column buildTimeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time Of Day ',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              onPressed: () async {
                final selectedTime = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                setState(() {
                  if (selectedTime != null) {
                    _timeOfDay = selectedTime;
                  }
                });
              },
              child: const Text('Select'),
            ),
          ],
        ),
        Text(_timeOfDay.format(context))
      ],
    );
  }

  Column buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 3));
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
              child: const Text('Select'),
            ),
          ],
        ),
        Text(DateFormat.yMMMMEEEEd().format(_dueDate))
      ],
    );
  }

  Column buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Importance',
            style: GoogleFonts.lato(fontSize: 28.0),
          ),
        ),
        Wrap(
          spacing: 12,
          children: [
            // 4
            ChoiceChip(
              // 5
              selectedColor: Colors.black,
              // 6
              selected: _importance == Importance.low,
              label: const Text(
                'low',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              // 7
              onSelected: (selected) {
                setState(() => _importance = Importance.low);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.medium,
              label: const Text(
                'medium',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _importance = Importance.medium);
              },
            ),

            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.high,
              label: const Text(
                'high',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _importance = Importance.high);
              },
            ),
          ],
        )
      ],
    );
  }

  Column buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            'Item Name',
            style: GoogleFonts.lato(fontSize: 28.0),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.green,
          ),
          child: TextField(
            controller: _nameController,
            cursorColor: _currentColor,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'E.g. Apples, Banana, 1 Bag of salt'),
          ),
        )
      ],
    );
  }
}
