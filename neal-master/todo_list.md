TODOs:
- [ ] Instruction pdf:
  - [x] Open in adjacent tab
  - [x] Make sure instructions say how to zoom in/out
  - [ ] Videos
- [x] Get ~1 hour of files in 4/5 folders. 15 seconds with little overlap
- [ ] Display metadata:
  - [x] Collapsible panel under play audio
  - [x] Basic collapsible panel with formatted time display
  - [x] Get location from recorder filename
  - [x] Distance from coastline
  - [ ] Distance from closest Special Area of Conservation (SAC) and species concerned
  - [ ] Infer weather using some API (temperature, weather, wind, percipitation)
  - [x] Get habitat type (either hard coded or gotten from wind farm GIS files)
  - [ ] Recorder height (~1m) or altitude
- [x] Make File Select dropdown easier to navigate (in header)
- [x] File label stats (# labels) and navigation
- [ ] Interactive bounding boxes:
  - [ ] When clicking inside of box, open new panel
  - [ ] Show details of saved labels in list in this panel in sidebar or navbar page
  - [ ] resizable limits
  - [ ] moveable/translation
  - [ ] copy/paste-able (duplicate and push x seconds to the right)
  - [ ] editing label and other info
  - [ ] ability to click Label boxes and see info/play sound
  - [ ] delete (are you sure plus undo)
- [ ] navbarPage() to have distinct pages: label, verify/check, run model
  from https://shiny.rstudio.com/articles/layout-guide.html
- [ ] Save list of added species as col in species csv (or append to a column) 
- [ ] modalDialog instead of edit table for editing/listen to labels
- [ ] Unit tests (especially for plots)
- [ ] Check soundgen pitch app https://github.com/tatters/soundgen
- [ ] Example sound files in right sidebar 
- [ ] Species templates
  (https://birdwatchireland.ie/our-work/surveys-research/research-surveys/countryside-bird-survey/cbs-bird-songs-and-calls/)
- [ ] Mel scale
- [ ] gridExtra blank plot with correct axes, paste spec as image (not raster)
- [ ] 3 labeling modes: 
  - [ ] Binary classification (whole file)
  - [ ] Event detection (time/x-axis)
  - [ ] Object detection (time and frewquency bounding boxes)
- [x] Expand call types - call, agitation/contact, flight, nocturnal, juvenile 
- [x] Expand noise groups - anthropogenic (machinery, vehicles), biogenic (insects, farm animals, etc.), geophony (weather, rain)
- [x] Order species list alphabetically, or group by family (get definitive list)
- [ ] Hotkeys:
  - [ ] start/end labeling (only works when tab is open, need to move button)
  - [ ] open folder/file navigation
  - [x] play/pause audio (needed JS workaround)
  - [x] label/delete
  - [x] prev/next file
  - [x] add/remove categories
    - [x] (pressing enter in textbox adds the category)
    - [x] (pressing delete while selecting category deletes it)
  - [ ] 1-9 number keys:
    - [x] First 9 labels in list
    - [ ] custom setup of 9 hotkeys
  - [x] undo label save or delete
  - [ ] undo parameter changes 
  - [ ] zoom in/out (double click already does this)
  - [ ] scroll bounding box up/down or left/right
- [x] Savable parameters: most things that can be tweaked, including
  - [x] last worked on file from previous session is opening file from this sesion
  - [x] species list chosen
  - [x] all setings in sidebar
- [x] Label edit table needs throttle/delay (changing label multiple times too quickly causes infinite loop)
- [x] JS in own files
- [ ] CSS in own files
- [x] Filename has number of labels in choice names
- [ ] Loading and saving labels to google sheets each session for persistent data storage
- [ ] clicking label/box functionality:
  - [ ] label becomes selectinput
  - [ ] box is highighted (different style)
  - [ ] option to delete (need to programmatic set brush coordinates so hotkey/existing delete will work)
  - [ ] option to play selected times/frequencies in box
- [ ] flexbox alignment/fill to end of row
- [ ] action links
  - [ ] when new folder created, action link to navigate there (change Data Folder)
  - [ ] when image saved, link to open it
