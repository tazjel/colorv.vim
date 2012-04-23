"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Script: ColorV
"    File: autoload/colorv.vim
" Summary: A vim plugin tries to make handling colors easier.
"  Author: Rykka <Rykka10(at)gmail.com>
"    Home: https://github.com/Rykka/ColorV
" Version: 2.5.6
" Last Update: 2012-04-23
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:save_cpo = &cpo
set cpo&vim
if version < 700 || exists("g:loaded_ColorV") | finish
else             | let g:loaded_ColorV = 1  | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"GVAR: "{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:colorv={}
let g:colorv.version="2.5.6"

let g:colorv.HEX="FF0000"
let g:colorv.RGB={'R':255 , 'G':0   , 'B':0   }
let g:colorv.HSV={'H':0   , 'S':100 , 'V':100 }
let g:colorv.HLS={'H':0   , 'L':50  , 'S':100 }
let g:colorv.YIQ={'Y':30  , 'I':60  , 'Q':21  }
let g:colorv.rgb=[255 , 0   , 0   ]
let g:colorv.hls=[0   , 50  , 100 ]
let g:colorv.yiq=[30  , 60  , 21  ]
let g:colorv.hsv=[0   , 100 , 100 ]
let g:colorv.NAME="Red"

"SVAR: {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:ColorV = {}
let s:ColorV.name="_ColorV_".g:colorv.version
let s:ColorV.listname="_ColorVList_".g:colorv.version
let s:size = "mid"
let s:mode = has("gui_running") ? "gui" : "cterm"
let s:path = expand('<sfile>:p:h').'/'
"colorname list "{{{
let s:a='Uryyb'
let s:t='fghDPijmrYFGtudBevwxklyzEIZOJLMnHsaKbcopqNACQRSTUVWX'
let s:e='stuQCvwzeLSTghqOrijkxylmRVMBWYZaUfnXopbcdANPDEFGHIJK'

let s:aprx_rate=5
let s:tune_step=4
"X11 Standard
let s:clrn =[
\  ['AliceBlue'           , 'F0F8FF'], ['AntiqueWhite'        , 'FAEBD7']
\, ['Aqua'                , '00FFFF'], ['Aquamarine'          , '7FFFD4']
\, ['Azure'               , 'F0FFFF'], ['Beige'               , 'F5F5DC']
\, ['Bisque'              , 'FFE4C4'], ['Black'               , '000000']
\, ['BlanchedAlmond'      , 'FFEBCD'], ['Blue'                , '0000FF']
\, ['BlueViolet'          , '8A2BE2'], ['Brown'               , 'A52A2A']
\, ['BurlyWood'           , 'DEB887'], ['CadetBlue'           , '5F9EA0']
\, ['Chartreuse'          , '7FFF00'], ['Chocolate'           , 'D2691E']
\, ['Coral'               , 'FF7F50'], ['CornflowerBlue'      , '6495ED']
\, ['Cornsilk'            , 'FFF8DC'], ['Crimson'             , 'DC143C']
\, ['Cyan'                , '00FFFF'], ['DarkBlue'            , '00008B']
\, ['DarkCyan'            , '008B8B'], ['DarkGoldenRod'       , 'B8860B']
\, ['DarkGray'            , 'A9A9A9'], ['DarkGreen'           , '006400']
\, ['DarkKhaki'           , 'BDB76B'], ['DarkMagenta'         , '8B008B']
\, ['DarkOliveGreen'      , '556B2F'], ['Darkorange'          , 'FF8C00']
\, ['DarkOrchid'          , '9932CC'], ['DarkRed'             , '8B0000']
\, ['DarkSalmon'          , 'E9967A'], ['DarkSeaGreen'        , '8FBC8F']
\, ['DarkSlateBlue'       , '483D8B'], ['DarkSlateGray'       , '2F4F4F']
\, ['DarkTurquoise'       , '00CED1'], ['DarkViolet'          , '9400D3']
\, ['DeepPink'            , 'FF1493'], ['DeepSkyBlue'         , '00BFFF']
\, ['DimGray'             , '696969'], ['DodgerBlue'          , '1E90FF']
\, ['FireBrick'           , 'B22222'], ['FloralWhite'         , 'FFFAF0']
\, ['ForestGreen'         , '228B22'], ['Fuchsia'             , 'FF00FF']
\, ['Gainsboro'           , 'DCDCDC'], ['GhostWhite'          , 'F8F8FF']
\, ['Gold'                , 'FFD700'], ['GoldenRod'           , 'DAA520']
\, ['GreenYellow'         , 'ADFF2F'], ['HoneyDew'            , 'F0FFF0']
\, ['HotPink'             , 'FF69B4'], ['IndianRed'           , 'CD5C5C']
\, ['Indigo'              , '4B0082'], ['Ivory'               , 'FFFFF0']
\, ['Khaki'               , 'F0E68C'], ['Lavender'            , 'E6E6FA']
\, ['LavenderBlush'       , 'FFF0F5'], ['LawnGreen'           , '7CFC00']
\, ['LemonChiffon'        , 'FFFACD'], ['LightBlue'           , 'ADD8E6']
\, ['LightCoral'          , 'F08080'], ['LightCyan'           , 'E0FFFF']
\, ['LightGoldenRodYellow', 'FAFAD2'], ['LightGrey'           , 'D3D3D3']
\, ['LightGreen'          , '90EE90'], ['LightPink'           , 'FFB6C1']
\, ['LightSalmon'         , 'FFA07A'], ['LightSeaGreen'       , '20B2AA']
\, ['LightSkyBlue'        , '87CEFA'], ['LightSlateGray'      , '778899']
\, ['LightSteelBlue'      , 'B0C4DE'], ['LightYellow'         , 'FFFFE0']
\, ['Lime'                , '00FF00'], ['LimeGreen'           , '32CD32']
\, ['Linen'               , 'FAF0E6'], ['Magenta'             , 'FF00FF']
\, ['MediumAquaMarine'    , '66CDAA']
\, ['MediumBlue'          , '0000CD'], ['MediumOrchid'        , 'BA55D3']
\, ['MediumPurple'        , '9370D8'], ['MediumSeaGreen'      , '3CB371']
\, ['MediumSlateBlue'     , '7B68EE'], ['MediumSpringGreen'   , '00FA9A']
\, ['MediumTurquoise'     , '48D1CC'], ['MediumVioletRed'     , 'C71585']
\, ['MidnightBlue'        , '191970'], ['MintCream'           , 'F5FFFA']
\, ['MistyRose'           , 'FFE4E1'], ['Moccasin'            , 'FFE4B5']
\, ['NavajoWhite'         , 'FFDEAD'], ['Navy'                , '000080']
\, ['OldLace'             , 'FDF5E6'], ['Olive'               , '808000']
\, ['OliveDrab'           , '6B8E23'], ['Orange'              , 'FFA500']
\, ['OrangeRed'           , 'FF4500'], ['Orchid'              , 'DA70D6']
\, ['PaleGoldenRod'       , 'EEE8AA'], ['PaleGreen'           , '98FB98']
\, ['PaleTurquoise'       , 'AFEEEE'], ['PaleVioletRed'       , 'D87093']
\, ['PapayaWhip'          , 'FFEFD5'], ['PeachPuff'           , 'FFDAB9']
\, ['Peru'                , 'CD853F'], ['Pink'                , 'FFC0CB']
\, ['Plum'                , 'DDA0DD'], ['PowderBlue'          , 'B0E0E6']
\, ['Red'                 , 'FF0000']
\, ['RosyBrown'           , 'BC8F8F'], ['RoyalBlue'           , '4169E1']
\, ['SaddleBrown'         , '8B4513'], ['Salmon'              , 'FA8072']
\, ['SandyBrown'          , 'F4A460'], ['SeaGreen'            , '2E8B57']
\, ['SeaShell'            , 'FFF5EE'], ['Sienna'              , 'A0522D']
\, ['Silver'              , 'C0C0C0'], ['SkyBlue'             , '87CEEB']
\, ['SlateBlue'           , '6A5ACD'], ['SlateGray'           , '708090']
\, ['Snow'                , 'FFFAFA'], ['SpringGreen'         , '00FF7F']
\, ['SteelBlue'           , '4682B4'], ['Tan'                 , 'D2B48C']
\, ['Teal'                , '008080'], ['Thistle'             , 'D8BFD8']
\, ['Tomato'              , 'FF6347'], ['Turquoise'           , '40E0D0']
\, ['Violet'              , 'EE82EE'], ['Wheat'               , 'F5DEB3']
\, ['White'               , 'FFFFFF'], ['WhiteSmoke'          , 'F5F5F5']
\, ['Yellow'              , 'FFFF00'], ['YellowGreen'         , '9ACD32']
\]

let s:cX11 = [['Gray', 'BEBEBE'], ['Green', '00FF00']
            \, ['Maroon', 'B03060'], ['Purple', 'A020F0']]
"W3C Standard
let s:cW3C = [['Gray', '808080'], ['Green', '008000']
            \, ['Maroon', '800000'], ['Purple', '800080']]
let s:clrnW3C = s:clrn + s:cW3C
let s:clrnX11 = s:clrn + s:cX11

let s:clrf=[   ['FF0000', '00FF00', '0000FF', 'Uryyb Jbeyq']
            \, ['0000FF', '00FF00', 'FF0000', 'qyebj byyrU']
            \, ['000000', 'C00000', '009A00', 'Nstunavfgna~']
            \, ['370095', 'FCE015', 'D81B3E', 'Naqbeen~']
            \, ['00257E', 'FFC725', '00257E', 'Oneonqbf~']
            \, ['000000', 'FFDA0C', 'F3172F', 'Orytvhz']
            \, ['007A5E', 'CE1125', 'FCD115', 'Pnzrebba~']
            \, ['FF0000', 'ffffff', 'FF0000', 'Pnanqn~']
            \, ['002468', 'FFCE00', 'D21033', 'Punq']
            \, ['F87F00', 'FFFFFF', '009F60', 'Pbgr q`Vibver']
            \, ['0C1B8B', 'FFFFFF', 'EF2A2C', 'Senapr']
            \, ['87C8E4', 'FFFFFF', '87C8E4', 'Thngrznyn~']
            \, ['CE1125', '00935F', 'FCD115', 'Thvarn']
            \, ['009D5F', 'FFFFFF', 'F77E00', 'Verynaq']
            \, ['008E46', 'FFFFFF', 'D3232C', 'Vgnyl']
            \, ['13B439', 'FCD115', 'CE1125', 'Znyv']
            \, ['016549', 'FFFFFF', 'CD132A', 'Zrkvpb~']
            \, ['0000B2', 'F7D900', '0000B2', 'Zbyqbin~']
            \, ['008851', 'FFFFFF', '008851', 'Avtrevn']
            \, ['188100', 'FFFFFF', '188100', 'Norfolk Island']
            \, ['CC0000', 'FFFFFF', 'CC0000', 'Erchoyvp b Creh']
            \, ['002A7E', 'FCD115', 'CE1125', 'Ebznavn']
            \, ['009246', 'F8F808', 'DD171D', 'Frartny~']
            \]
" dict "{{{
" searching in dict is much faster than list
let s:clrd ={
\  'aliceblue'           : 'F0F8FF', 'antiquewhite'        : 'FAEBD7'
\, 'aqua'                : '00FFFF', 'aquamarine'          : '7FFFD4'
\, 'azure'               : 'F0FFFF', 'beige'               : 'F5F5DC'
\, 'bisque'              : 'FFE4C4', 'black'               : '000000'
\, 'blanchedalmond'      : 'FFEBCD', 'blue'                : '0000FF'
\, 'blueviolet'          : '8A2BE2', 'brown'               : 'A52A2A'
\, 'burlywood'           : 'DEB887', 'cadetblue'           : '5F9EA0'
\, 'chartreuse'          : '7FFF00', 'chocolate'           : 'D2691E'
\, 'coral'               : 'FF7F50', 'cornflowerblue'      : '6495ED'
\, 'cornsilk'            : 'FFF8DC', 'crimson'             : 'DC143C'
\, 'cyan'                : '00FFFF', 'darkblue'            : '00008B'
\, 'darkcyan'            : '008B8B', 'darkgoldenrod'       : 'B8860B'
\, 'darkgray'            : 'A9A9A9', 'darkgreen'           : '006400'
\, 'darkkhaki'           : 'BDB76B', 'darkmagenta'         : '8B008B'
\, 'darkolivegreen'      : '556B2F', 'darkorange'          : 'FF8C00'
\, 'darkorchid'          : '9932CC', 'darkred'             : '8B0000'
\, 'darksalmon'          : 'E9967A', 'darkseagreen'        : '8FBC8F'
\, 'darkslateblue'       : '483D8B', 'darkslategray'       : '2F4F4F'
\, 'darkturquoise'       : '00CED1', 'darkviolet'          : '9400D3'
\, 'deeppink'            : 'FF1493', 'deepskyblue'         : '00BFFF'
\, 'dimgray'             : '696969', 'dodgerblue'          : '1E90FF'
\, 'firebrick'           : 'B22222', 'floralwhite'         : 'FFFAF0'
\, 'forestgreen'         : '228B22', 'fuchsia'             : 'FF00FF'
\, 'gainsboro'           : 'DCDCDC', 'ghostwhite'          : 'F8F8FF'
\, 'gold'                : 'FFD700', 'goldenrod'           : 'DAA520'
\, 'greenyellow'         : 'ADFF2F', 'honeydew'            : 'F0FFF0'
\, 'hotpink'             : 'FF69B4', 'indianred'           : 'CD5C5C'
\, 'indigo'              : '4B0082', 'ivory'               : 'FFFFF0'
\, 'khaki'               : 'F0E68C', 'lavender'            : 'E6E6FA'
\, 'lavenderblush'       : 'FFF0F5', 'lawngreen'           : '7CFC00'
\, 'lemonchiffon'        : 'FFFACD', 'lightblue'           : 'ADD8E6'
\, 'lightcoral'          : 'F08080', 'lightcyan'           : 'E0FFFF'
\, 'lightgoldenrodyellow': 'FAFAD2', 'lightgrey'           : 'D3D3D3'
\, 'lightgreen'          : '90EE90', 'lightpink'           : 'FFB6C1'
\, 'lightsalmon'         : 'FFA07A', 'lightseagreen'       : '20B2AA'
\, 'lightskyblue'        : '87CEFA', 'lightslategray'      : '778899'
\, 'lightsteelblue'      : 'B0C4DE', 'lightyellow'         : 'FFFFE0'
\, 'lime'                : '00FF00', 'limegreen'           : '32CD32'
\, 'linen'               : 'FAF0E6', 'magenta'             : 'FF00FF'
\, 'mediumaquamarine'    : '66CDAA'                         
\, 'mediumblue'          : '0000CD', 'mediumorchid'        : 'BA55D3'
\, 'mediumpurple'        : '9370D8', 'mediumseagreen'      : '3CB371'
\, 'mediumslateblue'     : '7B68EE', 'mediumspringgreen'   : '00FA9A'
\, 'mediumturquoise'     : '48D1CC', 'mediumvioletred'     : 'C71585'
\, 'midnightblue'        : '191970', 'mintcream'           : 'F5FFFA'
\, 'mistyrose'           : 'FFE4E1', 'moccasin'            : 'FFE4B5'
\, 'navajowhite'         : 'FFDEAD', 'navy'                : '000080'
\, 'oldlace'             : 'FDF5E6', 'olive'               : '808000'
\, 'olivedrab'           : '6B8E23', 'orange'              : 'FFA500'
\, 'orangered'           : 'FF4500', 'orchid'              : 'DA70D6'
\, 'palegoldenrod'       : 'EEE8AA', 'palegreen'           : '98FB98'
\, 'paleturquoise'       : 'AFEEEE', 'palevioletred'       : 'D87093'
\, 'papayawhip'          : 'FFEFD5', 'peachpuff'           : 'FFDAB9'
\, 'peru'                : 'CD853F', 'pink'                : 'FFC0CB'
\, 'plum'                : 'DDA0DD', 'powderblue'          : 'B0E0E6'
\, 'red'                 : 'FF0000'                         
\, 'rosybrown'           : 'BC8F8F', 'royalblue'           : '4169E1'
\, 'saddlebrown'         : '8B4513', 'salmon'              : 'FA8072'
\, 'sandybrown'          : 'F4A460', 'seagreen'            : '2E8B57'
\, 'seashell'            : 'FFF5EE', 'sienna'              : 'A0522D'
\, 'silver'              : 'C0C0C0', 'skyblue'             : '87CEEB'
\, 'slateblue'           : '6A5ACD', 'slategray'           : '708090'
\, 'snow'                : 'FFFAFA', 'springgreen'         : '00FF7F'
\, 'steelblue'           : '4682B4', 'tan'                 : 'D2B48C'
\, 'teal'                : '008080', 'thistle'             : 'D8BFD8'
\, 'tomato'              : 'FF6347', 'turquoise'           : '40E0D0'
\, 'violet'              : 'EE82EE', 'wheat'               : 'F5DEB3'
\, 'white'               : 'FFFFFF', 'whitesmoke'          : 'F5F5F5'
\, 'yellow'              : 'FFFF00', 'yellowgreen'         : '9ACD32'
\} "}}}

let s:cX11d = {'gray': 'BEBEBE', 'green': '00FF00'
            \, 'Maroon': 'B03060', 'purple': 'A020F0'}
"W3C Standard
let s:cW3Cd = {'gray': '808080', 'green': '008000'
            \, 'maroon': '800000', 'purple': '800080'}
let s:clrdX11 = extend(copy(s:clrd),s:cX11d)
let s:clrdW3C = extend(copy(s:clrd),s:cW3Cd)

"}}}
" pos "{{{
let s:line_width=57
let [s:pal_W,s:pal_H]=[20,5]
let [s:OFF_W,s:OFF_H]=[0,1]
let [s:max_h,s:mid_h,s:min_h]=[8,6,3]


" the status col pos in colorv window
let s:stat_pos = 53
let s:tip_pos = 22

"}}}
" txt "{{{
let s:hlp_d = {
            \"r":["[RGB]RED"        , 0   , 255] ,
            \"g":["[RGB]GREEN"      , 0   , 255] ,
            \"b":["[RGB]Blue"       , 0   , 255] ,
            \"H":["[HLS]Hue"        , 0   , 360] ,
            \"L":["[HLS]Lightness"  , 0   , 100] ,
            \"S":["[HLS]Saturation" , 0   , 100] ,
            \"h":["[HSV]Hue"        , 0   , 360] ,
            \"s":["[HSV]Saturation" , 0   , 100] ,
            \"v":["[HSV]Value"      , 0   , 100] ,
            \"Y":["[YIQ]Luma"       , 0   , 100] ,
            \"I":["[YIQ]I-Channel"  , -60 , 60 ]  ,
            \"Q":["[YIQ]Q-Channel"  , -52 , 52 ]  ,
            \}
 
let s:win_tips = [
            \"Yank:yy Hue:gh Names:nn Tips:? ",
            \"Copy:cc Sat:gs Next:Tab Help:H ",
            \"Paste:P Val:gv TurnT:gg Mark:m ",
            \"Edit:Clik/Enter   Change:+/-   ",
            \]
let s:tips_list=[
            \'Move:Click/<Tab>/hjkl...',
            \'Edit:<2-Click>/<2-Space>/<Enter>',
            \'Yank(reg"): yy:HEX yr:RGB yl:HSL ym:CMYK ',
            \'Copy(reg+): cy:HEX cr:RGB cl:HSL cm:CMYK ',
            \'Toggle Size: s/S',
            \'Mark(shows in max window): mm',
            \'DelMark(color in max window): dd',
            \'Paste:<Ctrl-V>/p (Paste color and show)',
            \'ColornameEdit(W3C):na/ne       (X11):nx',
            \'ColornameList:nn (:ColorVName  <leader>cn)',
            \'ColorList: g1/g2/g3/g4/g5/g6/gh/gs/gv...',
            \'ColorList2: gg (hex1 Turn To hex2)',
            \'View color-text: :ColorVView (<leader>cw) ',
            \'Edit color-text: :ColorVEdit (<leader>ce) ',
            \'Preview in file: :ColorVPreview (<leader>cpp) ',
            \'Pick in screen:  :ColorVPicker (<leader>cd) ',
            \'Help:<F1>/H       Quit:q/Q',
            \]
"}}}
" match dic "{{{
if !exists("s:misc_dict")|let s:misc_dict={}|endif
if !exists("s:rect_dict")|let s:rect_dict={}|endif
if !exists("s:hsv_dict") |let s:hsv_dict={} |endif
if !exists("s:prev_dict")|let s:prev_dict={}|endif
if !exists("s:pal_dict") |let s:pal_dict={} |endif
let s:pal_clr_list= []
let s:hueline_list= []
let s:satline_list= []
let s:valline_list= []
"}}}
" miscs "{{{
let s:skip_his_rec_upd = 0
let s:his_mkd_list=exists("s:his_mkd_list")
            \ ? s:his_mkd_list : []
let s:his_set_list=exists("s:his_set_list")
            \ ? s:his_set_list : ['ff0000']

let s:his_set_rect=[43,2,5,4]
let s:his_cpd_rect=[22,7,2,1]
"}}}
"PYTH: "{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:py = "py"
let s:pycolor = s:path."colorv/colorv.py"
let s:pypicker = s:path."colorv/picker.py"
let s:cpicker = s:path."colorv/colorpicker"
function! s:py_core_load() "{{{
    if exists("s:py_core_loaded")
        return
    endif
    let s:py_core_loaded=1
    exec s:py."file ".s:pycolor
endfunction "}}}

"CORE: "{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! colorv#rgb2hex(rgb)   "{{{
    let [r,g,b] = a:rgb
    let r = r>255 ? 255 : r<0 ? 0 : r
    let g = g>255 ? 255 : g<0 ? 0 : g
    let b = b>255 ? 255 : b<0 ? 0 : b
    return printf("%02X%02X%02X",float2nr(r+0.0),
                \float2nr(g+0.0),float2nr(b+0.0))
endfunction "}}}
function! colorv#hex2rgb(hex) "{{{
    let hex=substitute(a:hex,'#\|0x\|0X','','')
    if len(hex) == 3
       let hex=substitute(hex,'.','&&','g')
    endif
    if len(hex) < 6 
       let hex=printf("%06X","0x".hex)
    endif
    return [str2nr(hex[0:1],16),str2nr(hex[2:3],16),str2nr(hex[4:5],16)]
    " return ["0x".hex[0:1],"0x".hex[2:3],"0x".hex[4:5]]
    " return map([hex[0:1],hex[2:3],hex[4:5]],'str2nr(v:val,16)')
endfunction "}}}

function! colorv#rgb2hsv(rgb)  "{{{
    let [r,g,b] = a:rgb
    let r= r>255 ? 255 : r<0 ? 0 : r
    let g= g>255 ? 255 : g<0 ? 0 : g
    let b= b>255 ? 255 : b<0 ? 0 : b

    let max=max([r,g,b])
    let min=min([r,g,b])
    let df=max-min+0.0

    let V = float2nr(round(max/2.55))
    let S = V==0 ? 0 : float2nr(round(df*100.0/max))
    let H = max==min ? 0 : max==r ? 60.0*(g-b)/df :
                         \ max==g ? 120+60.0*(b-r)/df : 240+60.0*(r-g)/df
    let H = float2nr(round(H))
    let H = H>=360 ? H%360: H<0 ? 360+H%360 : H
    return [H,S,V]
endfunction "}}}
function! colorv#hsv2rgb(hsv) "{{{
    " NOTE:  use a:hsv to avoid variable mismatch: x="3", x=0.3
    let [h, s, v]=[float2nr(a:hsv[0]+0.0),a:hsv[1]/100.0,a:hsv[2]*2.55]
    let h = h>=360 ? h%360: h<0 ? 360+h%360 : h
    let s = s>1   ? 1.0 : s < 0 ? 0.0 : s
    let v = v>255 ? 255.0 : v < 0 ? 0.0 : v

    if s == 0
        let v = float2nr(round(v))
        return [v,v,v]
    else
        let hi = floor(abs(h/60.0))
        let f  = h/60.0 - hi
        let p  = float2nr(round(v*(1-s)))
        let q  = float2nr(round(v*(1-f*s)))
        let t  = float2nr(round(v*(1-(1-f)*s)))
        let v  = float2nr(round(v))
        if hi==0
            return [v,t,p]
        elseif hi==1
            return [q,v,p]
        elseif hi==2
            return [p,v,t]
        elseif hi==3
            return [p,q,v]
        elseif hi==4
            return [t,p,v]
        elseif hi==5
            return [v,p,q]
        endif
    endif
endfunction "}}}
function! colorv#hex2hsv(hex) "{{{
   return colorv#rgb2hsv(colorv#hex2rgb(a:hex))
endfunction "}}}
function! colorv#hsv2hex(hsv) "{{{
    return colorv#rgb2hex(colorv#hsv2rgb(a:hsv))
endfunction "}}}

function! colorv#rgb2hls(rgb) "{{{
    let [r,g,b] = a:rgb
    let r= r>255 ? 255 : r<0 ? 0 : r
    let g= g>255 ? 255 : g<0 ? 0 : g
    let b= b>255 ? 255 : b<0 ? 0 : b
    let max=max([r,g,b])
    let min=min([r,g,b])
    let df=max-min+0.0

    let L = float2nr(round((max+min)*0.196078431))
    if L==0 || max==min
        let S=0
    elseif L>0 && L<=50
        let S= float2nr(round(df/(max+min)*100))
    else
        let S= float2nr(round(df/(510-max-min)*100))
    endif

    let H = max==min ? 0 : max==r ? 60.0*(g-b)/df :
                         \ max==g ? 120+60.0*(b-r)/df : 240+60.0*(r-g)/df
    let H = float2nr(round(H))
    let H = H>=360 ? H%360: H<0 ? 360+H%360 : H
    return [H,L,S]
endfunction "}}}
function! s:vh2rgb(v1,v2,vh) "{{{
    let [v1,v2,vh]=[a:v1,a:v2,a:vh]
    if     vh<0 | let vh+=1
    elseif vh>1 | let vh-=1
    endif
    if     vh<0.1666667
        return v1+(v2-v1)*6*vh
    elseif vh<0.5
        return v2
    elseif vh<0.6666667
        return v1+(v2-v1)*(4-vh*6)
    endif
    return v1
endfunction "}}}
function! colorv#hls2rgb(hls) "{{{
    let [h,l,s]=[float2nr(a:hls[0]+0.0),a:hls[1]/100.0,a:hls[2]/100.0]
    let h = h>=360 ? h%360: h<0 ? 360+h%360 : h
    let l = l>1 ? 1.0 : l < 0 ? 0.0 : l
    let s = s>1 ? 1.0 : s < 0 ? 0.0 : s
    let h = h/360.0

    if s == 0
        let l = float2nr(round(l*255))
        return [l,l,l]
    else
        if l < 0.5
            let var_2 = l * (1+s)
        else
            let var_2 = (l+s)-(s*l)
        endif
        let var_1 = 2*l-var_2
        let r = float2nr(round(s:vh2rgb(var_1,var_2,(h+0.3333333))*255))
        let g = float2nr(round(s:vh2rgb(var_1,var_2,h)*255))
        let b = float2nr(round(s:vh2rgb(var_1,var_2,(h-0.3333333))*255))
    endif
    return [r,g,b]
endfunction "}}}
function! colorv#hex2hls(hex) "{{{
   return colorv#rgb2hls(colorv#hex2rgb(a:hex))
endfunction "}}}
function! colorv#hls2hex(hls) "{{{
    return colorv#rgb2hex(colorv#hls2rgb(a:hls))
endfunction "}}}

function! colorv#hex2hsl(hex) "{{{
   let [h,l,s]=colorv#rgb2hls(colorv#hex2rgb(a:hex))
   return [h,s,l]
endfunction "}}}
function! colorv#hsl2hex(hsl) "{{{
    let [h,s,l]=a:hsl
    return colorv#rgb2hex(colorv#hls2rgb([h,l,s]))
endfunction "}}}

"YUV color space (PAL)
function! colorv#rgb2yuv(rgb) "{{{
    let [r,g,b] = a:rgb
    let r= r>255 ? 255 : r<0 ? 0 : r
    let g= g>255 ? 255 : g<0 ? 0 : g
    let b= b>255 ? 255 : b<0 ? 0 : b

    let Y=float2nr(round( 0.11725490*r + 0.23019608*g + 0.04470588*b))
    let U=float2nr(round(-0.05764706*r - 0.11333333*g + 0.17098039*b))
    let V=float2nr(round( 0.24117647*r - 0.20196078*g - 0.03921569*b))
    return [Y,U,V]
endfunction "}}}
function! colorv#yuv2rgb(yuv) "{{{
    let [Y,U,V]=a:yuv
    let Y= Y>100 ? 100 : Y<0 ? 0 : Y
    let U= U>100 ? 100 : U<-100 ? -100 : U
    let V= V>100 ? 100 : V<-100 ? -100 : V
    let R = float2nr(round(Y*2.55 + 2.907 *V))
    let G = float2nr(round(Y*2.55 - 1.00725*U - 1.48155*V))
    let B = float2nr(round(Y*2.55 + 5.1816*U))
    let R = R>255 ? 255 : R<0 ? 0 : R
    let G = G>255 ? 255 : G<0 ? 0 : G
    let B = B>255 ? 255 : B<0 ? 0 : B
    return [R,G,B]
endfunction "}}}
function! colorv#hex2yuv(hex) "{{{
   return colorv#rgb2yuv(colorv#hex2rgb(a:hex))
endfunction "}}}
function! colorv#yuv2hex(yuv) "{{{
    return colorv#rgb2hex(colorv#yuv2rgb(a:yuv))
endfunction "}}}

"YIQ color space (NTSC)
function! colorv#rgb2yiq(rgb) "{{{.
    let [r,g,b] = a:rgb
    let r= r>255 ? 255 : r<0 ? 0 : r
    let g= g>255 ? 255 : g<0 ? 0 : g
    let b= b>255 ? 255 : b<0 ? 0 : b
    let Y=float2nr(round(0.11725490*r + 0.23019608*g+ 0.04470588*b))
    let I=float2nr(round(0.23360784*r +-0.10764706*g+-0.126*b))
    let Q=float2nr(round(0.08294118*r +-0.20494118*g+ 0.122*b))
    return [Y,I,Q]
endfunction "}}}
function! colorv#yiq2rgb(yiq) "{{{
    let [y,i,q]=a:yiq
    let y= y>100 ? 100 : y<0   ?  0  : y
    let i= i>60  ? 60  : i<-60 ? -60 : i
    let q= q>52  ? 52  : q<-52 ? -52 : q
    let r = float2nr(round(y*2.55 + 2.438565*i+ 1.58355*q))
    let g = float2nr(round(y*2.55 - 0.693855*i- 1.65087*q))
    let b = float2nr(round(y*2.55 - 2.822850*i+ 4.34673*q))
    let r = r>255 ? 255 : r<0 ? 0 : r
    let g = g>255 ? 255 : g<0 ? 0 : g
    let b = b>255 ? 255 : b<0 ? 0 : b
    return [r,g,b]
endfunction "}}}
function! colorv#hex2yiq(hex) "{{{
   return colorv#rgb2yiq(colorv#hex2rgb(a:hex))
endfunction "}}}
function! colorv#yiq2hex(yiq) "{{{
    return colorv#rgb2hex(colorv#yiq2rgb(a:yiq))
endfunction "}}}

function! colorv#rgb2lab(rgb) "{{{
    let [r,g,b]= a:rgb
    let r= r>255 ? 255 : r<0 ? 0 : r
    let g= g>255 ? 255 : g<0 ? 0 : g
    let b= b>255 ? 255 : b<0 ? 0 : b

    let [r,g,b]=[r/255.0,g/255.0,b/255.0]
    if r > 0.04045
      let r = pow(((r + 0.055) / 1.055) , 2.4)
    else
      let r = r / 12.92
    endif
    if g > 0.04045
      let g = pow(((g + 0.055) / 1.055) , 2.4)
    else
      let g = g / 12.92
    endif
    if b > 0.04045
      let b = pow(((b + 0.055) / 1.055) , 2.4)
    else
      let b = b / 12.92
    endif
    
    let X = r * 41.24 + g * 35.76 + b * 18.05
    let Y = r * 21.26 + g * 71.52 + b * 07.22
    let Z = r * 01.93 + g * 11.92 + b * 95.05

    " XYZ to Lab
    " http://www.easyrgb.com/index.php?X=MATH&H=07#text7
    let X = X/95.047
    let Y = Y/100.000
    let Z = Z/108.883

    if (X > 0.008856)
      let X = pow(X ,(0.3333333))
    else
      let X = (7.787 * X) + (16 / 116.0)
    endif
    if (Y > 0.008856)
      let Y = pow(Y ,(0.3333333))
    else
      let Y = (7.787 * Y) + (16 / 116.0)
    endif
    if (Z > 0.008856)
      let Z = pow(Z ,(0.3333333))
    else
      let Z = (7.787 * Z) + (16 / 116.0)
    endif

    let L = (116 * Y) - 16
    let a = 500 * (X - Y)
    let b = 200 * (Y - Z)

    return [L, a, b]

endfunction "}}}

"CMYK (Cyan,Magenta,Yellow and Black)
function! colorv#rgb2cmyk(rgb) "{{{
    let [r,g,b] = a:rgb
    let r= r>255 ? 255 : r<0 ? 0 : r
    let g= g>255 ? 255 : g<0 ? 0 : g
    let b= b>255 ? 255 : b<0 ? 0 : b
    let [C,M,Y]=[1.0-r/255.0,1.0-g/255.0,1.0-b/255.0]
    let vk=1.0
    if C < vk | let vk =C | endif
    if M < vk | let vk =M | endif
    if Y < vk | let vk =Y | endif
    if vk==1
        let [C,M,Y]=[0,0,0]
    else
        let C=(C-vk)/(1.0-vk)
        let M=(M-vk)/(1.0-vk)
        let Y=(Y-vk)/(1.0-vk)
    endif
    let K =vk
    return [float2nr(round(C*100)),float2nr(round(M*100)),
                \float2nr(round(Y*100)),float2nr(round(K*100))]
endfunction "}}}
function! colorv#cmyk2rgb(cmyk) "{{{
    let [C,M,Y,K]=map(a:cmyk,'v:val/100.0')
    let R=float2nr(round((1.0-(C*(1.0-K)+K))*255))
    let G=float2nr(round((1.0-(M*(1.0-K)+K))*255))
    let B=float2nr(round((1.0-(Y*(1.0-K)+K))*255))
    return [R,G,B]
endfunction "}}}
function! colorv#hex2cmyk(hex) "{{{
   return colorv#rgb2cmyk(colorv#hex2rgb(a:hex))
endfunction "}}}
function! colorv#cmyk2hex(cmyk) "{{{
    return colorv#rgb2hex(colorv#cmyk2rgb(a:cmyk))
endfunction "}}}

"Terminal
function! colorv#hex2term(hex,...) "{{{
    if g:colorv_has_python && g:colorv_no_python!=1
        if a:0
            if (&t_Co<=8 && a:1==#"CHECK") || a:1==8
                exe s:py . ' vcmd("return \""+str(hex2term8(veval("a:hex"))) + "\"")'
            elseif (&t_Co<=16 && a:1=="CHECK") || a:1==16
                exe s:py . ' vcmd("return \""+str(hex2term8(veval("a:hex"),16))+ "\"")'
            endif
        endif
        exe s:py . ' vcmd("return \""+str(hex2term(veval("a:hex")))+"\"")'
    else
        if a:0
            if ( a:1=="CHECK" && &t_Co<=8) || a:1==8
                return s:hex2term8(a:hex)
            elseif ( a:1=="CHECK" && &t_Co<=16 ) || a:1==16
                return s:hex2term8(a:hex,16)
            endif
        endif
        return s:hex2term(a:hex)
    endif
endfunction "}}}

function! s:hex2term(hex) "{{{
    let [r,g,b]=colorv#hex2rgb(a:hex)

    " NOTE: the grayscale colors.
    if abs(r-g) <=16 &&  abs(g-b) <=16 && abs(r-b) <=16 
        if r<=4 
            let t_num = 16
        elseif r>= 92 && r<=96
            let t_num = 59
        elseif r>= 132 && r<=136
            let t_num = 106
        elseif r>= 172 && r<= 176
            let t_num = 145
        elseif r>= 212 && r<=216
            let t_num = 188
        elseif r>= 247
            let t_num = 231
        else
            let div = r%10>=3 ? r/10 : r/10-1 
            let t_num = div + 232
        endif
    else
        " NOTE: get the idx num of hex in term table.
        for i in ["r", "g" ,"b"]
            if {i} <= 48
                let {i} = 0
            elseif {i} <= 115
                let {i} = 1
            elseif {i} <= 155
                let {i} = 2
            elseif {i} <= 195
                let {i} = 3
            elseif {i} <= 235
                let {i} = 4
            else
                let {i} = 5
            endif
        endfor
        let t_num = r*36 + g*6 + b + 16
    endif
    return t_num
endfunction "}}}
function! s:hex2term8(hex,...) "{{{
    let [r,g,b]=colorv#hex2rgb(a:hex)
    for i in ["r","g","b"]
        if {i} <= 64 
            let {i} = 0
        elseif {i} <= 192
            let {i} = 1
        else
            let {i} = 2
        endif
    endfor
    " 808000
    if r <= 1 && g <= 1 && b <= 1
        let i = r*4 + g*2 + b
        let z = 0
    else
        " ffff00
        let i = (r/2)*4 + (g/2)*2   + b/2
        let z = 1
    endif
    if a:0 && a:1 == 16
        let t  = i  + z * 8
    else
        " NOTE: 8 color needs to change sequence
        let t  = "04261537"[i] + z * 8
    endif
    if t == 7
        let t = 8
    endif
    return t
endfunction "}}}

" RGBA
function! s:rgb2rgba(rgb,...) "{{{
    if a:0
        return a:rgb + [a:1]
    else
        return a:rgb + [255]
    endif
endfunction "}}}
function! s:rgba2rgb(rgba) "{{{
    return a:rgba[0:2]
endfunction "}}}
function! s:hex2hexa(hex,...) "{{{
    if a:0
        return a:hex + a:1
    else
        return a:hex + "ff"
    endif
endfunction "}}}
function! s:hexa2hex(hexa) "{{{
    return a:hexa[0:-3]
endfunction "}}}
function! s:hexa2rgba(hexa) "{{{
    let hex=substitute(a:hexa,'#\|0x\|0X','','')
    if len(hex) < 8 
       let hex=printf("%08X","0x".hex)
    endif
    return [str2nr(hex[0:1],16), str2nr(hex[2:3],16),
            \str2nr(hex[4:5],16), str2nr(hex[6:7],16)]
endfunction "}}}
function! s:rgba2hexa(rgba) "{{{
    let [r,g,b,a]=map(a:rgba,'float2nr(v:val)')
    let r= r>255 ? 255 : r<0 ? 0 : r
    let g= g>255 ? 255 : g<0 ? 0 : g
    let b= b>255 ? 255 : b<0 ? 0 : b
    let a= a>255 ? 255 : a<0 ? 0 : a
    return printf("%02X%02X%02X%02X",r,g,b,a)
endfunction "}}}

" Operation
function! s:add(rgba1,rgba2) "{{{
    let [r1,g1,b1,a1] = a:rgba1
    let [r2,g2,b2,a2] = a:rgba2
    let t = ( a1 + 0.0 ) / ( a1 + a2 + 0.0 )
    let r3 = r1 * t + r2 * ( 1 - t )
    let g3 = g1 * t + g2 * ( 1 - t )
    let b3 = b1 * t + b2 * ( 1 - t )
    let a3 = a1 * t + a2 * ( 1 - t )
    return [r3,g3,b3,a3]
endfunction "}}}
function! colorv#hexadd(hexa1,hexa2) "{{{
    let rgba1 = s:hexa2rgba(a:hexa1)
    let rgba2 = s:hexa2rgba(a:hexa2)
    return  s:rgba2hexa(s:add(rgba1, rgba2))
endfunction "}}}

"DRAW: "{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:lookup = {}
function! s:draw_palette(H,h,w) "{{{
    let [H,height,width]=[float2nr(a:H),a:h,a:w]
    let H = H>=360 ? H%360: H<0 ? 360+H%360 : H
    let name = H.'_'.height.'_'.width
    if !has_key(s:lookup , name) "{{{
        let p2 = []
        let V_step = 100.0/height
        let S_step = 100.0/width
        for row in range(height)
            let V =  100 - V_step * row
            let V = V<=0 ? 0 : V
            let l = []
            for col in range(width)
                let S = 100 -  S_step * col
                let S = S<=0 ? 0 : S
                let hex = colorv#hsv2hex([H,S,V])
                call add(l, hex)
            endfor
            call add(p2, l)
        endfor
        let s:lookup[name] = p2       " ref it, will be kept when p2 destroy
    else
        let p2 = s:lookup[name]       " ref it, will be destroied when [] new
    endif "}}}

    " clear it. otherwise it will get slower and slower.
    call s:clear_match("pal")
    for row in range(height) "{{{
        for col in range(width)
            let hex = p2[row][col]
            let hi_grp  = "tv_pal_".row."_".col
            call s:hi_color(hi_grp,hex,hex," ")
            let pos_ptn = '\%'.(row+s:OFF_H+1).'l'
                        \.'\%'.(col+s:OFF_W+1).'c'
            sil! let s:pal_dict[hi_grp]=matchadd(hi_grp,pos_ptn)
        endfor
    endfor "}}}
    let s:pal_clr_list = p2
endfunction
"}}}
function! s:draw_palette_hex(hex,...) "{{{
    if g:colorv_has_python && g:colorv_no_python!=1
        exe s:py . ' draw_pallete_hex(veval("a:hex"))'
    else
        let [h,s,v]=colorv#hex2hsv(a:hex)
        let g:colorv.HSV.H=h
        if a:0 && len(a:1) == 2
            call s:draw_palette(h,a:1[0],a:1[1])
        else
            call s:draw_palette(h,s:pal_H,s:pal_W)
        endif
    endif
endfunction "}}}
function! s:draw_multi_rect(rect,hex_list) "{{{
    "rect:      rectangle[x,y,w,h] 
    "hex_list:  [ffffff,ffffff]
    let [x,y,w,h]=a:rect
    let rect_hex_list=a:hex_list

    for idx in range(len(rect_hex_list))
        let hex=rect_hex_list[idx]
        let hi_grp="cv_rct".rect_hex_list[idx]
        let rect_ptn="\\%>".(x+w*idx-1)."c\\%<".(x+w*(idx+1)).
                    \"c\\%>".(y-1)."l\\%<".(y+h)."l"
        call s:hi_color(hi_grp,hex,hex," ")
        sil! let s:rect_dict[hi_grp]=matchadd(hi_grp,rect_ptn)
    endfor
endfunction "}}}
let s:his_color0 = "FF0000"
let s:his_color1 = "FFFFFF"
let s:his_color2 = "FFFFFF"
function! s:draw_history_rect(hex) "{{{
    let hex= s:fmt_hex(a:hex)
    let len=len(s:his_set_list)
    let s:his_color2= len >2 ? s:his_set_list[len-3] : 'FFFFFF'
    let s:his_color1= len >1 ? s:his_set_list[len-2] : 'FFFFFF'
    let s:his_color0= len >0 ? s:his_set_list[len-1] : hex
    call s:draw_multi_rect(s:his_set_rect,[s:his_color0,s:his_color1,s:his_color2])
endfunction "}}}
function! s:draw_mark_rect() "{{{
    let len=len(s:his_mkd_list)
    let clr_list=[]
    for i in range(18)
        if &background=="light"
            let t="333333"
        else
            let t="AAAAAA"
        endif
        let cpd_color= len>i ? s:his_mkd_list[-1-i] : t
        call add(clr_list,cpd_color)
    endfor
    call s:draw_multi_rect(s:his_cpd_rect,clr_list)
endfunction "}}}

let s:hue_H = 0
let s:val_S = 100
function! s:draw_hueline(l) "{{{
    call s:clear_match("hsv")

    let step  = 360/s:pal_W
    
    " NOTE: make hueline dynamic.
    if g:colorv.HSV.S !=0
        let s:hue_H = g:colorv.HSV.H
    endif
    let h = s:hue_H

    let [s,v] = [100,100]

    let hue_list = []
    for col in range(s:pal_W)
        let hi_grp = "cv_hue_".col
        let hex = colorv#hsv2hex([h,s,v])
        let pos = "\\%". a:l ."l\\%".(col+1+s:OFF_W)."c"
        call s:hi_color(hi_grp,hex,hex," ")
        sil! let s:hsv_dict[hi_grp]=matchadd(hi_grp,pos)
        call add(hue_list,hex)
        let h += step
    endfor
    let s:hueline_list = hue_list
endfunction "}}}
function! s:draw_satline(l) "{{{

    let h = s:hue_H
    let v = 100

    let step = 100.0/(s:pal_W)
    let sat_list=[]
    for col in range(s:pal_W)
        let s =  100 - col * step
        let s = s<=0 ? 0 : s

        let hi_grp = "cv_sat_".col
        let hex = colorv#hsv2hex([h,s,v])
        let ptn = '\%'. a:l .'l\%'.(col+1+s:OFF_W).'c'

        call s:hi_color(hi_grp,hex,hex," ")
        sil! let s:hsv_dict[hi_grp]=matchadd(hi_grp, ptn)
        call add(sat_list,hex)

    endfor
    let s:satline_list=sat_list
endfunction "}}}
function! s:draw_valline(l) "{{{

    let h = s:hue_H
    " make val Lines's Saturation same with color.
    if g:colorv.HSV.S != 0
        let s:val_S = g:colorv.HSV.S
    endif
    let s = s:val_S

    let step = 100.0/(s:pal_W)
    let val_list = []
    for col in range(s:pal_W)
        let v = 100.0 - col*step
        let v = v<=0 ? 0 : v

        let hi_grp="cv_val_".col
        let hex = colorv#hsv2hex([h,s,v])

        let ptn = '\%'.a:l.'l'
                \.'\%'.(col+1+s:OFF_W).'c'

        call s:hi_color(hi_grp,hex,hex," ")
        sil! let s:hsv_dict[hi_grp] = matchadd(hi_grp,ptn)
        call add(val_list,hex)
    endfor
    let s:valline_list=val_list
endfunction "}}}

function! s:hi_color(hl_grp,hl_fg,hl_bg,hl_fm) "{{{

    let [hl_grp,hl_fg,hl_bg,hl_fm]=[a:hl_grp,a:hl_fg,a:hl_bg,a:hl_fm]
    
    if s:mode == "gui"
        let hl_fg = hl_fg=~'^\x\{6}$' ? "#".hl_fg : hl_fg
        let hl_bg = hl_bg=~'^\x\{6}$' ? "#".hl_bg : hl_bg
    else
        "  if hex , convert to term numbers 255:0~255 8/16:0~15
        let hl_fg = hl_fg=~'\x\{6}' ? colorv#hex2term(hl_fg,"CHECK") : hl_fg
        let hl_bg = hl_bg=~'\x\{6}' ? colorv#hex2term(hl_bg,"CHECK") : hl_bg
        
        " in cterm 8 color 8~15 should be bold  and foreground only.
        " and only have reverse formats
        let hl_fm = hl_fm=~'reverse' ? "reverse": "NONE"

        if &t_Co == 8
            if hl_fg >= 8
                let hl_fm .= ",bold"
                let hl_fg -= 8
            endif

            let hl_bg -= hl_bg >= 8 ? 8 : 0
        endif
    endif

    let hl_fg = empty(hl_fg) ? "" : " ".s:mode."fg=".hl_fg
    let hl_bg = empty(hl_bg) ? "" : " ".s:mode."bg=".hl_bg
    let hl_fm = empty(hl_fm) ? "" : " ".s:mode."="  .hl_fm

    try
        exec "hi ".hl_grp.hl_fg.hl_bg.hl_fm
    catch /^Vim\%((\a\+)\)\=:E/	 
        call s:debug("hi ".v:exception.hl_grp.hl_fg.hl_bg.hl_fm)
    endtry

endfunction "}}}
function! s:hi_link(from,to) "{{{
    exe "hi link ". a:from . " " . a:to
endfunction "}}}
function! s:update_his_list(hex) "{{{
    let hex= s:fmt_hex(a:hex)

    if s:skip_his_rec_upd==1
        let s:skip_his_rec_upd=0
    else
        if get(s:his_set_list,-1)!=hex
            call add(s:his_set_list,hex)
        endif
    endif
endfunction "}}}
function! s:update_global(hex) "{{{
    let hex           = s:fmt_hex(a:hex)
    let g:colorv.HEX  = hex
    let g:colorv.NAME = s:hex2nam(hex)
    let [r,g,b] = colorv#hex2rgb(hex)
    let [h,s,v] = colorv#rgb2hsv([r,g,b])
    let [H,L,S] = colorv#rgb2hls([r,g,b])
    let [Y,I,Q] = colorv#rgb2yiq([r,g,b])
    let g:colorv.rgb = [r,g,b]
    let g:colorv.hsv = [h,s,v]
    let g:colorv.hls = [H,L,S]
    let g:colorv.hsl = [H,S,L]
    let g:colorv.yiq = [Y,I,Q]
    let [g:colorv.RGB.R,g:colorv.RGB.G,g:colorv.RGB.B] = [r,g,b]
    let [g:colorv.HSV.H,g:colorv.HSV.S,g:colorv.HSV.V] = [h,s,v]
    let [g:colorv.HLS.H,g:colorv.HLS.S,g:colorv.HLS.L] = [H,L,S]
    let [g:colorv.YIQ.Y,g:colorv.YIQ.I,g:colorv.YIQ.Q] = [Y,I,Q]
    
    " update callback
    if exists("s:call_type")
        if s:call_type == "updt"
            call call(s:call_func,s:call_args)
            s:get_buf_win(s:ColorV.name)
            unlet s:call_type
            unlet s:call_func
            unlet s:call_args
        endif
    endif
endfunction "}}}
function! s:hi_misc() "{{{
    
    " change as s:pal_W changes.
    call s:clear_match("misc")

    let [l,c]=s:get_star_pos()
    if s:size=="min"
        let bg= s:valline_list[c-1]
    else
        let bg=s:pal_clr_list[l-s:OFF_H-1][c-s:OFF_W-1]
    endif
    let fg= s:rlt_clr(bg)
    call s:hi_color("cv_star",fg,bg,"bold")
    let star_ptn='\%<'.(s:pal_H+1+s:OFF_H).'l\%<'.
                \(s:pal_W+1+s:OFF_W).'c\*'
    sil! let s:misc_dict["cv_star"]=matchadd("cv_star",star_ptn,40)

    if s:size=="min"
        let [l,c]=s:get_bar_pos()
        let bg=  s:satline_list[c-1]
        let fg= s:rlt_clr(bg)

        let bar_ptn='\%2l\%<'.
                    \(s:pal_W+1+s:OFF_W).'c+'
        call s:hi_color("cv_plus",fg,bg,"bold")
        sil! let s:misc_dict["cv_plus"]=matchadd("cv_plus",bar_ptn,20)
    endif

    " tip text highlight
    if s:size!="min"
        let tip_ptn='\%'.(s:pal_H+1).'l\%>21c\%<60c'
        call s:hi_link("cv_tip","Comment")
        sil! let s:misc_dict["cv_tip"]=matchadd("cv_tip",tip_ptn)
        let tip_ptn='\%'.(s:pal_H+1).'l\%>21c\%<60c\S*:'
        call s:hi_link("cv_stip","SpecialComment")
        sil! let s:misc_dict["cv_stip"]=matchadd("cv_stip",tip_ptn,15)
        let stat_ptn='\%'.(s:pal_H+1).'l\%>'.(s:stat_pos-1).'c\%<60c[sSYH]'
        call s:hi_link("cv_stat","Keyword")
        sil! let s:misc_dict["cv_stat"]=matchadd("cv_stat",stat_ptn,25)
        let stat_ptn='\%'.(s:pal_H+1).'l\%>'.(s:stat_pos-1).'c\%<60c[x]'
        call s:hi_link("cv_xstat","Title")
        sil! let s:misc_dict["cv_xstat"]=matchadd("cv_xstat",stat_ptn,26)
    endif
endfunction "}}}

function! s:draw_text(...) "{{{
    let cur=s:clear_text()
    let cv = g:colorv
    let hex= cv.HEX
    let [r,g,b]= map(copy(cv.rgb),'printf("%3d",v:val)')
    let [h,s,v]= map(copy(cv.hsv),'printf("%3d",v:val)')
    let [H,L,S]= map(copy(cv.hls),'printf("%3d",v:val)')
    let [Y,I,Q]= map(copy(cv.yiq),'printf("%3d",float2nr(v:val))')

    let height = s:size=="max" ? s:max_h : s:size=="mid" ? s:mid_h :
                \ s:min_h

    let line=[]
    for i in range(height)
        let m=repeat(' ',s:line_width)
        call add(line,m)
    endfor

    " para and help, stat:
    let help_txt = s:win_tips[s:tip_c]
    
    let stat_g = g:colorv_gen_space==?"hsv" ? "H" : "Y"
    let stat_m = s:size=="max" ? "S" : s:size=="mid" ? "s" : "-"
    let stat_txt = stat_g." ".stat_m." x"
    let line[0]=s:line("ColorV ".g:colorv.version,3)
    let line[0]=s:line_sub(line[0],"HEX:".hex,22)
    if s:size=="max"
        let line[1]=s:line("R:".r."  G:".g."  B:".b,22)
        let line[2]=s:line("H:".h."  S:".s."  V:".v,22)
        let line[3]=s:line("H:".H."  L:".L."  S:".S,22)
        let line[4]=s:line("Y:".Y."  I:".I."  Q:".Q,22)
        let line[s:pal_H]=s:line(help_txt,22)
        let line[s:pal_H]=s:line_sub(line[s:pal_H],stat_txt,s:stat_pos)
    elseif s:size=="mid"
        let line[2]=s:line("R:".r."  G:".g."  B:".b,22)
        let line[3]=s:line("H:".h."  S:".s."  V:".v,22)
        let line[4]=s:line("H:".H."  L:".L."  S:".S,22)
        let line[s:pal_H]=s:line(help_txt,22)
        let line[s:pal_H]=s:line_sub(line[s:pal_H],stat_txt,s:stat_pos)
    elseif s:size=="min"
        let line[1]=s:line("R:".r."  G:".g."  B:".b,22)
        let line[2]=s:line("H:".h."  S:".s."  V:".v,22)
        let line[2]=s:line_sub(line[2],stat_txt,s:stat_pos)
    endif

    " colorname
    let nam=g:colorv.NAME
    if !empty(nam)
        if s:size=="min"
        let line[0]=s:line_sub(line[0],nam,43)
        else
        let line[0]=s:line_sub(line[0],nam,43)
        endif
    endif


    "draw star mark(asterisk) at pos
    for i in range(height)
        let line[i]=substitute(line[i],'\*',' ','g')
    endfor
    let [l,c]=s:get_star_pos()
    let line[l-1]=s:line_sub(line[l-1],"*",c)

    "draw BAR for saturation
    if s:size=="min"
        for i in range(height)
            let line[i]=substitute(line[i],'+',' ','g')
        endfor
        let [l,c]=s:get_bar_pos()
        let line[l-1]=s:line_sub(line[l-1],"+",c)
    endif

    setl ma
    for i in range(height)
        call setline(i+1,line[i])
    endfor
    setl noma

    "put cursor back
    call setpos('.',cur)

endfunction "}}}
function! s:get_bar_pos() "{{{
    if s:size=="min"
        let l = 2
        let step = 100.0/(s:pal_W)
        let c = s:pal_W - float2nr(round(g:colorv.HSV.S/step)) + 1 + s:OFF_W
        if c>= s:pal_W+s:OFF_W
            let c = s:pal_W+s:OFF_W
        elseif c <= 1 + s:OFF_W
            let c = 1 + s:OFF_W
        endif
        return [l,c]
    endif
endfunction "}}}
function! s:get_star_pos() "{{{
    if s:size=="max" || s:size=="mid"
        let h_step=100.0/(s:pal_H)
        let w_step=100.0/(s:pal_W)
        let l = s:pal_H - float2nr(round(g:colorv.HSV.V/h_step)) + 1 + s:OFF_H
        let c = s:pal_W - float2nr(round(g:colorv.HSV.S/w_step)) + 1 + s:OFF_W

        if l >= s:pal_H+s:OFF_H
            let l = s:pal_H+s:OFF_H
        elseif l <= 1 + s:OFF_H
            let l = 1 + s:OFF_H
        endif

    elseif s:size=="min"
        let l = 3
        let w_step = 100.0/s:pal_W
        let c = s:pal_W - float2nr(round(g:colorv.HSV.V/w_step)) + 1 + s:OFF_W
    endif

    if c >= s:pal_W+s:OFF_W
        let c = s:pal_W+s:OFF_W
    elseif c <= 1 + s:OFF_W
        let c = 1 + s:OFF_W
    endif

    return [l,c]
endfunction "}}}
function! s:clear_text() "{{{
    if !s:check_win(s:ColorV.name)
        call s:error("Not [ColorV] buffer.")
        return
    else
        let cur=getpos('.')
        " silent! normal! ggVG"_x
        silent %delete _
        return cur
    endif
endfunction "}}}
function! s:line(text,pos) "{{{
    "return text in blank line
    return printf("%-".(s:line_width)."s" ,repeat(' ', a:pos-1).a:text) 
endfunction "}}}
function! s:line_sub(line,text,pos) "{{{
"return substitute line at pos in input line
"could not use doublewidth text
    let [line,text,pos]=[a:line,a:text,a:pos]
    let x = len(text)+pos-len(line)
    if  x > 0
        let line .= repeat(' ', x)
    endif
    " if pos!=1
    let pat = '^\(.\{'.(pos-1).'}\)\%(.\{'.len(text).'}\)'
    return substitute(line,pat,'\1'.text,'')
    " else
    "     let pat='^\%(.\{'.len(text).'}\)'
    "     return substitute(line,pat,text,'')
    " endif
endfunction "}}}

function! s:clear_match(c) "{{{
    for [key,var] in items(s:{a:c}_dict)
        sil! call matchdelete(var)
        sil! exe "hi clear ".key
    endfor
    let s:{a:c}_dict={}
endfunction "}}}
function! colorv#clear_all() "{{{
    call s:clear_match("rect")
    call s:clear_match("hsv")
    call s:clear_match("misc")
    call s:clear_match("pal")
    call s:clear_match("prev")
    call clearmatches()
endfunction "}}}
"WINS: "{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! colorv#win(...) "{{{
    " a:1 size  a:2 color a:3 callback [type, func, arg]
    let size  = a:0 ? a:1 : ""
    let color = ( a:0>1 && a:2 !~ '^\s*$' ) ? a:2 : ""
    let funcl = ( a:0>2 && type(a:3) == type([]) ) ? a:3 : []
    
    call s:new_win(s:ColorV.name)
    call s:win_setl()
    call s:set_map()
    let s:tip_c = colorv#random(0,3)
    
    " color
    let hex = exists("g:colorv.HEX") ? g:colorv.HEX : "FF0000" 
    let s:skip_his_rec_upd = 1
    let hex_list = s:txt2hex(color)
    if !empty(hex_list)
        let hex = s:fmt_hex(hex_list[0][1])
        let s:skip_his_rec_upd = 0
        cal s:echo("Use [".hex."]")
    endif

    if      size == "min" | let s:size="min"
    elseif  size == "max" | let s:size="max"
    elseif  size == "mid" | let s:size="mid"
    endif

    if      s:size=="min" | let s:pal_H=s:min_h-1
    elseif  s:size=="max" | let s:pal_H=s:max_h-1
    else                  | let s:pal_H=s:mid_h-1
    endif

    "_funcs
    if len(funcl) >= 2
        let s:call_type = funcl[0]
        let s:call_func = funcl[1]
        let s:call_args = get(funcl,2,[])
    endif

    call s:win_hl()
    call s:draw_win(hex)
endfunction "}}}
let s:prv_hex = "FF0000"
function! s:draw_win(hex,...) "{{{

    if !s:check_win(s:ColorV.name)
        call s:error("Not [ColorV] buffer.")
        return
    endif

    " hex from from internal call may get wrong
    let hex= s:fmt_hex(a:hex)

    if g:colorv_debug==1
        let funcs = "colorv#timer"
    else
        let funcs = "call"
    endif

    call {funcs}("s:update_his_list",[hex])
    call {funcs}("s:update_global",[hex])

    " NOTE: we should clear it here, otherwise can not draw multi.
    call {funcs}("s:clear_match",["rect"])

    setl ma lz
    call {funcs}("s:draw_hueline",[1])
    if s:size == "min"
        call {funcs}("s:draw_satline",[2])
        call {funcs}("s:draw_valline",[3])
    else
        " NOTE: prv_hex: avoid pallete hue became 0 when sat became 0
        if g:colorv.HSV.S==0
            call {funcs}("s:draw_palette_hex",[s:prv_hex])
        else
            if a:0 && a:1=="skippal"
                let [ph,ps,pv] = colorv#hex2hsv(s:prv_hex)
                let [h,s,v]    = colorv#hex2hsv(hex)
                if ph != h
                    call {funcs}("s:draw_palette_hex",[hex])
                endif
            else
                call {funcs}("s:draw_palette_hex",[hex])
            endif
            let s:prv_hex= hex
        endif
        if s:size == "max"
            call {funcs}("s:draw_mark_rect",[])
        endif
    endif
    call {funcs}("s:hi_misc",[])
    call {funcs}("s:draw_history_rect",[hex])
    call {funcs}("s:draw_text",[])
    setl noma nolz

    if winnr('$') != 1
        if     s:size == "max" | let l:win_h=s:max_h
        elseif s:size == "min" | let l:win_h=s:min_h
        else                   | let l:win_h=s:mid_h
        endif
        execute 'resize' l:win_h
        redraw
    endif

endfunction "}}}

function! s:new_win(name,...) "{{{
    let spLoc= g:colorv_win_pos == "top" ? "topleft " : "botright "
    let spSize= a:0 && a:1 =="v" ? 29 :s:pal_H+1
    let spDirc= a:0 && a:1 =="v" ? "v" : ""
    let exists_buffer= bufnr(a:name)
    if exists_buffer== -1
        silent! exec spLoc .' '.spSize.spDirc.'new '. a:name
    else
        let exists_window = bufwinnr(exists_buffer)
        if exists_window != -1
            if winnr() != exists_window
                silent! exe exists_window . "wincmd w"
            endif
        else
            call s:get_buf_win(a:name)
            silent! exe spLoc ." ".spSize.spDirc."split +buffer" . exists_buffer
        endif
    endif
endfunction "}}}
function! s:get_buf_win(name) "{{{
    if bufwinnr(bufnr(a:name)) != -1
        exe bufwinnr(bufnr(a:name)) . "wincmd w"
        return 1
    else
        return 0
    endif
endfunction "}}}
function! s:win_setl() "{{{
    " local setting
    setl buftype=nofile bufhidden=delete nobuflisted
    setl noswapfile
    setl winfixwidth noea
    setl nocursorline nocursorcolumn
    setl nolist nowrap
    setl nofoldenable nonumber foldcolumn=0
    setl tw=0 nomodeline
    setl sidescrolloff=0
    if v:version >= 703
        setl cc=
    endif
endfunction "}}}
function! s:set_map() "{{{

    mapclear <buffer>

    let t = ["<C-k>","<CR>","<KEnter>","<Space>"
                \,"<Space><Space>","<2-Leftmouse>","<3-Leftmouse>"]

    let m_txt = "nmap <silent><buffer> "
    let c_txt = " :call <SID>set_in_pos()<CR>"
    
    for m in t
        exe m_txt.m.c_txt
    endfor

    nmap <silent><buffer> S :call <SID>size_toggle()<cr>
    nmap <silent><buffer> s :call <SID>size_toggle()<cr>

    nmap <silent><buffer> mm :call <SID>mark()<CR>
    nmap <silent><buffer> dd :call <SID>set_in_pos("D")<cr>

    nmap <silent><buffer> <tab> W
    nmap <silent><buffer> <S-tab> B

    "edit
    nmap <silent><buffer> = :call <SID>edit_at_cursor("+")<cr>
    nmap <silent><buffer> + :call <SID>edit_at_cursor("+")<cr>
    nmap <silent><buffer> - :call <SID>edit_at_cursor("-")<cr>
    nmap <silent><buffer> _ :call <SID>edit_at_cursor("-")<cr>
    nmap <silent><buffer> <ScrollWheelUp> :call <SID>edit_at_cursor("+")<cr>
    nmap <silent><buffer> <ScrollWheelDown> :call <SID>edit_at_cursor("-")<cr>

    "edit name
    nmap <silent><buffer> nn :call colorv#list_win)<cr>
    nmap <silent><buffer> na :call <SID>input_colorname()<cr>
    nmap <silent><buffer> ne :call <SID>input_colorname()<cr>
    nmap <silent><buffer> nx :call <SID>input_colorname("X11")<cr>


    nmap <silent><buffer> q :call colorv#exit()<cr>
    nmap <silent><buffer> Q :call colorv#exit()<cr>
    nmap <silent><buffer> ? :call <SID>echo_tips()<cr>
    nmap <silent><buffer> H :h colorv-quickstart<cr>
    nmap <silent><buffer> <F1> :h colorv-quickstart<cr>

    "Copy color
    map <silent><buffer> C   :call <SID>copy("HEX","+")<cr>
    map <silent><buffer> cc  :call <SID>copy("HEX","+")<cr>
    map <silent><buffer> cx  :call <SID>copy("HEX0","+")<cr>
    map <silent><buffer> c0  :call <SID>copy("HEX0","+")<cr>
    map <silent><buffer> cs  :call <SID>copy("HEX#","+")<cr>
    map <silent><buffer> c#  :call <SID>copy("HEX#","+")<cr>
    map <silent><buffer> cr  :call <SID>copy("RGB","+")<cr>
    map <silent><buffer> cp  :call <SID>copy("RGBP","+")<cr>
    map <silent><buffer> caa :call <SID>copy("RGBA","+")<cr>
    map <silent><buffer> cap :call <SID>copy("RGBAP","+")<cr>
    map <silent><buffer> cn  :call <SID>copy("NAME","+")<cr>
    map <silent><buffer> ch  :call <SID>copy("HSV","+")<cr>
    map <silent><buffer> cl  :call <SID>copy("HSL","+")<cr>
    map <silent><buffer> cm  :call <SID>copy("CMYK","+")<cr>

    map <silent><buffer> Y   :call <SID>copy()<cr>
    map <silent><buffer> yy  :call <SID>copy()<cr>
    map <silent><buffer> yx  :call <SID>copy("HEX0")<cr>
    map <silent><buffer> y0  :call <SID>copy("HEX0")<cr>
    map <silent><buffer> ys  :call <SID>copy("HEX#")<cr>
    map <silent><buffer> y#  :call <SID>copy("HEX#")<cr>
    map <silent><buffer> yr  :call <SID>copy("RGB")<cr>
    map <silent><buffer> yp  :call <SID>copy("RGBP")<cr>
    map <silent><buffer> yaa :call <SID>copy("RGBA")<cr>
    map <silent><buffer> yap :call <SID>copy("RGBAP")<cr>
    map <silent><buffer> yn  :call <SID>copy("NAME")<cr>
    map <silent><buffer> yh  :call <SID>copy("HSV")<cr>
    map <silent><buffer> yl  :call <SID>copy("HSL")<cr>
    map <silent><buffer> ym  :call <SID>copy("CMYK")<cr>

    "paste color
    map <silent><buffer> <c-v> :call <SID>paste("+")<cr>
    map <silent><buffer> p :call <SID>paste()<cr>
    map <silent><buffer> P :call <SID>paste()<cr>
    map <silent><buffer> <middlemouse> :call <SID>paste("+")<cr>

    "generator with current color
    nmap <silent><buffer> gh :call colorv#list_gen_win(g:colorv.HEX,"Hue",20,15)<cr>
    nmap <silent><buffer> g1 :call colorv#list_gen_win(g:colorv.HEX,"Hue",20,15)<cr>
    nmap <silent><buffer> gs :call colorv#list_gen_win(g:colorv.HEX,"Saturation",20,5,1)<cr>
    nmap <silent><buffer> gv :call colorv#list_gen_win(g:colorv.HEX,"Value",20,5,1)<cr>
    nmap <silent><buffer> ga :call colorv#list_gen_win(g:colorv.HEX,"Analogous")<cr>
    nmap <silent><buffer> gq :call colorv#list_gen_win(g:colorv.HEX,"Square")<cr>
    nmap <silent><buffer> gn :call colorv#list_gen_win(g:colorv.HEX,"Neutral")<cr>
    nmap <silent><buffer> gc :call colorv#list_gen_win(g:colorv.HEX,"Clash")<cr>
    nmap <silent><buffer> gp :call colorv#list_gen_win(g:colorv.HEX,"Split-Complementary")<cr>
    nmap <silent><buffer> gm :call colorv#list_gen_win(g:colorv.HEX,"Monochromatic")<cr>
    nmap <silent><buffer> g2 :call colorv#list_gen_win(g:colorv.HEX,"Complementary")<cr>
    nmap <silent><buffer> gt :call colorv#list_gen_win(g:colorv.HEX,"Triadic")<cr>
    nmap <silent><buffer> g3 :call colorv#list_gen_win(g:colorv.HEX,"Triadic")<cr>
    nmap <silent><buffer> g4 :call colorv#list_gen_win(g:colorv.HEX,"Tetradic")<cr>
    nmap <silent><buffer> g5 :call colorv#list_gen_win(g:colorv.HEX,"Five-Tone")<cr>
    nmap <silent><buffer> g6 :call colorv#list_gen_win(g:colorv.HEX,"Six-Tone")<cr>

    nmap <silent><buffer> gg :call colorv#list_win2()<CR>

    "easy moving
    noremap <silent><buffer>j gj
    noremap <silent><buffer>k gk

endfunction "}}}
function! s:win_hl() "{{{
    aug colorv#cursor
        au!
        autocmd CursorMoved,CursorMovedI <buffer>  call s:cursor_text_hi()
    aug END
endfunction "}}}
function! s:cursor_text_hi() "{{{
    let [l,c] = getpos('.')[1:2]
    let pos_list = s:size=="max" ? s:max_pos :
                \ s:size=="min" ? s:min_pos : s:mid_pos
    for [str,line,column,length] in pos_list
        if l==line && c>=column && c<column+length
            execute '3match' "Pmenu".' /\%>1l\%'.(line).'l'
                    \.'\%>21c\%<41c/'
            execute '2match' "PmenuSel".' /\%'.(line)
                        \.'l\%>'.(column-1) .'c\%<'.(column+length).'c/'
            return
        endif
    endfor
    execute '2match ' "none"
    execute '3match ' "none"
endfunction "}}}
function! s:check_win(name) "{{{
    if bufnr('%') != bufnr(a:name)
        return 0
    else
        return 1
    endif
endfunction "}}}

function! colorv#exit_list_win() "{{{
    if s:get_buf_win(s:ColorV.listname)
        close
    endif
endfunction "}}}
function! colorv#exit() "{{{
    if s:get_buf_win(s:ColorV.name)
        call colorv#clear_all()
        close
    else
        return -1
    endif
    " exit callback
    if exists("s:call_type")
        if s:call_type == "exit"
            call call(s:call_func,s:call_args)
        endif
        unlet s:call_type
        unlet s:call_func
        unlet s:call_args
    endif

endfunction "}}}

function! colorv#picker() "{{{
    let color=""
    call s:warning("Select color and press OK to Return it to Vim.")
    try 
        let color = system(g:colorv_python_cmd." ".s:pypicker." ".g:colorv.HEX)
        if !empty(color) && color !~ '\x\{6}'
            throw 'Error with python picker'
        endif
    catch
        let color = system(s:cpicker." ".g:colorv.HEX)
    finally
        if !empty(color)
            if color =~ '\x\{6}'
                call colorv#win(s:size,color)
            else
                if color =~ 'no such file'
                    call s:error("No colorpicker. Compile it first.")
                    echom "Makefile is in $VIM/autoload/colorv/"
                else
                    call s:error("Errors occures with colorpicker:\r".color)
                endif
            endif
        else
            call s:warning("No color returned.")
        endif
    endtry
endfunction "}}}

function! s:list_map() "{{{
    nmap <silent><buffer> q :call colorv#exit_list_win()<cr>
    nmap <silent><buffer> Q :call colorv#exit_list_win()<cr>
    nmap <silent><buffer> H :h colorv-colorname<cr>
    nmap <silent><buffer> <F1> :h colorv-colorname<cr>
endfunction "}}}
function! colorv#list_win(...) "{{{
    call s:new_win(s:ColorV.listname,"v")
    call s:win_setl()
    call s:list_map()

    let list=a:0 && !empty(a:1) ? a:1 :
            \ [['Colorname List','=======']] + s:clrn
            \+[['W3C_Standard'  ,'=======']] + s:cW3C
            \+[['X11_Standard'  ,'=======']] + s:cX11
    let lines =[]
    for [name,hex] in list
        let txt= hex =~'\x\{6}' ? "#".hex : hex
        let line=printf("%-20.18s%s",name,txt)
        call add(lines,line)
    endfor
    setl ma
        silent! %delete _
        call setline(1,lines)
    setl noma
    if winnr('$') != 1
        execute 'vertical resize' 29
    endif
    "preview without highlight colorname
    call colorv#preview("Nc")
endfunction "}}}
function! colorv#list_gen_win(hex,...) "{{{
    let hex=a:hex
    let type= a:0   ? a:1 : ""
    let nums= a:0>1 ? a:2 : ""
    let step= a:0>2 ? a:3 : ""
    let list=[]
    if g:colorv_gen_space ==? "yiq"
        let genlist=colorv#list_yiq_gen(hex,type,nums,step)
        call add(list,["YIQ ".type,'======='])
    else
        let genlist=colorv#list_gen(hex,type,nums,step)
        call add(list,[type.' List','======='])
    endif
    let i=0
    for hex in genlist
        call add(list,[type.i,hex])
        let i+=1
    endfor
    call colorv#list_win(list)
    call s:get_buf_win(s:ColorV.listname)
endfunction "}}}
function! colorv#list_win2(...) "{{{
    let hex1 = a:0 ? a:1 : s:his_color0
    let hex2 = a:0>1 ? a:2 : s:his_color1
    let list = s:list_winlist2(hex1,hex2)
    call colorv#list_win(list)
    call s:get_buf_win(s:ColorV.listname)
endfunction "}}}
"MATH: "{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:fmod(x,y) "{{{
    "no fmod() in 702
    if v:version < 703
        if a:y == 0
            let tmp = 0
        else
            let tmp = a:x - a:y * floor(a:x/a:y)
        endif
            return tmp
    else
        return fmod(s:float(a:x),s:float(a:y))
    endif
endfunction "}}}
function! s:number(x) "{{{
    return float2nr(a:x+0.0)
endfunction "}}}
function! s:float(x) "{{{
    if type(a:x) == type("")
        return str2float(a:x)
    else
        return a:x+0.0
    endif
endfunction "}}}
function! colorv#random(num,...) "{{{
    if a:0 
        let min = a:num
        let max = a:1
    else
        let min = 0
        let max = a:num
    endif
    if g:colorv_has_python
        exe s:py . ' import random'
        exe s:py . ' vcmd("return "+str(random.randint(int(veval("min")),int(veval("max")))))'
    else
        if !exists("s:seed")
            let s:seed = localtime() * (localtime()+101) * 2207
        endif
        let s:seed = s:fmod((1097*s:seed+2713),10457)
        return float2nr(s:fmod(abs(s:seed),max-min+1) + min)
    endif
endfunction "}}}
"HELP: "{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:fmt_hex(hex) "{{{
   let hex=substitute(a:hex,'#\|0x\|0X','','')
   if len(hex) == 3
       let hex=substitute(hex,'.','&&','g')
   endif
   if len(hex) > 6
        call s:debug("Formated Hex too long. Truncated")
        let hex = hex[:5]
   endif
   return printf("%06X","0x".hex)
endfunction "}}}

function! s:echo_tips() "{{{
    call s:seq_echo(s:tips_list)
endfunction "}}}
function! s:all_echo(txt_list) "{{{
    let txt_list=a:txt_list
    call s:caution("[Tips of Keyboard Shortcuts]")
    let idx=0
    for txt in txt_list
        echo "[".idx."]" txt
        let idx+=1
    endfor
endfunction "}}}
function! s:rnd_echo(txt_list) "{{{
    let txt_list=a:txt_list
    let idx=0
    let rnd=colorv#random(0,len(txt_list)-1)
    for txt in txt_list
        if  rnd == idx
            echo "[".idx."]" txt
            break
        endif
        let idx+=1
    endfor
endfunction "}}}
function! s:seq_echo(txt_list) "{{{
    let txt_list=a:txt_list
    let s:seq_num= exists("s:seq_num") ? s:seq_num : 0
    let idx=0
    for txt in txt_list
        if s:fmod(s:seq_num,len(txt_list)) == idx
            call s:echo(idx.": ".txt)
            break
        endif
        let idx+=1
    endfor
    let s:seq_num+=1
endfunction "}}}

function! s:caution(msg) "{{{
    echohl Modemsg
    redraw
    exe "echon '[ColorV]' "
    echohl Normal
    echon " ".escape(a:msg,'"')." "
endfunction "}}}
function! s:warning(msg) "{{{
    echohl Warningmsg
    redraw
    exe "echon '[ColorV]' "
    echohl Normal
    echon " ".escape(a:msg,'"')." "
endfunction "}}}
function! s:error(msg) "{{{
    echohl Errormsg
    redraw
    echom "[ColorV] ".escape(a:msg,'"')
    echohl Normal
endfunction "}}}
function! s:echo(msg) "{{{
    try
        echohl SpecialComment
        redraw
        exe "echon '[ColorV]' "
        echohl Normal
        exe "echon \" ".escape(a:msg,'"')."\""
    catch /^Vim\%((\a\+)\)\=:E488/
        call s:debug("Trailing character.")
    endtry
endfunction "}}}
function! s:debug(msg) "{{{
    if g:colorv_debug!=1
        return
    endif
    echohl Errormsg
    echom "[ColorV Debug] ".escape(a:msg,'"')
    echohl Normal
endfunction "}}}

function! s:rlt_clr(hex) "{{{
    if g:colorv_has_python && g:colorv_no_python!=1
        exec s:py ' vcmd("return \""+ rlt_clr(veval("a:hex")) + "\"")'
    else
        let hex=s:fmt_hex(a:hex)
        let [y,i,q]=colorv#hex2yiq(hex)

        if     y>=80    | let y = 40
        elseif y>=70    | let y = 30
        elseif y>=60    | let y = 20
        elseif y>=50    | let y = 10
        elseif y>=40    | let y = 5
        elseif y>=30    | let y = 75
        elseif y>=20    | let y = 65
        else            | let y = 55
        endif

        if     i >= 35  | let i += -20
        elseif i >= 10  | let i += -5
        elseif i >=-10  | let i += 0
        elseif i >=-35  | let i += 5
        else            | let i += 20
        endif

        if     q >= 35  | let q += -20
        elseif q >= 10  | let q += -5
        elseif q >=-10  | let q += 0
        elseif q >=-35  | let q += 5
        else            | let q += 20
        endif

        return colorv#yiq2hex([y,i,q])
    endif
endfunction "}}}
function! s:opz_clr(hex) "{{{
    let hex=s:fmt_hex(a:hex)
    let [y,i,q]=colorv#hex2yiq(hex)
    if y>=30 && y < 50
        let y = 65
    elseif y >=50 && y < 70
        let y = 35
    else
        let y = 100-y
    endif
    return colorv#yiq2hex([y,-i,-q])
endfunction "}}}

function! s:time() "{{{
    if g:colorv_has_python
        if !exists("s:time_loaded")
            exe s:py . ' import time'
            exe s:py . ' import vim'
            let s:time_loaded = 1
        endif
        exe s:py . ' vim.command("".join(["return ",str(time.time())]))'
    else
        return localtime()
    endif
endfunction "}}}
function! colorv#timer(func,...) "{{{
    if !exists("*".a:func)
        call s:debug("[TIMER]: ".a:func." does not exists. stopped")
        return
    endif
    let farg = a:0 ? a:1 : []
    let num  = a:0>1 ? a:2 : 1

    let o_t = s:time()

    for i in range(num)
        sil! let rtn = call(a:func,farg)
    endfor

    echom "[TIMER]:" string(s:time()-o_t) "seconds for exec" a:func num "times. "

    return rtn
endfunction "}}}

function! colorv#default(option,value) "{{{
    if !exists(a:option)
        let {a:option} = a:value
        return 0
    endif
    return 1
endfunction "}}}

"EDIT: "{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:max_pos=[["Hex:",1,22,10],
            \["R:",2,22,5],["G:",2,29,5],["B:",2,36,5],
            \["H:",3,22,5],["S:",3,29,5],["V:",3,36,5],
            \["N:",1,43,15],
            \["H:",4,22,5],["L:",4,29,5],["S:",4,36,5],
            \["Y ",5,22,5],["I ",5,29,5],["Q ",5,36,5],
            \]
let s:mid_pos=[["Hex:",1,22,10],
            \["R:",3,22,5],["G:",3,29,5],["B:",3,36,5],
            \["H:",4,22,5],["S:",4,29,5],["V:",4,36,5],
            \["N:",1,43,15],
            \["H:",5,22,5],["L:",5,29,5],["S:",5,36,5],
            \]
let s:min_pos=[["Hex:",1,22,10],
            \["R:",2,22,5],["G:",2,29,5],["B:",2,36,5],
            \["H:",3,22,5],["S:",3,29,5],["V:",3,36,5],
            \["N:",1,43,15]
            \]
function! s:set_in_pos(...) "{{{
    let [l,c] = getpos('.')[1:2]

    let clr=g:colorv
    let hex=clr.HEX
    let [r,g,b]=clr.rgb
    let [h,s,v]=clr.hsv
    let [H,L,S]=clr.hls
    let s= s==0 ? 1 : s
    let v= v==0 ? 1 : v
    let S= S==0 ? 1 : S
    let L= L==0 ? 1 : L==100 ? 99 : L
    let [rs_x,rs_y,rs_w,rs_h]=s:his_set_rect
    let [rc_x,rc_y,rc_w,rc_h]=s:his_cpd_rect
    
    if s:size!="max" || l!=rc_y || c<rc_x  || c>(rc_x+rc_w*18-1)
        if a:0 && a:1 =="D"
            return
        endif
    endif
    "pallette "{{{3
    if (s:size=="max" || s:size=="mid" ) && l > s:OFF_H && l<= s:pal_H+s:OFF_H && c<= s:pal_W
        let phex = hex
        let hex = s:pal_clr_list[l-s:OFF_H-1][c-s:OFF_W-1]
        if phex != hex
            call s:echo("HEX(Pallet): ".hex)
            call s:draw_win(hex,"skippal")
        endif
    "hsv line "{{{3
    elseif l==1 &&  c<=s:pal_W
        "hue line
        let [h1,s1,v1]=colorv#hex2hsv(s:hueline_list[(c-1)])
        if h != h1
            call s:echo("Hue(Hue Line): ".h1)
            "NOTE: help to avoid stuck in '000000' when changing hue .
            if  s<=3 && v<=3
                let [s,v] = [5,5]
            elseif s<=3 && v<= 30 
                let s = 5
            endif
            let hex=colorv#hsv2hex([h1,s,v])
            call s:draw_win(hex)
        endif
    elseif s:size=="min" && (l=~'^[23]$') && ( c<=s:pal_W  )

        if (l==2)
            let chr = "s"
        elseif (l==3)
            let chr = "v"
        endif
        let h_txt = s:hlp_d[chr][0]
        " step = 100.0 / s:pal_W 
        let {chr} = 100 - float2nr( ( c - 1 - s:OFF_W )* (100.0 / s:pal_W) )
        let {chr} = {chr} <=0 ? 0 : {chr}
        call s:echo(h_txt.":".{chr})

        let hex=colorv#hsv2hex([h,s,v])
        call s:draw_win(hex)
        return
    "his_line "{{{3
    elseif s:size=="max" && l==rc_y &&  c>=rc_x  && c<=(rc_x+rc_w*18-1)
        for i in range(18)
            if c<rc_x+rc_w*(i+1)
                if len(s:his_mkd_list)>i
                    let hex_h=s:his_mkd_list[-1-i]
                else
                    let hex_h="0"
                endif
                if hex_h!="0"
                    if a:0 && a:1 == "D"
                        call s:delmark(-1-i)
                        return
                    else
                        call s:echo("HEX(Copied history ".(i)."): ".hex_h)
                        call s:draw_win(hex_h)
                        return
                    endif
                else
                    call s:echo("No Copied Color here.")
                    return
                endif
            endif
        endfor
    "tip_line "{{{3
    elseif s:size != "min" && l==s:pal_H+1 && c < s:stat_pos && c>=s:tip_pos
        let word = expand('<cWORD>')
        " check if it is whitespace
        if empty(word) || getline(line('.'))[col('.')-1] =~ '\s'
            return
        endif
        let key = split(word,':')[0]
        if key == "Tips"
            call s:echo_tips()
        elseif key == "Help"
            h colorv-quickstart
        elseif key == "TurnT"
            call colorv#list_win2()
            call s:echo("Convert from ".s:his_color0. " to ".s:his_color1)
        elseif key == "Hue"
            call colorv#list_gen_win(g:colorv.HEX,"Hue",20,15)
        elseif key == "Sat"
            call colorv#list_gen_win(g:colorv.HEX,"Saturation",20,5)
        elseif key == "Val"
            call colorv#list_gen_win(g:colorv.HEX,"Value",20,5)
        elseif key == "Names"
            call colorv#list_win)
        elseif key == "Copy"
            call s:copy("HEX","+")
        elseif key == "Yank"
            call s:copy()
        elseif key == "Mark"
            call s:mark()
        endif

    "ctr_stat "{{{3
    elseif l==s:pal_H+1 && c >= s:stat_pos
        let char = getline(l)[c-1]
        if char =~ "Y"
            let g:colorv_gen_space = "hsv"
            setl ma
            call s:draw_text()
            setl noma
            call s:echo("change generating color space to 'hsv'")
        elseif char =~ 'H'
            let g:colorv_gen_space = "yiq"
            setl ma
            call s:draw_text()
            setl noma
            call s:echo("change generating color space to 'yiq'")
        elseif char =~ 'x'
            call colorv#exit()
        elseif char =~ '[Ss-]'
            call s:size_toggle()
            call s:echo("window size: ".s:size)
        endif 
    "his_pal "{{{3
    elseif l<=(rs_h+rs_y-1)  && l>=rs_y &&  c>=rs_x && c<=(rs_x+rs_w*3-1)
        for i in range(3)
            if c<=(rs_x+rs_w*(1+i)-1)
                let hex=s:his_color{i}
                call s:echo("HEX(history ".i."): ".hex)
                break
            endif
        endfor
        call s:draw_win(hex)
        return
    else
    "cur_chk "{{{3
        let pos_list = s:size=="max" ? s:max_pos :
                \ s:size=="min" ? s:min_pos : s:mid_pos
        for [name,y,x,width] in pos_list
            if l==y && c>=x && c<=(x+width-1)
                call s:edit_at_cursor()
                return
            endif
        endfor

        call s:warning("Not Valid Position.")
    endif "}}}3

endfunction "}}}
function! s:size_toggle() "{{{
    if     s:size=="min" | call colorv#win("max")
    elseif s:size=="max" | call colorv#win("mid")
    else                 | call colorv#win("min")
    endif
endfunction "}}}
function! s:edit_at_cursor(...) "{{{
    let tune=a:0 ? a:1 == "+" ? 1 : a:1 == "-" ? -1  : 0  : 0
    let clr=g:colorv
    let hex=clr.HEX
    let [r,g,b]=clr.rgb
    let [h,s,v]=clr.hsv
    let [H,L,S]=clr.hls
    let [Y,I,Q]=clr.yiq
    let [l,c] = getpos('.')[1:2]
    let pos_list = s:size=="max" ? s:max_pos :
                \ s:size=="min" ? s:min_pos : s:mid_pos
    let position=-1
    for idx in range(len(pos_list))
        let [str,line,column,length]=pos_list[idx]
        if l==line && c>=column && c<column+length
            let position=idx
            break
        endif
    endfor
    if position==0 "{{{
        if tune==0
            let hex=input("Hex(000000~ffffff,000~fff):")
            if hex =~ '^\x\{6}$'
                call s:draw_win(hex)
            elseif hex =~ '^\x\{3}$'
                let hex=substitute(hex,'.','&&','g')
                call s:draw_win(hex)
            else
                call s:error("invalid input.")
            endif
        endif
    elseif position==7
        call s:input_colorname()
    elseif position =~ '^[1-6]$' || (position>=8 && position<=13 )
        if position =~ '^[1-3]$'
            let c = ["r","g","b"][position-1]
            let e_txt = "let hex = colorv#rgb2hex([r,g,b])"
        elseif position =~ '^[4-6]$'
            let c = ["h","s","v"][position-4]
            let e_txt = "let hex = colorv#hsv2hex([h,s,v])"
        elseif position =~ '^\(8\|9\|10\)$' 
            let c = ["H","L","S"][position-8]
            let e_txt = "let hex = colorv#hls2hex([H,L,S])"
        elseif position =~ '^\(11\|12\|13\)$' 
            let c = ["Y","I","Q"][position-11]
            let e_txt = "let hex = colorv#yiq2hex([Y,I,Q])"
        endif

        let h_txt = s:hlp_d[c][0]
        let r_min = s:hlp_d[c][1]
        let r_max = s:hlp_d[c][2]

        if tune == 0
            let {c} = input(h_txt."(".r_min."~".r_max."):")
        else
            let {c} += tune * s:tune_step
        endif
        if {c} =~ '^-\=\d\{1,3}$' && {c} <= r_max && {c} >= r_min
            exe e_txt
            call s:draw_win(hex)
        else
            call s:error("invalid input.")
        endif
    endif "}}}

endfunction "}}}
function! s:input_colorname(...) "{{{

    let name = substitute(g:colorv.NAME,'\~',"","g")
    if a:0 && a:1=="X11"
        let text = input("Input color name(X11:Blue/Green/Red):",name)
        let hex = s:nam2hex(text,a:1)
    else
        let text = input("Input color name(W3C:Blue/Lime/Red):",name)
        let hex = s:nam2hex(text)
    endif

    if !empty(hex)
        call s:draw_win(hex)
    else
        let t=tr(text,s:t,s:e)
        let flg_l=s:flag_clr(t)
        if !empty(flg_l)
            call s:update_his_list(flg_l[2])
            call s:update_his_list(flg_l[1])
            call s:draw_win(flg_l[0])
            let n=tr(flg_l[3],s:t,s:e)
            call s:caution("Hello! ".n."!")
        else
            call s:warning("Not a W3C colorname. Nothing changed.")
        endif
    endif
endfunction "}}}
function! s:flag_clr(nam) "{{{
    if empty(a:nam)
        return []
    endif
    let clr_list=s:clrf
    for [c1,c2,c3,flg] in clr_list
        if  a:nam =~? flg
            return [c1,c2,c3,flg]
            break
        endif
    endfor
    return []
endfunction "}}}
"TEXT: "{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fmt "{{{
let s:fmt={}
let s:fmt.HEX ='\v\c%(#|<0x|<)(\x{6})>'
let s:fmt.HEX3='\v#(\x{3})>'
let s:fmt.RGB = '\v\c<rgb[ ]=\('
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3})\)'
let s:fmt.RGBA='\v\c<rgba\('
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3}\.=\d*)\)'
let s:fmt.RGBP='\v\c<rgb\('
            \.'\s*(\d{1,3})\%,'
            \.'\s*(\d{1,3})\%,'
            \.'\s*(\d{1,3})\%\)'
let s:fmt.RGBAP='\v\c<rgba\('
            \.'\s*(\d{1,3})\%,'
            \.'\s*(\d{1,3})\%,'
            \.'\s*(\d{1,3})\%,'
            \.'\s*(\d{1,3}\.=\d*)\)'
let s:fmt.HSV='\v\c<hsv\('
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3})\)'
let s:fmt.HSL='\v\c<hsl\('
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3})\%,'
            \.'\s*(\d{1,3})\%\)'
let s:fmt.HSLA='\v\c<hsla\('
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3})\%,'
            \.'\s*(\d{1,3})\%,'
            \.'\s*(\d{1,3})\.=\d*\)'
let s:fmt.CMYK='\v\c<cmyk\('
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3}),'
            \.'\s*(\d{1,3})\)'
let s:fmt.glRGBA='\v\c<glColor\du=[bsifd]\('
            \.'\s*(\d\.=\d*),'
            \.'\s*(\d\.=\d*),'
            \.'\s*(\d\.=\d*),'
            \.'\s*(\d\.=\d*)\)'
"}}}
function! s:txt2hex(txt) "{{{
    if g:colorv_has_python && g:colorv_no_python!=1
        exe s:py . ' vcmd("".join(["return ",str(txt2hex(veval("a:txt")))]))'
    endif
    let hex_list = []
    for [fmt,reg] in items(s:fmt)
        for [p_lst,p_idx] in s:reg_match(reg,a:txt)
            let p_alp = 1
            if fmt=="RGB"
                let [r,g,b]=p_lst[1:3]
                if r>255 || r<0 || g>255 || g<0 || b>255 || b<0
                    continue
                endif
                let hex = colorv#rgb2hex([r,g,b])
            elseif fmt=="RGBA"
                let p_alp = str2float(p_lst[4])
                let [r,g,b]=p_lst[1:3]
                if r>255 || r<0 || g>255 || g<0 || b>255 || b<0
                    continue
                endif
                let hex = colorv#rgb2hex([r,g,b])
            elseif fmt=="RGBP"
                let [r,g,b]=p_lst[1:3]
                if r>100 || r<0 || g>100 || g<0 || b>100 || b<0
                    continue
                endif
                let hex = colorv#rgb2hex([r*2.55,g*2.55,b*2.55])
            elseif fmt=="RGBAP"
                let [r,g,b]=p_lst[1:3]
                if r>100 || r<0 || g>100 || g<0 || b>100 || b<0
                    continue
                endif
                let p_alp  = str2float(p_lst[4])
                let hex = colorv#rgb2hex([r*2.55,g*2.55,b*2.55])
            elseif fmt=="HSV"
                let [h,s,v]=p_lst[1:3]
                if h>360 || h<0 || s>100 || s<0 || v>100 || v<0
                    continue
                endif
                let hex = colorv#hsv2hex([h,s,v])
            elseif fmt=="HSL"
                let [h,s,l]=p_lst[1:3]
                if h>360 || h<0 || s>100 || s<0 || l>100 || l<0
                    continue
                endif
                let hex = colorv#hsl2hex([h,s,l])
            elseif fmt=="HSLA"
                let p_alp  = str2float(p_lst[4])
                let [h,s,l]=p_lst[1:3]
                if h>360 || h<0 || s>100 || s<0 || l>100 || l<0
                    continue
                endif
                let hex = colorv#hsl2hex([h,s,l])
            elseif fmt=="CMYK"
                let [c,m,y,k]=p_lst[1:4]
                if c>100 || c<0 || m>100 || m<0 || y>100 || y<0 || k>100 || k<0
                    continue 
                endif
                let hex = colorv#cmyk2hex([c,m,y,k])
            elseif fmt=="glRGBA"
                let p_alp  = str2float(p_lst[4])
                " let [r,g,b] = p_lst[1:3]
                let [r,g,b] = [str2float(p_lst[1])*255,str2float(p_lst[2])*255,str2float(p_lst[3])*255]
                if r>255 || r<0 || g>255 || g<0 || b>255 || b<0
                    continue
                endif
                let hex = colorv#rgb2hex([r,g,b])
            elseif fmt=="HEX"
                let hex = toupper(p_lst[1])
            elseif fmt=="HEX3"
                let hex3 = p_lst[1]
                let hex = hex3[0].hex3[0].hex3[1].hex3[1].hex3[2].hex3[2]
            else
                break
            endif
            " let list=[hex,p_idx,p_len,p_str,fmt,p_alp]
            let list=[p_lst[0],hex,fmt,p_idx,p_alp]
            call add(hex_list,list)
        endfor
    endfor
    return hex_list + s:nametxt2hex(a:txt)
endfunction "}}}
function! s:hex2txt(hex,fmt,...) "{{{

    let hex = s:fmt_hex(a:hex)
    " NOTE: ' 255'/2 = 0 . so use str and nr separately
    let [r ,g ,b ] = colorv#hex2rgb(hex)
    let [rs,gs,bs] = map([r,g,b],'printf("%3d",v:val)')
    let a = a:0 && a:1>=0 && a:1<=1 ? a:1 : 1.0
    let A = printf("%.1f",a)
    if a:fmt=="RGB"
        let text="rgb(".rs.",".gs.",".bs.")"
    elseif a:fmt=="RGBA"
        let text="rgba(".rs.",".gs.",".bs.",".A.")"
    elseif a:fmt=="HSV"
        let [h,s,v] = map(colorv#rgb2hsv([r,g,b]),'printf("%3d",v:val)')
        let text="hsv(".h.",".s.",".v.")"
    elseif a:fmt=="HSL"
        let [H,L,S] = map(colorv#rgb2hls([r,g,b]),'printf("%3d",v:val)')
        let text="hsl(".H.",".S."%,".L."%)"
    elseif a:fmt=="HSLA"
        let [H,L,S] = map(colorv#rgb2hls([r,g,b]),'printf("%3d",v:val)')
        let text="hsla(".H.",".S."%,".L."%,".A.")"
    elseif a:fmt=="RGBP"
        let [rp,gp,bp] = map([r/2.55,g/2.55,b/2.55],
                    \'printf("%3d",float2nr(v:val))')
        let text="rgb(".rp."%,".gp."%,".bp."%)"
    elseif a:fmt=="glRGBA"
        let [rf,gf,bf] = map([r/255.0,g/255.0,b/255.0],'printf("%.2f",v:val)')
        let text="glColor4f(".rf.",".gf.",".bf.",".A.")"
    elseif a:fmt=="RGBAP"
        let [rp,gp,bp] = map([r/2.55,g/2.55,b/2.55],
                    \'printf("%3d",float2nr(v:val))')
        let text="rgba(".rp."%,".gp."%,".bp."%,".A.")"
    elseif a:fmt=="HEX3"
        let text="#".hex
    elseif a:fmt=="HEX0"
        let text="0x".hex
    elseif a:fmt=="HEX#"
        let text="#".hex
    elseif a:fmt=="CMYK"
        let [c,m,y,k]= map(colorv#rgb2cmyk([r,g,b]),'printf("%2d",v:val)')
        let text="cmyk(".c.",".m.",".y.",".k.")"
    elseif a:fmt=="NAME"
        if a:0>1 && a:2 == "X11"
            let text=s:hex2nam(hex,a:2)
        else
            let text=s:hex2nam(hex)
        endif
    else
        let text=hex
    endif

    return text
endfunction "}}}

function! s:nam2hex(nam,...) "{{{
    if empty(a:nam)
        return 0
    endif
    if a:0 && a:1 == "X11"
        let clr_dic = s:clrdX11
    else
        let clr_dic = s:clrdW3C
    endif
    let lo=tolower(a:nam)
    if has_key(clr_dic,lo)
        return clr_dic[lo]
    else
        return 0
    endif
endfunction "}}}
function! s:hex2nam(hex,...) "{{{
    let lst = a:0 && a:1 == "X11" ? "X11" : "W3C"
    if g:colorv_has_python && g:colorv_no_python!=1
        exe s:py . ' vcmd("return \""+ hex2nam(veval("a:hex"),veval("lst"))+"\"")'
    else

        if lst =="X11"  | let clr_list=s:clrnX11
        else            | let clr_list=s:clrnW3C  
        endif

        let best_name=""
        let dist = 20000
        let [r1,g1,b1] = colorv#hex2rgb(a:hex)
        for [name,hex] in clr_list
            let [r2,g2,b2] = ['0x'.hex[0:1],'0x'.hex[2:3],'0x'.hex[4:5]]
            let d = abs(r1-r2)+abs(g1-g2)+abs(b1-b2)
            if d < dist
                let dist = d
                let best_name = name
            endif
        endfor
        if dist == 0
            return best_name
        elseif dist <= s:aprx_rate*4
            return best_name."~"
        elseif dist <= s:aprx_rate*8
            return best_name."~~"
        else
            return ""
        endif
    endif
endfunction "}}}

function! s:nametxt2hex(txt) "{{{
    " find all color name and hex in a string. by dict
    let text = a:txt
    let hex_list=[]
    let startidx = 0
    for txt in split(text,'\v%(\s+|[:;.,''"\\|/])\zs')
        let t_len=len(txt)
        "NOTE: we only need word which is not following or followed by '-_'
        let rtx = matchstr(txt,'\v%(\w|[-_])@<!\w+%(\w|[-_])@!')
        let ltx = tolower(rtx)
        if has_key(s:clrdW3C,ltx)
            let p_idx = match(text,rtx,startidx)
            let hex   = s:clrdW3C[ltx]
            call add(hex_list,[rtx,hex,'NAME',p_idx,1])
        endif
        let startidx += t_len
    endfor
    return hex_list
endfunction "}}}
function! s:reg_match(reg,str) "{{{
    " return reg_list [[list],idx]
    let match_list=[]
    let idx = 0
    for i in range(200)
        let p_idx = match(a:str,a:reg,idx)
        if p_idx >= 0
            let p_lst = matchlist(a:str,a:reg,idx)
            let idx = p_idx + len(p_lst[0])
            call add(match_list,[p_lst,p_idx])
        else
            break
        endif
    endfor
    return match_list
endfunction "}}}

function! s:paste(...) "{{{
    if a:0 && a:1=="+"
        let l:cliptext = @+
        let t = "+"
    else
        let l:cliptext = @"
        let t = "\""
    endif
    let list=s:txt2hex(l:cliptext)
    if !empty(list)
        let hex=list[0][1]
        call s:echo("Paste from Clipboard(reg".t.") :".hex)
        call s:draw_win(hex)
    else
        call s:warning("Could not find color in clipboard")
    endif
endfunction "}}}
function! s:copy(...) "{{{
    let fmt = a:0 ? a:1 : "HEX"
    let l:cliptext=s:hex2txt(g:colorv.HEX,fmt)

    if  a:0>1 && a:2=="\""
        call s:echo("Copied to Clipboard(reg\"):".l:cliptext)
        let @" = l:cliptext
    elseif a:0>1 && a:2=="+"
        call s:echo("Copied to Clipboard(reg+):".l:cliptext)
        let @+ = l:cliptext
    else
        call s:echo("Copied to Clipboard(reg\"):".l:cliptext)
        let @" = l:cliptext
    endif
endfunction "}}}
function! s:mark() "{{{
    "no duplicated next color
    if string(get(s:his_mkd_list,-1))!=string(g:colorv.HEX)
        call add(s:his_mkd_list,g:colorv.HEX)
        if s:size=="max"
            call s:draw_mark_rect()
        endif
        call s:echo("add color to mark list:".g:colorv.HEX)
    endif
endfunction "}}}
function! s:delmark(n) "{{{
    let h = remove(s:his_mkd_list,a:n)
    if s:size=="max"
        call s:draw_mark_rect()
    endif
    call s:echo("del color in mark list:".h)
endfunction "}}}

function! colorv#cursor_text(action,...) "{{{
    let pos = getpos('.')
    let [row,col] = pos[1:2]

    let line = getline(row)
    if line =~ '^\s*$'
        call s:error("no color in an empty line.")
        return
    else
        let list = s:txt2hex(line)
    endif
    let w_list=[]
    if empty(list)
        call s:error("color-text not found under line of cursor.")
        return
    else
        for [str,hex,fmt,idx,alp] in list
            if idx<=(col-1) && (idx+len(str))>=(col-1)
                let c_hex = hex
                let w_list = [str,hex,fmt,idx,alp]
                break
            endif
        endfor
    endif
    if empty(w_list)
        call s:error("no color-text under cursor.")
        return
    endif
    if a:action == "view"
        call colorv#win(s:size,hex)
        call s:echo("View color-text under cursor.")
    elseif a:action =~ "edit"
        let bufinfo = [bufnr('%'),bufname('%'),bufwinnr('%'),pos,w_list]
        call colorv#win(s:size,hex,["exit","s:edit_text",[a:action, bufinfo]])
        call s:echo("Edit color-text under cursor.")
    elseif a:action == "changeTo" && a:0 
                \ && a:1 =~ '\vRGBA=P=|HEX3=|NAME|HS[VL]A=|CMYK'
        let bufinfo = [bufnr('%'),bufname('%'),bufwinnr('%'),pos,w_list]
        call colorv#win(s:size,hex,["exit","s:edit_text"
                    \,[a:action,bufinfo,a:1]])
        call s:echo("Change format of color-text under cursor to ".a:1)
    elseif a:action == "list"
        if a:0
            let [type,nums,step] = a:1
        endif
        call colorv#list_gen_win(hex,type,nums,step)
    else 
        call s:error("invalid action with color-text under cursor.")
    endif
endfunction "}}}
function! s:edit_text(action,bufinfo,...) "{{{
    if a:action =~ "edit" || (a:action == "changeto" && a:0)
        let [bufnr,bufname,bufwinnr,pos,w_list] = a:bufinfo
    else
        return
    endif

    if  bufname != bufname('%') || bufnr != bufnr('%')
        exe bufwinnr."wincmd w"
    endif
    if bufnr!=bufnr('%') || bufname!=bufname('%')
        call s:error("Doesn't get the right buffer.")
        return
    endif

    call setpos('.',pos)
    let [line,col] = pos[1:2]
    let list = s:txt2hex(getline('.'))
    for [str,hex,fmt,idx,alp] in list
        if idx<=(col-1) && (idx+len(str))>=(col-1)
            let get_list = [str,hex,fmt,idx,alp]
            break
        endif
    endfor
    if get_list != w_list
        call s:error("Doesn't get the right word.")
        return
    endif
    let [str,hex,fmt,idx,alp] = w_list
    if a:action =="changeTo"
        if &filetype=="vim"
            let to_str = s:hex2txt(g:colorv.HEX,a:1,alp,"X11")
        else
            let to_str = s:hex2txt(g:colorv.HEX,a:1,alp)
        endif
        if empty(to_str)
            call s:error("Choosed colortext is empty.")
            return
        endif
    else
        let to_str = s:hex2txt(g:colorv.HEX,fmt,alp)
    endif
    if fmt =='HEX'
        if str=~'0x'
            let to_str = "0x".to_str
        elseif str=~'#'
            let to_str = "#".to_str
        endif
    endif

    let str = escape(str,'[]*/~.$\')
    let to_str = escape(to_str,'&/~.$\')
    if a:action == "editAll"
        let cmd =  '%s/'.str.'/'.to_str.'/gc'
    else
        let cmd = 's/\%>'.(idx-1).'c'.str.'/'.to_str.'/'
    endif

    try
        exec cmd
        call setpos('.',pos)
    catch /^Vim\%((\a\+)\)\=:E486/
        call s:error("Pattern not found.")
    catch /^Vim\%((\a\+)\)\=:E/
        call s:error(v:exception)
    endtry

endfunction "}}}

"PREV: "{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! colorv#prev_list(list) "{{{
    "TODO: mix alpha with 'background' SynID:45
    "let view_alph = 1

    let view_name = exists("b:view_name") && b:view_name==1 ? 1 : 0
    let view_homo = exists("b:view_homo") && b:view_homo==1 ? 1 : 0
    for [str,hex,fmt,idx,alpha;rest] in a:list
        if fmt == 'NAME'
            if view_name == 1
                " NOTE: highlight name in all cases, 
                " 'Blue',':blUe','\BLUE'
                " except which is following or followed by '-_'
                " and use '\w' atom as it is faster than [:alnum:] form.
                let hi_ptn = '\v\c%(\w|[-_])@<!'.str.'%(\w|[-_])@!'
            else
                continue
            endif
        elseif fmt == 'HEX'
            " NOTE: highlight hex in all cases, 
            " '#ff00ff' 'ff00ff' '0xff00ff' ':ffffff'
            let hi_ptn = '\v\c%(#|<0x|<)'.hex.'>'
        elseif fmt == 'HEX3'
            let hi_ptn = '\v\c'.str.'>'
        else
            let hi_ptn = str
        endif
        
        " CV_prv_FF0000FF
        let hi_grp="CV_prv"."_".hex."FF"
        let hi_fg = view_homo==1 ? hex : s:rlt_clr(hex)

        if fmt =~ 'HEX'
            let hi_dic_name = fmt.'_'.hex
        elseif fmt == 'NAME'
            let hi_dic_name = fmt.'_'.tolower(str)
        else
            let hi_dic_name = substitute(str,'\W',"_","g")
        endif

        if !has_key(s:prev_dict,hi_dic_name)
            try
                call s:hi_color(hi_grp,hi_fg,hex," ")
                sil! let s:prev_dict[hi_dic_name]= matchadd(hi_grp,hi_ptn)
            catch /^Vim\%((\a\+)\)\=:E/
                call s:debug("E254: Could not hi color:".str)
            endtry
        endif
    endfor
endfunction "}}}
function! colorv#preview(...) "{{{

    let b:view_name=g:colorv_preview_name
    let b:view_homo=g:colorv_preview_homo

    let view_silent=0
    if a:0 "{{{
        " NOTE:      c->clear
        " n-> name_  b->homo   s->silence      
        " N-> noname B->nohomo S->nosilence     
        let b:view_name = a:1=~#"N" ? 0 : a:1=~#"n" ? 1 : b:view_name
        let b:view_homo = a:1=~#"B" ? 0 : a:1=~#"b" ? 1 : b:view_homo
        let view_silent = a:1=~#"S" ? 0 : a:1=~#"s" ? 1 : view_silent
        if a:1 =~# "c"
            call s:clear_match("prev")
        endif
    endif "}}}

    let o_time = s:time()

    " if file > 300 line, preview 200 line around cursor.
    let cur = line('.')
    let eof = line('$')
    let mprv = g:colorv_max_preview
    if eof >= mprv*3/2
        let [begin,end] = cur<mprv ? [1,mprv]
                  \ : cur>eof-mprv ? [eof-mprv,eof]
                  \ : [cur-mprv/2,cur+mprv/2]
    else
        let [begin,end] =[1,eof]
    endif

    let prv_list = []
    for line in getline(begin,end)
        call extend(prv_list,s:txt2hex(line))
    endfor
    call colorv#prev_list(prv_list)

    if !view_silent
        call s:echo( (end-begin)." lines previewed."
                \."Takes ". string(s:time() - o_time). " sec." )
    endif
endfunction "}}}
function! colorv#preview_line(...) "{{{

    let b:view_name=g:colorv_preview_name
    let b:view_homo=g:colorv_preview_homo
    if a:0
        " n-> name   b->homo   c->clear
        " N-> noname B->nohomo C->noclear
        let b:view_name = a:1=~#"N" ? 0 : a:1=~#"n" ? 1 : b:view_name
        let b:view_homo = a:1=~#"B" ? 0 : a:1=~#"b" ? 1 : b:view_homo
        if a:1 =~# "c"
            call s:clear_match("prev")
        endif
    endif

    " a:2:line num to parse
    if a:0>1 && a:2 > 0  && a:2 <= line('$')
        let line = getline(a:2)
    else
        let line = getline('.')
    endif

    call colorv#prev_list(s:txt2hex(line))
endfunction "}}}
function! colorv#prev_aug() "{{{
    aug colorv#prev_aug
        au!  BufWinEnter  <buffer> call colorv#preview()
        au!  BufWritePost <buffer> call colorv#preview()
        au!  InsertLeave  <buffer> call colorv#preview_line()
    aug END
endfunction "}}}
"LIST:"{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:gen_def_nums=20
let s:gen_def_step=10
let s:gen_def_type="Hue"
function! colorv#list_yiq_gen(hex,...) "{{{
    let hex=a:hex
    let hex_list=[]
    let type=exists("a:1") && !empty(a:1) ? a:1 : s:gen_def_type
    let nums=exists("a:2") && !empty(a:2) ? a:2 : s:gen_def_nums
    let step=exists("a:3") && !empty(a:3) ? a:3 : s:gen_def_step
    let circle=exists("a:4") ? a:4 : 1
    let [y,i,q] = colorv#rgb2yiq(colorv#hex2rgb(hex))
    let [h,s,v] = colorv#hex2hsv(hex)
    let [h0,s0,v0] = [h,s,v]
    let [y0,i0,q0] = [y,i,q]
    let hex0 = hex
    cal add(hex_list,hex0)
    if type==?"Hue"
        for i in range(1,nums-1)
            let h{i}=h+i*step
            let hex{i}=colorv#hsv2hex([h{i},s,v])
            let [y{i},i{i},q{i}]=colorv#rgb2yiq(colorv#hex2rgb(hex{i}))
            let hex{i} = colorv#yiq2hex([y,i{i},q{i}])
            call add(hex_list,hex{i})
        endfor
    elseif type==?"Luma"
        "y+
        for i in range(1,nums-1)
            let y{i}=y{i-1}+step
            if circle==1
                let y{i} = y{i} >=100 ? 1 : y{i} <= 0 ? 100 : y{i}
            else
                let y{i} = y{i} >=100 ? 100 : y{i} <= 0 ? 1 : y{i}
            endif
            let hex=colorv#yiq2hex([y{i},i,q])
            call add(hex_list,hex)
        endfor
    elseif type=="Value"
        "v+
        " let v{i}= v+step*i<=100 ? v+step*i : 100
        for i in range(1,nums-1)
            let y{i}=y{i-1}+step
            if circle==1
                let y{i} = y{i} >=100 ? 1 : y{i} <= 0 ? 100 : y{i}
            else
                let y{i} = y{i} >=100 ? 100 : y{i} <= 0 ? 1 : y{i}
            endif
            let hex=colorv#yiq2hex([y{i},i,q])
            call add(hex_list,hex)
        endfor
    elseif type=="Saturation"
        for i in range(1,nums-1)
            let s{i}=s{i-1}+step
            if circle==1
                let s{i} = s{i} >=100 ? 1 : s{i} <= 0 ? 100 : s{i}
            else
                let s{i} = s{i} >=100 ? 100 : s{i} <= 0 ? 1 : s{i}
            endif
            let hex{i}=colorv#hsv2hex([h,s{i},v])
            let [y{i},i{i},q{i}]=colorv#hex2yiq(hex{i})
            let hex{i} = colorv#yiq2hex([y,i{i},q{i}])
            call add(hex_list,hex{i})
        endfor
    elseif type=="Monochromatic"
        let hex_list=colorv#list_gen(hex,"Monochromatic",nums,step)
    elseif type=="Analogous"
        let hex_list=colorv#list_yiq_gen(hex,"Hue",nums,30)
    elseif type==?"Neutral"
        let hex_list=colorv#list_yiq_gen(hex,"Hue",nums,15)
    elseif type==?"Complementary"
        let hex_list=colorv#list_yiq_gen(hex,"Hue",nums,180)
    elseif type=="Split-Complementary"
        for i in range(1,nums-1)
            let h{i}=s:fmod(i,2)==1 ? h{i-1}+150 : h{i-1}+60
            let hex{i}=colorv#hsv2hex([h{i},s,v])
            let [y{i},i{i},q{i}]=colorv#rgb2yiq(colorv#hex2rgb(hex{i}))
            let hex{i} = colorv#yiq2hex([y,i{i},q{i}])
            call add(hex_list,hex{i})
        endfor
    elseif type==?"Triadic"
        let hex_list=colorv#list_yiq_gen(hex,"Hue",nums,120)
    elseif type=="Clash"
        for i in range(1,nums-1)
            let h{i}=s:fmod(i,2)==1 ? h{i-1}+90 : h{i-1}+180
            let hex{i}=colorv#hsv2hex([h{i},s,v])
            let [y{i},i{i},q{i}]=colorv#rgb2yiq(colorv#hex2rgb(hex{i}))
            let hex{i} = colorv#yiq2hex([y,i{i},q{i}])
            call add(hex_list,hex{i})
        endfor
    elseif type=="Square"
        let hex_list=colorv#list_yiq_gen(hex,"Hue",nums,90)
    elseif type=="Tetradic" || type=="Rectangle"
        "h+60,h+120,...
        for i in range(1,nums-1)
            let h{i}=s:fmod(i,2)==1 ? h{i-1}+60 : h{i-1}+120
            let hex{i}=colorv#hsv2hex([h{i},s,v])
            let [y{i},i{i},q{i}]=colorv#rgb2yiq(colorv#hex2rgb(hex{i}))
            let hex{i} = colorv#yiq2hex([y,i{i},q{i}])
            call add(hex_list,hex{i})
        endfor
    elseif type==?"Five-Tone"
        "h+115,+40,+50,+40,+115
        for i in range(1,nums-1)
            let h{i}=s:fmod(i,5)==1 ? h{i-1}+115 :
                    \ s:fmod(i,5)==2 ? h{i-1}+40 :
                    \ s:fmod(i,5)==3 ? h{i-1}+50 :
                    \ s:fmod(i,5)==4 ? h{i-1}+40 :
                    \ h{i-1}+115
            let hex{i}=colorv#hsv2hex([h{i},s,v])
            let [y{i},i{i},q{i}]=colorv#rgb2yiq(colorv#hex2rgb(hex{i}))
            let hex{i} = colorv#yiq2hex([y,i{i},q{i}])
            call add(hex_list,hex{i})
        endfor
    elseif type==?"Six-Tone"
        for i in range(1,nums-1)
            let h{i}=s:fmod(i,2)==1 ? h{i-1}+30 : h{i-1}+90
            let hex{i}=colorv#hsv2hex([h{i},s,v])
            let [y{i},i{i},q{i}]=colorv#rgb2yiq(colorv#hex2rgb(hex{i}))
            let hex{i} = colorv#yiq2hex([y,i{i},q{i}])
            call add(hex_list,hex{i})
        endfor
    else
            call s:warning("No fitting Color Generator Type.")
            return []
    endif
    return hex_list
endfunction "}}}
function! colorv#list_gen(hex,...) "{{{
    let hex=a:hex
    let hex_list=[]
    let type=exists("a:1") && !empty(a:1) ? a:1 : s:gen_def_type
    let nums=exists("a:2") && !empty(a:2) ? a:2 : s:gen_def_nums
    let step=exists("a:3") && !empty(a:3) ? a:3 : s:gen_def_step

    " set to 1 .the value will became 0 if exceed max.
    let circle=exists("a:4") ? a:4 : 1


    let [h,s,v] = colorv#hex2hsv(hex)
    let [h0,s0,v0] = [h,s,v]
    let hex0 = hex
    call add(hex_list,hex0)
    for i in range(1,nums-1)
        if type==?"Hue"
            "h+
            let h{i} = h + step*i
            let hex{i} = colorv#hsv2hex([h{i} ,s ,v])
        elseif type==?"Saturation"
            "s+
            let s{i} = s{i-1} + step
            if ( circle )
                let s{i} = s{i} >= 100 ? 1   : s{i} <= 0 ? 100 : s{i}
            else
                let s{i} = s{i} >= 100 ? 100 : s{i} <= 0 ? 1   : s{i}
            endif
            let hex{i}=colorv#hsv2hex([h,s{i},v])
        elseif type==?"Value"
            "v+
            let v{i} = v{i-1} + step
            if circle==1
                let v{i} = v{i} >=100 ? 1 : v{i} <= 0 ? 100 : v{i}
            else
                let v{i} = v{i} >=100 ? 100 : v{i} <= 0 ? 1 : v{i}
            endif
            let hex{i}=colorv#hsv2hex([h,s,v{i}])
        elseif type==?"Monochromatic"
            "s+step v+step
            let step=step>0 ? 5 : step<0 ? -5 : 0
            let s{i}=s{i-1}+step
            let v{i}=v{i-1}+step
            if circle==1
                let s{i} = s{i} >=100 ? 1 : s{i} <= 0 ? 100 : s{i}
                let v{i} = v{i} >=100 ? 1 : v{i} <= 0 ? 100 : v{i}
            else
                let s{i} = s{i} >=100 ? 100 : s{i} <= 0 ? 1 : s{i}
                let v{i} = v{i} >=100 ? 100 : v{i} <= 0 ? 1 : v{i}
            endif
            let hex{i}=colorv#hsv2hex([h,s{i},v{i}])
        elseif type==?"MonSat"
            "s always -step,v+step
            let step=step>0 ? 5 : step<0 ? -5 : 0
            let s{i}=s{i-1}-abs(step)
            let v{i}=v{i-1}+step
            if circle==1
                let s{i} = s{i} >=100 ? 1 : s{i} <= 0 ? 100 : s{i}
                let v{i} = v{i} >=100 ? 1 : v{i} <= 0 ? 100 : v{i}
            else
                let s{i} = s{i} >=100 ? 100 : s{i} <= 0 ? 1 : s{i}
                let v{i} = v{i} >=100 ? 100 : v{i} <= 0 ? 1 : v{i}
            endif
            let hex{i}=colorv#hsv2hex([h,s{i},v{i}])
        elseif type==?"Analogous"
            "h+30
            let h{i}=h+30*i
            let hex{i}=colorv#hsv2hex([h{i},s,v])
        elseif type==?"Neutral"
            "h+15
            let h{i}=h+15*i
            let hex{i}=colorv#hsv2hex([h{i},s,v])
        elseif type==?"Complementary"
            "h+180
            let h{i}=h+180*i
            let hex{i}=colorv#hsv2hex([h{i},s,v])
        elseif type==?"Split-Complementary"
            "h+150,h+60,...
            let h{i}=s:fmod(i,2)==1 ? h{i-1}+150 : h{i-1}+60
            let hex{i}=colorv#hsv2hex([h{i},s,v])
        elseif type==?"Triadic"
            "h+120
            let h{i}=h+120*i
            let hex{i}=colorv#hsv2hex([h{i},s,v])
        elseif type==?"Clash"
            "h+90,h+180,...
            let h{i}=s:fmod(i,2)==1 ? h{i-1}+90 : h{i-1}+180
            let hex{i}=colorv#hsv2hex([h{i},s,v])
        elseif type==?"Square"
            "h+90
            let h{i}=h+90*i
            let hex{i}=colorv#hsv2hex([h{i},s,v])
        elseif type==?"Tetradic" || type==?"Rectangle"
            "h+60,h+120,...
            let h{i}=s:fmod(i,2)==1 ? h{i-1}+60 : h{i-1}+120
            let hex{i}=colorv#hsv2hex([h{i},s,v])
        elseif type==?"Five-Tone"
            "h+115,+40,+50,+40,+115
            let h{i}=s:fmod(i,5)==1 ? h{i-1}+115 :
                    \ s:fmod(i,5)==2 ? h{i-1}+40  :
                    \ s:fmod(i,5)==3 ? h{i-1}+50  :
                    \ s:fmod(i,5)==4 ? h{i-1}+40  :
                    \ h{i-1}+115
            let hex{i}=colorv#hsv2hex([h{i},s,v])
        elseif type==?"Six-Tone"
            "h+30,90,...
            let h{i}=s:fmod(i,2)==1 ? h{i-1}+30 : h{i-1}+90
            let hex{i}=colorv#hsv2hex([h{i},s,v])
        else
            call s:warning("No fitting Color Generator Type.")
            return []
        endif
        call add(hex_list,hex{i})
    endfor
    return hex_list
endfunction "}}}
function! colorv#list_gen2(hex1,hex2) "{{{
    let hex0=s:fmt_hex(a:hex1)
    let HEX0=s:fmt_hex(a:hex2)
    let hex_list=[]
    let nums=20
    let [h0,s0,v0] = colorv#hex2hsv(hex0)
    let [H0,S0,V0] = colorv#hex2hsv(HEX0)
    let [hd,sd,vd] = [H0-h0,S0-s0,V0-v0]
    " NOTE: differ hex0 to hex1 and hex1 to hex0
    if hd < 0
        let hd +=360
    endif
    let hstep = (hd+0.0) /(nums-1)
    let sstep = (sd+0.0) /(nums-1)
    let vstep = (vd+0.0) /(nums-1)
    call add(hex_list,hex0)
    for i in range(1,nums-1)
        
        let h{i}  = h{i-1} + hstep
        let s{i}  = s{i-1} + sstep
        let v{i}  = v{i-1} + vstep

        let hex{i}=colorv#hsv2hex([h{i},s{i},v{i}])
        call add(hex_list,hex{i})
    endfor
    return hex_list
endfunction "}}}
function! s:list_winlist2(hex1,hex2) "{{{
    let hex1=a:hex1
    let hex2=a:hex2
    let genlist=colorv#list_gen2(hex1,hex2)

    let list=[]
    call add(list,['TurtTo List','======='])
    let i=0
    for hex in genlist
        call add(list,["TurnTo".i,hex])
        let i+=1
    endfor

    return list
endfunction "}}}
"INIT: "{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! colorv#write_cache() "{{{
    let CacheStringList = []
    let file = g:colorv_cache_file
    if len(s:his_mkd_list) < 18
        let list = deepcopy(s:his_mkd_list[0:-1])
    else
        let list = deepcopy(s:his_mkd_list[-18:-1])
    endif
    let his_txt="MAKRED_COLOR\t"
    for hex in list
        let his_txt .= " ".hex
    endfor
    call add(CacheStringList,his_txt)
    try
        call writefile(CacheStringList,file)
    catch /^Vim\%((\a\+)\)\=:E/
        call s:debug("Could not caching mark colors. ".v:exception)
        return -1
    endtry
endfunction "}}}
function! colorv#load_cache() "{{{
    let file = g:colorv_cache_file
    try
        let CacheStringList = readfile(file)
    catch /^Vim\%((\a\+)\)\=:E/
        call s:debug("Could not load cache. ".v:exception)
        return -1
    endtry
    for i in CacheStringList
        if i =~ 'MAKRED_COLOR'
            let txt = matchstr(i,'MAKRED_COLOR\s*\zs.*\ze$')
            let his_list = split(txt)
        endif
    endfor
    if exists("his_list") && !empty(his_list)
        let s:his_mkd_list=deepcopy(his_list)
    endif
endfunction "}}}
function! colorv#init() "{{{
    call colorv#default("g:colorv_debug"         , 0                )
    call colorv#default("g:colorv_no_python"     , 0                )
    call colorv#default("g:colorv_load_cache"    , 1                )
    call colorv#default("g:colorv_win_pos"       , "bot"            )
    call colorv#default("g:colorv_preview_name"  , 1                )
    call colorv#default("g:colorv_preview_homo"  , 0                )
    call colorv#default("g:colorv_gen_space"     , "hsv"            )
    call colorv#default("g:colorv_preview_ftype" , 'css,javascript' )
    call colorv#default("g:colorv_max_preview"   , 200              )
    call colorv#default("g:colorv_python_cmd"    , "python2"        )
    if !exists('g:colorv_cache_file') "{{{
        if has("win32") || has("win64")
            if exists('$HOME')
                let g:colorv_cache_file = expand('$HOME') . '\.vim_colorv_cache'
            else
                let g:colorv_cache_file = expand('$VIM') . '\.vim_galaxy_cache'
            endif
        else
            let g:colorv_cache_file = expand('$HOME') . '/.vim_colorv_cache'
        endif
    endif "}}}

    if has("python") "{{{
        let g:colorv_has_python = 2
        let s:py="py"
        call s:py_core_load()
    elseif has("python3")
        let g:colorv_has_python = 3
        let s:py="py3"
        call s:py_core_load()
    else
        let g:colorv_has_python = 0
    endif "}}}

    if g:colorv_load_cache==1 "{{{
        call colorv#load_cache()
        aug colorv#cache
            au! VIMLEAVEPre * call colorv#write_cache()
        aug END
    endif "}}}

    aug colorv#preview_ftpye "{{{
        for file in  split(g:colorv_preview_ftype, '\s*,\s*')
                exec "au!  FileType ".file." call colorv#prev_aug()"
        endfor
    aug END "}}}
endfunction "}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call colorv#init()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &cpo = s:save_cpo
unlet s:save_cpo
" vim:tw=78:fdm=marker:
