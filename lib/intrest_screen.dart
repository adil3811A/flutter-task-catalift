import 'package:flutter/material.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> interests = [
    'Item 1', 'Item 2', 'Item 3', 'Item 4',
    'Item 5', 'Item 5', 'Item 6', 'Item 7',
    'Item 8', 'Item 9', 'Item 10', 'Item 11',
    'Item 12', 'Item 13', 'Item 14', 'Item 15',
    'Item 16', 'Item 17', 'Item 18', 'Item 19'
  ];
  Set<String> selectedInterests = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Padding(
        padding: const EdgeInsets.only(
            left: 12, right: 12 , top: 50,bottom: 18
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,  right: 20, bottom: 30),
              child: LinearProgressIndicator(value: 0.7,),
            ),
            Text('Your Interests', style: TextStyle(fontSize: 30)),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: "Search",
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: interests.map((interest) {
                    final isSelected = selectedInterests.contains(interest);
                    return ChoiceChip(
                      label: Text(interest),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedInterests.add(interest);
                          } else {
                            selectedInterests.remove(interest);
                          }
                        });
                      },
                      selectedColor: Colors.indigo,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.indigo,
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }).toList(),
                ),
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
                        // TODO: do any thing after selecting interest
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