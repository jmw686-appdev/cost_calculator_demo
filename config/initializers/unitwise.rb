Unitwise.register(
  names: ["finger", "fingers"],
  symbol: "finger",
  primary_code: "fng",
  secondary_code: "fng",
  scale: {
    value: 1.0,
    unit_code: '[foz_us]' #comparable to 1 fluid ounce
    
  },
  property: 'fluid volume'
)

#slice of bread
Unitwise.register(
  names: ["slice", "slices"],
  symbol: "slc_us",
  primary_code: "[slc]",
  secondary_code: "[SLC]",
  scale: {
    value: 1,
	  unit_code: '[oz_av]0.78'
  },
  property: 'mass'
)

#average bread has 20-24 slices, 16-18 if texas toast or sourdough, 26 if thinly
Unitwise.register(
  names: ["loaf", "loaves"],
  symbol: "loaf_us",
  primary_code: "[lf]",
  secondary_code: "[LF]",
  scale: {
    value: 1,
	  unit_code: "[slc]22"
  },
  property: 'mass'
)