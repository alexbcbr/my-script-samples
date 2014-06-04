inventory = {
    'gold' : 500,
    'pocket': ['seashell', 'strange berry', 'lint'],
    'pouch' : ['flint', 'twine', 'gemstone'], # Assigned a new list to 'pouch' key
    'backpack' : ['xylophone','dagger', 'bedroll','bread loaf']
}

inventory['burlap bag'] = ['apple', 'small ruby', 'three-toed sloth']

inventory['pouch'].sort() 
inventory['backpack'].sort() 
inventory['backpack'].remove('dagger')
inventory['gold'] = inventory['gold'] + 50 

