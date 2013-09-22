
# Upload
Name:

FlexMenu - Responsive Off-canvas/Toggle Pattern Navigation

Tags:

off canvas, toggle pattern, responsive menu, responsive navigation, sass, coffeescript, elegant, beautiful




Process: functionality first, then design


# Essential features
Common:
- Cross browser
- sub menu with ▼
- will item that has sub menu clickable? Not clickable for now.

Desktop:
- Multi-levels
- Hover, not click

Mobile:
- **Off-canvas**
- click + touch, not hover

# Bugs
- Serious. around 670px window width, cannot slideDown, it auto slideUp

	Maybe: it's because I bind click event after every resize? Seems so. Yes for now.
	http://stackoverflow.com/questions/18450023/slide-toggle-after-page-resize-bugging-jquery
	
	Solution:
	- Check if event exist
	- Off events first, then rebind events

- jQuery slide effect gone after window resizing.

# More features (In the future)
- off-canvas + toggle pattern
- more theme: light and dark.
- responsive: on / off
- sticky
- allow user set the menu width, say 70%, 300px

# Design

Desktop:
- My 'sense' template
- Triangle: [behance](http://www.behance.net/) navigation 20130906
- Bar-icon: [Bootstrap](http://getbootstrap.com/)

Mobile:
- 100% vertical height nav?!

# Next
- responsive pricing table: http://codecanyon.net/item/responsive-pricing-tables/5139265?WT.ac=item_more_thumb&WT.seg_1=item_more_thumb&WT.z_author=Pixelworkshop