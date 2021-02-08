# stackoverflow_1

Flutter List view insert

## Getting Started

I have a list view data in which I want to display a custom banner after 5 list items and I tried the below method, but it is replacing that particular index item.

Expanded(
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  if (index % 5 == 0 && index != 0) {
                    return Banner();
                  }
                  return ListTile(
                    title: Text('Item $index'),
                  );
                }),
          )
It replacing the item index 5 and showing the banner so please help me how can I put the banner without losing any index data.
