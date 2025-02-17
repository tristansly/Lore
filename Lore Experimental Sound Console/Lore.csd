<Cabbage>
; LORE Experimental Sound Console
; Written by Micah Frank (http://micahfrank.com)
; Puremagnetik » Brooklyn, NYC 2022
; Special thanks to Rory Walsh for support and code (https://cabbageaudio.com/)

; Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)
; Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
; NonCommercial — You may not use the material for commercial purposes.
; No additional restrictions — You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

; Impulse Response Files by OpenAir Library, https://www.openair.hosted.york.ac.uk, University of York and licensed under Attribution 4.0 International (CC BY 4.0).

form caption("Lore") size(860, 675), colour(0,0,0), guiMode("queue"), pluginId("2084"), typeface("includes/Inconsolata-Regular.ttf"), opcodeDir("."), bundle("./includes")
#define SLIDER1 trackerColour(255,255,255), textColour(255,255,255,200), trackerBackgroundColour(250,250,250,808), trackerThickness(0.05), popupText(0), _isSlider("yes")
#define BUTTON1 fontColour:0("250,250,250,200"), fontColour:1("250,250,250"), outlineColour("250,250,250"), colour:0(0,0,0), outlineThickness(2), corners(0), automatable(1)
#define GROUPBOX lineThickness(0.5), outlineThickness(0.5), colour("5,500,0")
image bounds(0,0,970,1000) file("includes/lore-bg.png")

image bounds(20,100,400,75), channel("DelMatrixL"), colour(8,79,200,0)
image bounds(440,100,400,75), channel("DelMatrixR"), colour(0,200,200,0)
image bounds(20,100,400,75), channel("FBMatrixL"), colour(245,80,80,0)
image bounds(440,100,400,75), channel("FBMatrixR"), colour(185,31,88,0)
image bounds(20,100,400,75), channel("attenMatrixL"), colour(200,200,0,0)
image bounds(440,100,400,75), channel("attenMatrixR"), colour(100,100,200,0)

label bounds(3000,23,200,15), fontColour(200,200,200), fontSize(12), text(""), channel("SliderValue"), colour(0,0,0,0)

label bounds(240,23,200,15), fontColour(200,200,200), text("SET A SOURCE FILE --->"), alpha(0), channel("SampleWarning")

groupbox bounds(440,0,400,70), colour(0,0,0,0), lineThickness(0),outlineThickness(0){

button bounds(0, 20, 20, 20), latched(1), channel("InputMode"), text("F", "I") $BUTTON1, automatable(0)
filebutton bounds (25, 20, 100, 20), populate("*.wav *.aif", "."), mode("file"), channel("File"), text("SOURCE") $BUTTON1, automatable(0)
button bounds(130, 20, 60, 20), latched(1), channel("PlayMode"), text("PLAY", "PLAY") $BUTTON1, colour:1(250,250,250), fontColour:1(0,0,0), automatable(0)
button bounds(3000, 20, 60, 20), latched(0), channel("StopMode"), text("STOP") $BUTTON1 outlineColour(185,31,88), fontColour:0(250,250,250), fontColour:1(250,250,250), automatable(0)
filebutton bounds(195, 20, 60, 20), latched(0), mode("save"), text("RENDER"), populate("*.wav", "."), channel("RecordMode"), colour(0,0,0,0) $BUTTON1, automatable(0)
hslider bounds(0,50,248, 20), channel("Gain"), range(0,2,1,1), text ("INPUT GAIN"), $SLIDER1

}

groupbox bounds(16,235,400,150), colour(0,0,0,0), lineThickness(0),outlineThickness(0), outlineColour(255,255,255,100){
    label bounds(5,0,400,16), align("left"), text("SPECTRAL MODULATIONS ----------------------------------"), fontSize(15) 
    hslider bounds(0,30, 200, 20), channel("SpectralModRate1"), range(0,10,1,0.5,0.001), text ("RATE") $SLIDER1
    hslider bounds(0,55, 200, 20), channel("SpectralModAmount1"), range(0,1,0.2,1), text ("AMOUNT") $SLIDER1
    combobox bounds(0, 88, 100, 20), items("Filter L", "Filter R", "Filter L/R", "Time L", "Time R", "Time L/R", "Feedback L", "Feedback R", "Feedback L/R"), channel("SpectralLFODest1")
    combobox bounds(103, 88, 70, 20), items("Sine","Tri","Square","Saw Up","Saw Dn","Random"), channel("SpectralLFOShape1")

}
groupbox bounds(437,235,400,150), colour(0,0,0,0), lineThickness(0),outlineThickness(0), outlineColour(255,255,255,100){
    label bounds(5,0,400,16), align("left"), text("ROUTING -----------------------------------------------"), fontSize(15) 
    label bounds(3,30,400,16), align("left"), text("MODULE CHAIN"), fontSize(12) 
    combobox bounds(0, 50, 100, 20), items("Parallel","Spec > Grain","Grain > Spec"), channel("audioRouting"), automatable(0)
    label bounds(110,30,400,16), align("left"), text("REVERB TYPE"), fontSize(12) 
    combobox bounds(107, 50, 100, 20), items("Algorithmic","Convolution"), channel("ReverbType"), automatable(0)
    
    label bounds(214,30,400,16), channel("impulsesLabel"), align("left"), text("IMPULSES"), fontSize(12), alpha(0.5)
    combobox bounds(214, 50, 140, 20), populate("*.wav", "./includes/IRs"), channel("IR")


}

groupbox bounds(225,235,400,150), colour(0,0,0,0), lineThickness(0),outlineThickness(0), outlineColour(255,255,255,100){
    hslider bounds(0,30, 200, 20), channel("SpectralModRate2"), range(0,10,1,0.5,0.001), text ("RATE") $SLIDER1
    hslider bounds(0,55, 200, 20), channel("SpectralModAmount2"), range(0,1,0.5,1), text ("AMOUNT") $SLIDER1
    combobox bounds(0, 88, 100, 20), items("Filter L", "Filter R", "Filter L/R", "Time L", "Time R", "Time L/R", "Feedback L", "Feedback R", "Feedback L/R"), channel("SpectralLFODest2"), value(2)
    combobox bounds(103, 88, 70, 20), items("Sine","Tri","Square","Saw Up","Saw Dn","Random"), channel("SpectralLFOShape2"), value(6)

}

button bounds(355, 190, 60, 20), latched(0), channel("CopyL"), text("COPY>R"), $BUTTON1, automatable(0)

button bounds(775, 190, 60, 20), latched(0), channel("CopyR"), text("COPY>L") $BUTTON1, automatable(0)

button bounds(100, 190, 60, 20), latched(0), channel("Random"), text("RNDM"), $BUTTON1, automatable(0)
optionbutton bounds(20, 190, 60, 20), latched(1), channel("TimeFeedModeL"), items("FILTER", "TIME", "FBACK") $BUTTON1, automatable(0)
optionbutton bounds(440, 190, 60, 20), latched(1), channel("TimeFeedModeR"), items("FILTER", "TIME", "FBACK") $BUTTON1, automatable(0)

//# Granular Control
;CHANNEL 1
groupbox bounds(16,450,855,200), colour(0,0,0,0), lineThickness(0),outlineThickness(0){
label bounds(5,0,400,16), align("left"), text("GRANULAR CONTROLS --------------------------------------"), fontSize(15) 
hslider bounds(0, 30, 200, 20), channel("Pitch1"), text("PITCH"), range(-2, 2, 1, 1, 0.0)  $SLIDER1
hslider bounds(0, 55, 200, 20), channel("Stretch1"), text("STRETCH"), range(0.01, 2, 0.287, 1, 0.001) $SLIDER1
hslider bounds(210, 30, 200, 20), channel("Density1"), text("DENSITY"), range(2, 20, 8, 1, 0.001) $SLIDER1
hslider bounds(210, 55, 200, 20), channel("Size1"), text("SIZE"), range(0.01, 1, 0.43, 0.5, 0.001) $SLIDER1
hslider bounds(420, 30, 200, 20), channel("Start"), text("START"), range(0, 1, 0, 1, 0.001) $SLIDER1 
hslider bounds(420, 55, 200, 20), channel("End"), text("END"), range(0, 1, 1, 1, 0.001) $SLIDER1 
hslider bounds(630, 30, 200, 20), channel("Filter1"), text("FREQ"), range(10, 9000, 4000, 0.5, 0.001) $SLIDER1 
combobox bounds(633, 55, 70, 20), channel("Type1"), items("LPF", "HPF")
}



groupbox bounds(16,545,400,150), colour(0,0,0,0), lineThickness(0),outlineThickness(0), outlineColour(255,255,255,100){
label bounds(5,0,400,16), align("left"), text("GRANULAR MODULATIONS ----------------------------------"), fontSize(15) 
    hslider bounds(0,30, 200, 20), channel("GrainModRate1"), range(0,10,1,0.5,0.001), text ("RATE") $SLIDER1
    hslider bounds(0,55, 200, 20), channel("GrainModAmount1"), range(0,1,0.3,1,0.001), text ("AMOUNT") $SLIDER1
    combobox bounds(0, 88, 100, 20), items("Pitch", "Stretch", "Density", "Grain Size", "Start", "End", "Filter Freq"), channel("GrainLFODest1"), value(3)
    combobox bounds(103, 88, 70, 20), items("Sine","Tri","Square","Saw Up","Saw Dn","Random"), channel("GrainLFOShape1"), value(2)

}

groupbox bounds(225,545,400,150), colour(0,0,0,0), lineThickness(0),outlineThickness(0), outlineColour(255,255,255,100){
    hslider bounds(0,30, 200, 20), channel("GrainModRate2"), range(0,10,1,0.5,0.001), text ("RATE") $SLIDER1
    hslider bounds(0,55, 200, 20), channel("GrainModAmount2"), range(0,1,0,1,0.001), text ("AMOUNT"), value(0.3), $SLIDER1
    combobox bounds(0, 88, 100, 20), items("Pitch", "Stretch", "Density", "Grain Size", "Start", "End", "Filter Freq"), channel("GrainLFODest2"), value(2)
    combobox bounds(103, 88, 70, 20), items("Sine","Tri","Square","Saw Up","Saw Dn","Random"), channel("GrainLFOShape2"), value(6)

}

//# MIXER CONTROLS
groupbox bounds(437,545,500,150), colour(0,0,0,0), lineThickness(0),outlineThickness(0), outlineColour(255,255,255,100){
    label bounds(0,0,400,16), align("left"), text("MASTER BUS ---------------------------------------------"), fontSize(15) 
    hslider bounds(0,30, 200, 20), channel("InputMix"), range(0,1,0.5,1), text ("INPUT") $SLIDER1
    hslider bounds(0,55, 200, 20), channel("SpectralMix"), range(0,1,0.5,1), text ("SPECTRAL") $SLIDER1
    hslider bounds(0,80, 200, 20), channel("GrainMix"), range(0,1,0.5,1), text ("GRAIN") $SLIDER1
    hslider bounds(210,30, 200, 20), channel("Damp"), text("DAMP"), range(0, 1, 0.2, 0.5, 0.001) $SLIDER1 
    hslider bounds(210,55, 200, 20), channel("Space"), text("SPACE"), range(0, 1, 0.25, 1, 0.001) $SLIDER1 
    hslider bounds(210,80, 200, 20), channel("Output"), range(0,2,0.5,0.7,0.001), text ("OUTPUT") $SLIDER1

}

// Signal Display Out
signaldisplay bounds(20, 360, 400, 70), displayType("spectrogram"), backgroundColour(20,20,20), zoom(-1), signalVariable("afftOutL"), skew(0.5)
signaldisplay bounds(440, 360, 400, 70), displayType("spectrogram"), backgroundColour(20,20,20), zoom(-1), signalVariable("afftOutR"), skew(0.5)
}

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5 --displays
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 64
nchnls = 2
0dbfs = 1
seed 0

gifftsize = 1024
gibinpts = 513
gibands = 64
gidefaultVal = 0.7

#include "includes/ImpulseTables.orc" 

massign 0, 0

// # TABLE ALLOCATIONS
giEmptyGrid ftgen 97, 0, gibands, 7, gibands

gimaskL ftgen 98, 0, gibinpts, -2, 0
gimaskR ftgen 99, 0, gibinpts, -2, 0
gigraphL ftgen 101, 0, gibands, -7, gidefaultVal*0.7, gibands/2, gidefaultVal*0.4, gibands/2, gidefaultVal*0.3
gigraphR ftgen 102, 0, gibands, -7, gidefaultVal*0.7, gibands/2, gidefaultVal*0.3, gibands/2, gidefaultVal*0.3

giDelTableL ftgen 103, 0, gibands, -7, gidefaultVal*0.5, gibands/4, gidefaultVal*0.8, gibands/4, gidefaultVal*0.5, gibands/4, gidefaultVal*0.3, gibands/4, gidefaultVal*0.5
gidelL ftgen 104, 0, 1024, -2, 0
giDelTableR ftgen 105, 0, gibands, -7, gidefaultVal*0.3, gibands/4, gidefaultVal*0.7, gibands/4, gidefaultVal*0.5, gibands/4, gidefaultVal*0.7, gibands/4, gidefaultVal*0.5
gidelR ftgen 106, 0, 1024, -2, 0

giFBTableL ftgen 107, 0, gibands, -7, gidefaultVal*0.2, gibands/2, gidefaultVal*0.4, gibands/2, gidefaultVal
gifbL ftgen 108, 0, 1024, -2, 0
giFBTableR ftgen 109, 0, gibands, -7, gidefaultVal*0.5, gibands/2, gidefaultVal*0.6, gibands/2, gidefaultVal
gifbR ftgen 110, 0, 1024, -2, 0

gimask ftgen 111, 0, gibands, -2, 0
giwin ftgen 1, 0, 8192, 20, 2, 1  ;Hanning window

giRecBuf1L ftgen	0,0,262144,2,0 ; circular buffer for live input
giRecBuf1R ftgen	0,0,262144,2,0

gisr = sr

opcode updateTable, 0, kS
    kTable, SVGChannel xin
    kCnt init 0
    kAmp init 1
    kBounds[] cabbageGet SVGChannel, "bounds"
    kcolour[] cabbageGet SVGChannel, "colour"
    kLength = gibands
    kRectWidth = 0.1 ;kBounds[2] / kLength
    SPath init ""
   while kCnt < kLength do      
        kAmp = 1-table(kCnt, i(kTable))
        SPath strcatk SPath, sprintfk({{
        <rect x="%d" y="%f" width="%d" height="%d" style="fill:rgba(90,99,241,0.0);stroke-width:1;stroke:rgba(%d,%d,%d,0.8)" />}}, 
        kCnt/kLength * kBounds[2], kBounds[3]*kAmp, kRectWidth, kBounds[3]-kBounds[3]*kAmp, kcolour[0], kcolour[1], kcolour[2])  
        kCnt += 1
    od
    cabbageSet 1, SVGChannel, "svgElement", SPath
    kCnt = 0 
    SPath strcpyk "" 
endop

opcode mouseListen, 0, iS
    iTable, SVGChannel xin
    iTableBounds[] cabbageGet SVGChannel, "bounds"
    iLength = gibands
    kMouseX chnget "MOUSE_X"
    kMouseY chnget "MOUSE_Y"
    kMouseDown chnget "MOUSE_DOWN_LEFT"
    SWidget, kTrigWidgetChange cabbageGet "CURRENT_WIDGET" 
    itableRight = iTableBounds[0] + iTableBounds[2]
    if strcmpk(SWidget, SVGChannel) == 0 && kMouseDown == 1 && kMouseX > iTableBounds[0] && kMouseX < itableRight then
        kYAmp = 1 - int(((kMouseY-iTableBounds[1])/iTableBounds[3])*10)/ 10
        printk2 kYAmp
        kXIndex = int(((kMouseX-iTableBounds[0]) / iTableBounds[2])*iLength) 
        tabw kYAmp, kXIndex, iTable
        if changed:k(kXIndex) == 1 then
            updateTable iTable, SVGChannel
        endif
    endif
endop

//# AUDIO ROUTER
opcode audioRoute, aaaa, aaaaaak
    ainL, ainR, aSpecL, aSpecR, aGrainL, aGrainR, kroute xin ;1 = line in, 2 = spectral, 3 = granular
    if kroute == 1 then 
        aSpecInL = ainL
        aSpecInR = ainR
        aGrainInL = ainL
        aGrainInR = ainR
        ;printks "Parallel\n", 2
    elseif kroute == 2 then
        aSpecInL = ainL
        aSpecInR = ainR
        aGrainInL = aSpecL
        aGrainInR = aSpecR
        ;printks "Spec>Grain\n", 2
    elseif kroute == 3 then
        aGrainInL = ainL
        aGrainInR = ainR
        aSpecInL = aGrainL
        aSpecInR = aGrainR
        ;printks "Spec>Grain\n", 2
    endif
    xout aSpecInL, aSpecInL, aGrainInL, aGrainInR 
endop

//# MODROUTER
opcode modroute, kkkkkkk, kkkkk
    kmodAmt, kmodRate, kmodDest, kshape, kmethod xin ; kmethod, which routing matrix is it? 1 = spectral, 2 = granular
    kout1, kout2, kout3, kout4, kout5, kout6, kout7 init 0
    if kshape == 1 then 
       klfo = abs(lfo(kmodAmt, kmodRate, 0)) ; sine
    elseif kshape == 2 then 
        klfo = abs(lfo(kmodAmt, kmodRate, 1)) ; triangle
    elseif kshape == 3 then 
        klfo = abs(lfo(kmodAmt, kmodRate, 3)) ; square
    elseif kshape == 4 then 
        klfo = abs(lfo(kmodAmt, kmodRate, 5)) ; saw up
    elseif kshape == 5 then 
        klfo = abs(lfo(kmodAmt, kmodRate, 4)) ; saw down
    endif
    if  kshape == 6 then ; if random lfo is chosen       
        ksampHold = abs(randh(kmodAmt, kmodRate))
        klfo = portk(ksampHold, 0.01) ; smooth sample & hold 10ms
    endif
    
    if kmethod == 1 then
        kmod1 = kmodDest < 4 ? klfo : 1     ;kmod1 = filter
        if kmodDest > 3  && kmodDest < 7 then
            kmod2 = klfo            ; kmod2 = delay
        else 
            kmod2 = 1
        endif
        kmod3 = kmodDest > 6 ? klfo : 0     ;kmod3 = feedback
    
    // Is the right or left channel routed to mod?
    //Left Channel
     if kmodDest == 1 || kmodDest == 3 then
        kout1 = kmod1 ;filter mod
     else 
        kout1 = 0
     endif
     if kmodDest == 4 || kmodDest == 6 then
        kout2 = kmod2 ;del mod
     else 
        kout2 = 0
     endif
     if kmodDest == 7 || kmodDest == 9 then
        kout3 = kmod3 ;fb mod
     else 
        kout3 = 0
     endif
     
     //Right Channel
     if kmodDest == 2 || kmodDest == 3 then
        kout4 = kmod1       ;filter mod
     else 
        kout4 = 0
     endif
     if kmodDest == 5 || kmodDest == 6 then
        kout5 = kmod2       ;delay mod
     else 
        kout5 = 0
     endif
     if kmodDest == 8 || kmodDest == 9 then
        kout6 = kmod3       ;feedback mod
     else 
        kout6 = 0
     endif
    
    
    elseif kmethod == 2 then                    ;Outputs 1=pitch, 2=stretch, 3=dens, 4=size, 5=start, 6=end, 7=freq
        kout1 = kmodDest == 1 ? klfo : 0
        kout2 = kmodDest == 2 ? klfo : 0
        kout3 = kmodDest == 3 ? klfo : 0
        kout4 = kmodDest == 4 ? klfo : 0
        kout5 = kmodDest == 5 ? klfo : 0
        kout6 = kmodDest == 6 ? klfo : 0
        kout7 = kmodDest == 7 ? klfo : 0
    endif
    
    xout kout1, kout2, kout3, kout4, kout5, kout6, kout7

endop


opcode renderFile, 0, aaS
    setksmps 1
    ainL, ainR, Sfilename xin	
    fout Sfilename, 18, ainL, ainR
endop
        
instr 1
kinitTables init 0
cabbageSet "RecordMode", sprintf("populate(\"*\", \"%s\")", chnget:S("USER_HOME_DIRECTORY"))

if kinitTables < 1 then
    updateTable 102, "attenMatrixR"
    updateTable 101, "attenMatrixL"
    updateTable 105, "DelMatrixR"
    updateTable 103, "DelMatrixL"
    updateTable 109, "FBMatrixR"
    updateTable 107, "FBMatrixL"
    kinitTables = 100
endif
 

gSFile=chnget:S("File")
gSDroppedSFile, kDroppedTrig cabbageGet "LAST_FILE_DROPPED"
if kDroppedTrig == 1 then
   ;gSFile sprintfk "%s", gSDroppedSFile
   cabbageSetValue "File", gSDroppedSFile, kDroppedTrig
   ;cabbageSet 1, "File", gSDroppedSFile
endif


if changed(gSFile) > 0 then 
    turnoff2 2, 0, 0
        kpos  strrindexk gSFile, "/"  ;look for the rightmost '/'
        Snam   strsubk    gSFile, kpos+1, -1    ;extract the substring
        Snam   strsubk    Snam, 0, 12 ; truncate string to x characters so it fits in display
        SMessage sprintfk "text(\"%s\") ", Snam
        cabbageSet 1, "File", SMessage
endif 

// play logic, is sample loaded? is it in live or file input etc....

kinputmode, kinputChange cabbageGet "InputMode"
    
if kinputmode < 1 then ; if file input is selected
    cabbageSet kinputChange, "File", sprintfk("active(%i), alpha(1)", 1)
    cabbageSet kinputChange, "PlayMode", sprintfk("active(%i), alpha(1)", 1)
    ki2 active 2 
    if ki2 > 0 && chnget:k("PlayMode") < 1 then; turn off running instance of 2
        turnoff2 2, 0, 0
    endif 
    if strlenk(gSFile) > 1 && ki2 < 1 && chnget:k("PlayMode") > 0  then ;if a file is loaded and play mode is activated
        event "i", 2, 0, 500000 
        cabbageSet metro(20), "SampleWarning", "alpha", "0" 
    elseif strlenk(gSFile) < 1 && ki2 < 1 && chnget:k("PlayMode") > 0 then ;if no sample is loaded
        cabbageSetValue "PlayMode", 0, metro(20)
        cabbageSet metro(20), "SampleWarning", "alpha", "1"
    endif   
elseif kinputmode > 0 && kinputChange > 0 then
    event "i", 2, 0, 500000  ; run intr 2 for live input
    cabbageSet kinputChange, "File", sprintfk("active(%i), alpha(0.5)", 0)
    cabbageSet kinputChange, "PlayMode", sprintfk("active(%i), alpha(0.5)", 0)
    cabbageSet kinputChange, "SampleWarning", "alpha", "0"
endif

mouseListen 101, "attenMatrixL"
mouseListen 102, "attenMatrixR"
mouseListen 103, "DelMatrixL"
mouseListen 105, "DelMatrixR"
mouseListen 107, "FBMatrixL"
mouseListen 109, "FBMatrixR"

//# RANDOM Function
if changed(chnget:k("Random")) > 0 then
    if chnget:k("Random") > 0 then
    krandcnt = 0
    loadRandVals:
    if krandcnt < gibands then
        kval101 = abs(rand(0.9,0))
        kval102 = abs(rand(0.9,1))
        kval103 = abs(rand(0.9,5))
        kval105 = abs(rand(0.9,3))
        kval107 = abs(rand(0.9,4))
        kval109 = abs(rand(0.9,0.5))
        tabw kval101, krandcnt, 101
        tabw kval102, krandcnt, 102
        tabw kval103, krandcnt, 103
        tabw kval105, krandcnt, 105
        tabw kval107, krandcnt, 107
        tabw kval109, krandcnt, 109
        krandcnt += 1
        kgoto loadRandVals
    endif
    updateTable 102, "attenMatrixR"
    updateTable 101, "attenMatrixL"
    updateTable 105, "DelMatrixR"
    updateTable 103, "DelMatrixL"
    updateTable 109, "FBMatrixR"
    updateTable 107, "FBMatrixL" 
    endif  
endif

kLModeVal, kLmode cabbageGet "TimeFeedModeL"
if kLModeVal == 0 then
    cabbageSet kLmode, "attenMatrixL", sprintfk("toFront(%i)", 1)
elseif kLModeVal == 1 then
    cabbageSet kLmode, "DelMatrixL", sprintfk("toFront(%i)", 1)
elseif kLModeVal == 2 then
    cabbageSet kLmode, "FBMatrixL", sprintfk("toFront(%i)", 1)
endif

kRModeVal, kRmode cabbageGet "TimeFeedModeR"
if kRModeVal == 0 then
    cabbageSet kRmode, "attenMatrixR", sprintfk("toFront(%i)", 1)
elseif kRModeVal == 1 then
    cabbageSet kRmode, "DelMatrixR", sprintfk("toFront(%i)", 1)
elseif kRModeVal == 2 then
    cabbageSet kRmode, "FBMatrixR", sprintfk("toFront(%i)", 1)
endif

    
//# Table Copy Function
if chnget:k("CopyL") > 0 &&  kLModeVal == 0 then ; Left copy button is activated and its in filter mode
    tablecopy gigraphR, gigraphL
    updateTable 102, "attenMatrixR"
elseif chnget:k("CopyR") > 0 &&  kRModeVal == 0 then 
    tablecopy gigraphL, gigraphR
    updateTable 101, "attenMatrixL"
elseif chnget:k("CopyL") > 0 &&  kLModeVal == 1 then 
    tablecopy giDelTableR, giDelTableL
    updateTable 105, "DelMatrixR"
elseif chnget:k("CopyR") > 0 && kRModeVal == 1 then 
    tablecopy giDelTableL, giDelTableR
    updateTable 103, "DelMatrixL"
elseif chnget:k("CopyL") > 0 && kLModeVal == 2 then  
    tablecopy giFBTableR, giFBTableL
    updateTable 109, "FBMatrixR"
elseif chnget:k("CopyR") > 0 && kRModeVal == 2 then  
    tablecopy giFBTableL, giFBTableR
    updateTable 107, "FBMatrixL"
endif

//# RENDERING
gSSaveFile, kTrigRecord cabbageGetValue "RecordMode"
schedkwhennamed kTrigRecord, 0, 1, 100, 0, 500000
gkStopButton, kTrigStop cabbageGetValue "StopMode"
    krecordIsOn active 100
    if kTrigStop > 0 then
    turnoff2 100, 0, 0
    cabbageSet kTrigStop, "RecordMode", sprintfk("bounds(%i, 20, 60, 20)", 195)
    cabbageSet kTrigStop, "StopMode", sprintfk("bounds(%i, 20, 60, 20)", 3000)
    cabbageSetValue "StopMode", 0, kTrigStop
    endif
 
    cabbageSet kTrigRecord, "RecordMode", sprintf("bounds(%i, 20, 60, 20)", 3000)
    cabbageSet kTrigRecord, "StopMode", sprintf("bounds(%i, 20, 60, 20)", 195)

//# Widget value text
    kMouseX chnget "MOUSE_X"
    kMouseY chnget "MOUSE_Y"

    SliderChannels[] cabbageGetWidgetChannels "_isSlider(\"yes\")"
    Scontrol, krsliderChanged cabbageChanged SliderChannels
    kRsliderVal, kvalChanged cabbageGetValue Scontrol
    SnewText = sprintfk("%.2f", kRsliderVal)
    if krsliderChanged > 0 then 
    cabbageSet krsliderChanged, "SliderValue", sprintfk{{ bounds(%d, %d, 100, 20) text(%s) visible(1) }}, kMouseX-40, kMouseY-30, SnewText)
    else
    cabbageSet metro(0.7), "SliderValue", sprintfk{{ bounds(%d, %d, 100, 20) text(%s) visible(0) }}, 3000, kMouseY-30, SnewText)
    endif

//# IR Management  
 
    kverbtype, kverbchanged cabbageGetValue "ReverbType"
    kImpulseNum, kImpulseChanged cabbageGet "IR"
    kImpulseTable = 200+kImpulseNum

    if kverbtype == 1 then
        cabbageSet kverbchanged, "IR", sprintfk("active(%i), alpha(0.5)", 0)
        cabbageSet kverbchanged, "impulsesLabel", sprintfk("active(%i), alpha(0.5)", 0)
    else 
        cabbageSet kverbchanged, "IR", sprintfk("active(%i), alpha(1)", 1)
        cabbageSet kverbchanged, "impulsesLabel", sprintfk("active(%i), alpha(1)", 1)        
    endif
    
    if kImpulseChanged > 0 || kverbchanged > 0 then
        turnoff2 98, 0, 0
        event "i", 98, 0, 500000, kverbtype, kImpulseTable
    endif
    
endin

   
instr 2
kdx init 0
aSpecInL, aSpecInR, aGrainInL, aGrainInR init 0
ioverlap = gifftsize*0.25
iwinsize = gifftsize*2
imaxlen = 5 ;max length of delay buffer

aInputL inch 1
aInputR inch 2

        if strlen(gSFile) > 0 then  
        iNChns  filenchnls  gSFile
        if iNChns==2 then
            aDiskL, aDiskR diskin gSFile,1,0,1
        else
            aDiskL diskin gSFile,1,0,1
            aDiskR diskin gSFile,1,0,1
        endif
        endif

if chnget:k("InputMode") < 1 then ;if disk stream mode
    ainputL = aDiskL
    ainputR = aDiskR
else 
    ainputL = aInputL*chnget:k("Gain")
    ainputR = aInputR*chnget:k("Gain")
endif

ainL = ainputL*chnget:k("Gain")
ainR = ainputR*chnget:k("Gain")

;Write input to buffer
    itablelength = ftlen(giRecBuf1L)
	    kndx = (1/(itablelength/gisr)) ;speed calculation for phasor
	    andx phasor kndx
	    tablew   aGrainInL, andx, giRecBuf1L,1 ; write audio to buffer
 	    tablew   aGrainInR, andx, giRecBuf1R,1 
  
fftinL  pvsanal   aSpecInL, gifftsize, ioverlap, iwinsize, 1
fftinR  pvsanal   aSpecInR, gifftsize, ioverlap, iwinsize, 1

//# SPECTRAL MODULATION
    kshape1_Spectral chnget "SpectralLFOShape1" 
    kmodDest1_Spectral = chnget:k("SpectralLFODest1")
    kmodAmt1_Spectral = chnget:k("SpectralModAmount1")
    kmodRate1_Spectral = chnget:k("SpectralModRate1")
    kshape2_Spectral chnget "SpectralLFOShape2"
    kmodDest2_Spectral = chnget:k("SpectralLFODest2")
    kmodAmt2_Spectral = chnget:k("SpectralModAmount2")
    kmodRate2_Spectral = chnget:k("SpectralModRate2")
    kattenmod1L, kdelmod1L, kfbmod1L, kattenmod1R, kdelmod1R, kfbmod1R, knothing modroute kmodAmt1_Spectral, kmodRate1_Spectral, kmodDest1_Spectral, kshape1_Spectral, 1
    kattenmod2L, kdelmod2L, kfbmod2L, kattenmod2R, kdelmod2R, kfbmod2R, knothing modroute kmodAmt2_Spectral, kmodRate2_Spectral, kmodDest2_Spectral, kshape2_Spectral, 1
    

//copy tables to full res masks
tablecopy gimaskL, gigraphL
tablecopy gidelL, giDelTableL
tablecopy gifbL, giFBTableL

tablecopy gimaskR, gigraphR
tablecopy gidelR, giDelTableR
tablecopy gifbR, giFBTableR

; if FB mod dest is routed then begin modulation
if kfbmod1L > 0 || kfbmod2L > 0 then
    // scale gifbl to modulate it
    kfbarrayL[] init gibands ;create array to store fb values
    copyf2array kfbarrayL, giFBTableL ; copy fb table to array (for scaling)
    kFBModSumL = limit(kfbmod1L+kfbmod2L, 0, 1) ; sum both mod signals and limit to acceptable range
    scalearray kfbarrayL, 0, 1-kFBModSumL ; scale vals in fb table based on lfo val
    copya2ftab kfbarrayL, gifbL ; copy array to gifb masking table
endif

if kfbmod1R > 0 || kfbmod2R > 0 then
    kfbarrayR[] init gibands ;create array to store fb values
    copyf2array kfbarrayR, giFBTableR ; copy fb table to array (for scaling)
    kFBModSumR = limit(kfbmod1R+kfbmod2R, 0, 1) ; sum both mod signals and limit to acceptable range
    scalearray kfbarrayR, 0, 1-kFBModSumR ; scale vals in fb table based on lfo val
    copya2ftab kfbarrayR, gifbR ; copy array to gifb masking table
endif

fdelmaskL pvsinit gifftsize
kAttenModSumL = limit(kattenmod1L+kattenmod2L, 0, 1) ; sum both mod signals and limit to acceptable range
fmaskL pvsmaska fftinL, gimaskL, 1-kAttenModSumL
//Left Delay Line and Buffer

ffbL pvsmix fmaskL, fdelmaskL ; mix feedback mask back into buffer
ibufL, kwriteTimeL pvsbuffer ffbL, imaxlen
fdelL pvsbufread2 kwriteTimeL, ibufL, gidelL, gidelL ;ift 1 & 2 at least n/2 + 1 positions long. n= # bins
kDelModSumL = limit(kdelmod1L+kdelmod2L, 0, 1) ; sum both mod signals and limit to acceptable range
fdelmaskL pvsmaska fdelL, gifbL, 1-(kDelModSumL) ; mask fdelL with feedback table
aSpectralOutL    pvsynth  fdelL

fdelmaskR pvsinit gifftsize
kAttenModSumR = limit(kattenmod1R+kattenmod2R, 0, 1) ; sum both mod signals and limit to acceptable range
fmaskR pvsmaska fftinR, gimaskR, 1-kAttenModSumR
//Right Delay Line and Buffer
ffbR pvsmix fmaskR, fdelmaskR ; mix feedback mask back into buffer
ibufR, kwriteTimeR pvsbuffer ffbR, imaxlen
fdelR pvsbufread2 kwriteTimeR, ibufR, gidelR, gidelR ;ift 1 & 2 at least n/2 + 1 positions long. n= # bins
kDelModSumR = limit(kdelmod1R+kdelmod2R, 0, 1) ; sum both mod signals and limit to acceptable range
fdelmaskR pvsmaska fdelR, gifbR, 1-kDelModSumR ; mask fdelR with feedback table

aSpectralOutR    pvsynth  fdelR

afftOutL = aSpectralOutL
afftOutR = aSpectralOutR
dispfft afftOutL, 0.1, 2048, 0, 1
dispfft afftOutR, 0.1, 2048, 0, 1

//# GRANULAR SECTION

  klev1 = 0.5 ;*chnget:k("Gain") ;chnget "Volume1"
  kdens1 chnget "Density1"
  kgrsize1 chnget "Size1"
  kpitch1 chnget "Pitch1"
  kstr1 chnget "Stretch1"
  kstart1 chnget "Start"
  kend1 chnget "End"
  kfiltType1 chnget "Type1"
  kfilt1 chnget "Filter1"
  kverbsend1 chnget "Space"
  kshape1_Grain chnget "GrainLFOShape1" 
  kmodDest1_Grain = chnget:k("GrainLFODest1")
  kmodAmt1_Grain = chnget:k("GrainModAmount1")
  kmodRate1_Grain = chnget:k("GrainModRate1")
  kshape2_Grain chnget "GrainLFOShape2"
  kmodDest2_Grain = chnget:k("GrainLFODest2")
  kmodAmt2_Grain = chnget:k("GrainModAmount2")
  kmodRate2_Grain = chnget:k("GrainModRate2")
      kPitchMod1, kStretchMod1, kDensityMod1, kSizeMod1, kStartMod1, kEndMod1, kFilterMod1 modroute kmodAmt1_Grain, kmodRate1_Grain, kmodDest1_Grain, kshape1_Grain, 2
      kPitchMod2, kStretchMod2, kDensityMod2, kSizeMod2, kStartMod2, kEndMod2, kFilterMod2 modroute kmodAmt2_Grain, kmodRate2_Grain, kmodDest2_Grain, kshape2_Grain, 2
        iolaps  = 2 ; must be no more thn max(kfreq)*max(kgrsize)
	    ips     = 1/iolaps
	    iTableLenInSeconds = itablelength/gisr
	    // Scale and sum mods 1 and 2 if they happen to be routed to same destination
	    kdensSum = limit(kDensityMod1+kDensityMod2, 0, 1)
	    kpitchSum = limit(kPitchMod1+kPitchMod2, 0, 1)
	    kgrsizeSum = limit(kSizeMod1+kSizeMod2, 0, 1)
	    kstartSum = limit(kStartMod1+kStartMod2, 0, 1)
	    kendSum = limit(kEndMod1+kEndMod2, 0, 1)
	    kfilterSum = limit(kFilterMod1+kFilterMod2, 0, 1)
	    
	    kdens1 = kdens1-(kdens1*kdensSum)
	    kpitch1 = kpitch1-(kpitch1*kpitchSum)
	    kgrsize1 = kgrsize1-(kgrsize1*kgrsizeSum)
	    kstart1 = kstart1-(kstart1*kstartSum)
	    kend1 = kend1-(kend1*kendSum)
	    kfilt1 = kfilt1-(kfilt1*kfilterSum)
	    kendInSec = iTableLenInSeconds*kend1
	    kstartInSec = iTableLenInSeconds*kstart1
	    kendInSec_ = kendInSec < kstartInSec+0.1 ? kstartInSec+0.1 : kendInSec ;keep kstart and kend from overtaking each other
	    kstartInSec_ = kstartInSec > kendInSec-0.1 ? kendInSec-0.1 : kstartInSec
        a1L syncloop klev1, kdens1, kpitch1, kgrsize1, ips*kstr1, kstartInSec_, kendInSec_, giRecBuf1L, giwin, iolaps
		a1R syncloop klev1, kdens1, kpitch1, kgrsize1, ips*kstr1, kstartInSec_, kendInSec_, giRecBuf1R, giwin, iolaps
		kseglenInHz = 1/(kendInSec_ - kstartInSec_)
	    kfade loopseg kseglenInHz, 0, 0, 0, 0.2, 1, 0.6, 1, 0.2 ; might need fade on table write?
        print iTableLenInSeconds
        kq = 0
  	    alow1L, ahigh1L, aband1L svfilter a1L*kfade, kfilt1, 1
  	    alow1R, ahigh1R, aband1R svfilter a1R*kfade, kfilt1, 1
        
        if kfiltType1 == 1 then
            agrainmixL = alow1L * chnget:k("GrainMix")
		    agrainmixR = alow1R * chnget:k("GrainMix")
		else 
		    agrainmixL = ahigh1L * chnget:k("GrainMix")
		    agrainmixR = ahigh1R * chnget:k("GrainMix")
        endif

aSpecmixL = aSpectralOutL*chnget:k("SpectralMix") 
aSpecmixR = aSpectralOutR*chnget:k("SpectralMix")         
aInputMixL = ainL*chnget:k("InputMix")
aInputMixR = ainR*chnget:k("InputMix")
aSpecInL, aSpecInR, aGrainInL, aGrainInR audioRoute ainL, ainR, aSpecmixL, aSpecmixR, agrainmixL, agrainmixR, chnget:k("audioRouting")

amixL = agrainmixL+aSpecmixL+aInputMixL
amixR = agrainmixR+aSpecmixR+aInputMixR

amixL_limit = limit(amixL, -0.98, 0.98)
amixR_limit = limit(amixR, -0.98, 0.98)
chnmix amixL_limit, "drymixL"
chnmix amixR_limit, "drymixR"
chnset amixL_limit*kverbsend1, "verbsendL"
chnset amixR_limit*kverbsend1, "verbsendR"

endin

instr reverb, 98
 
ainL chnget "verbsendL"
ainR chnget "verbsendR"
iImpulseTable = p5 
iverbType = p4  
if iverbType == 1 then
    aRevL, aRevR reverbsc ainL, ainR, 0.9, 15000 ;15000*(1-chnget:k("Damp"))
else 
    aRevcL ftconv ainL, iImpulseTable, 2048
    aRevcR ftconv ainR, iImpulseTable, 2048 
    aRevL = aRevcL*0.1 ; adjust gain of convol b/c it's loud
    aRevR = aRevcR*0.1
endif
;rireturn
;if kImpulseChanged > 0 then
;    reinit loadImpulse
;endif 

aRevfL lpf18 aRevL, 15000*(1-chnget:k("Damp")), 0.01, 0
aRevfR lpf18 aRevR, 15000*(1-chnget:k("Damp")), 0.01, 0

chnset aRevfL, "verbReturnL"
chnset aRevfR, "verbReturnR"
chnclear "verbsendL"
chnclear "verbsendR"
endin

instr mixer, 99

adryL chnget "drymixL"
adryR chnget "drymixR"

areverbL chnget "verbReturnL"
areverbR chnget "verbReturnR"

koutput chnget "Output"

amixL = (adryL+areverbL)*koutput
amixR = (adryR+areverbR)*koutput
chnset (adryL+areverbL)*koutput, "RecordBusL"
chnset (adryR+areverbR)*koutput, "RecordBusR"
outs amixL, amixR

/* Render to opcode 
gSSaveFile, kTrigRecord cabbageGetValue "RecordMode"
krecordVal, krecordValTrig cabbageGetValue "RecordMode"

    if krecordVal > 0 then
       Sfilename strcatk  gSSaveFile, ".wav"
       renderFile amixL, amixR, Sfilename 
       printk2 krecordVal   
    endif
*/

chnclear "drymixL"
chnclear "drymixR"
chnclear "verbReturnL"
chnclear "verbReturnR"

endin

instr 100 ;recorder
    
    prints "recording started\n"

	;amixL, amixR monitor
	
	amixL chnget "RecordBusL"
    amixR chnget "RecordBusR"
    
    ;Sfilename strcat  gSSaveFile, ".wav"
	;fout Sfilename, 18, amixL, amixR
	renderFile amixL, amixR, gSSaveFile 

endin


</CsInstruments>
<CsScore>
i1 0 500000
i98 0 500000 ;reverb
i99 0 500000 ; mixer
</CsScore>
</CsoundSynthesizer>
