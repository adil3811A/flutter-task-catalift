
import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/main.dart';

import 'intrest_screen.dart';

class EducationDetailScreen extends StatefulWidget {
  const EducationDetailScreen({super.key});

  @override
  State<EducationDetailScreen> createState() => _EducationDetailScreenState();
}
List<DropdownMenuEntry<String>> hightersLevel = [DropdownMenuEntry(value: "Item 1", label: 'item 1'), DropdownMenuEntry(value: 'Item 2', label: 'item 2'),DropdownMenuEntry(value: 'Item 3', label: 'Item 3'), DropdownMenuEntry(value: 'Item 3', label: 'Item 3')];
List<DropdownMenuEntry<String>> institution = [DropdownMenuEntry(value: "Item 1", label: 'item 1'), DropdownMenuEntry(value: 'Item 2', label: 'item 2'),DropdownMenuEntry(value: 'Item 3', label: 'Item 3'), DropdownMenuEntry(value: 'Item 3', label: 'Item 3')];



class _EducationDetailScreenState extends State<EducationDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  int wordCount = 0;
  final int maxWords = 100;
  void _updateWordCount(String value) {
    final words = value.trim().split(RegExp(r'\s+')).where((word) => word.isNotEmpty).toList();
    setState(() {
      wordCount = words.length;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body:Padding(
        padding: const EdgeInsets.only(left: 12, right: 12 , top: 50,bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,  right: 20, bottom: 30),
              child: LinearProgressIndicator(value: 0.4,),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Your Education Detail',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 40
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10 , bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Highest Education Level',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                  DropdownMenu(
                    inputDecorationTheme: InputDecorationTheme(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor
                        )
                      ),
                        enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide: BorderSide(color: Theme.of(context).primaryColor)
                        )
                    ),
                      dropdownMenuEntries: hightersLevel,
                    expandedInsets: EdgeInsets.zero,
                    enableFilter: true,
                    enableSearch: true,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10 , bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Institution',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                  DropdownMenu(
                    inputDecorationTheme: InputDecorationTheme(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor)
                        ),
                      enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor)
                      )
                    ),
                    dropdownMenuEntries: institution,
                    expandedInsets: EdgeInsets.all(0),
                    enableFilter: true,
                    enableSearch: true,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10 , bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Relevant Past Role/Intershipe',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      TextFormField(
                        controller: _controller,
                        maxLines: 6,
                        minLines: 5,
                        onChanged: (value) {
                          _updateWordCount(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Write In 100 Words',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:  BorderSide(color:Theme.of(context).primaryColor), // light blue border
                          ),
                          enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:  BorderSide(color:Theme.of(context).primaryColor), // light blue border
                          ),
                          contentPadding: const EdgeInsets.all(16),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: const TextStyle(color: Colors.black87),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12, bottom: 8),
                        child: Text(
                          '$wordCount/100 words typed',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => InterestsScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:  Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Continue'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        side:  BorderSide(color: Theme.of(context).primaryColor),
                        foregroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Back'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class EducationDetailsForm extends StatefulWidget {
  const EducationDetailsForm({super.key});

  @override
  State<EducationDetailsForm> createState() => _EducationDetailsFormState();
}

class _EducationDetailsFormState extends State<EducationDetailsForm> {
  final TextEditingController _controller = TextEditingController();
  int wordCount = 0;
  final int maxWords = 100;

  void _updateWordCount(String value) {
    final words = value.trim().split(RegExp(r'\s+')).where((word) => word.isNotEmpty).toList();
    setState(() {
      wordCount = words.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Relevant Past Roles/Internships',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xFF090979),
          ),
        ),
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            TextFormField(
              controller: _controller,
              maxLines: 6,
              minLines: 5,
              onChanged: _updateWordCount,
              decoration: InputDecoration(
                hintText: 'Write In 100 Words',
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF90CAF9)), // light blue border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF90CAF9)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF03045E), width: 2),
                ),
                contentPadding: const EdgeInsets.all(16),
                filled: true,
                fillColor: Colors.white,
              ),
              style: const TextStyle(color: Colors.black87),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, bottom: 8),
              child: Text(
                '$wordCount/100 words typed',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
