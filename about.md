

## History
- 20130912 Upload

- 20130917 Use report a bug: on very first tap to open menu it immediately closes, tap again menu opens
	- Is it the reset() function on window resize? Yes. On mobile, it triggers window resize event when open the menu.