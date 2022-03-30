module Deku.DOM
  (class TagToDeku
  -- codegen 7
  , Accept(..)
  , AcceptCharset(..)
  , Accesskey(..)
  , Action(..)
  , Align(..)
  , Allow(..)
  , Alt(..)
  , Async(..)
  , Autocapitalize(..)
  , Autocomplete(..)
  , Autofocus(..)
  , Autoplay(..)
  , Background(..)
  , Bgcolor(..)
  , Border(..)
  , Buffered(..)
  , Capture(..)
  , Challenge(..)
  , Charset(..)
  , Checked(..)
  , Cite(..)
  , Class(..)
  , Code(..)
  , Codebase(..)
  , Color(..)
  , Cols(..)
  , Colspan(..)
  , Content(..)
  , Contenteditable(..)
  , Contextmenu(..)
  , Controls(..)
  , Coords(..)
  , Crossorigin(..)
  , Csp(..)
  , Data(..)
  , Datetime(..)
  , Decoding(..)
  , Default(..)
  , Defer(..)
  , Dir(..)
  , Dirname(..)
  , Disabled(..)
  , Download(..)
  , Draggable(..)
  , Enctype(..)
  , Enterkeyhint(..)
  , For(..)
  , Form(..)
  , Formaction(..)
  , Formenctype(..)
  , Formmethod(..)
  , Formnovalidate(..)
  , Formtarget(..)
  , Headers(..)
  , Height(..)
  , Hidden(..)
  , High(..)
  , Href(..)
  , Hreflang(..)
  , HttpEquiv(..)
  , Icon(..)
  , Id(..)
  , Importance(..)
  , Integrity(..)
  , Intrinsicsize(..)
  , Inputmode(..)
  , Ismap(..)
  , Itemprop(..)
  , Keytype(..)
  , Kind(..)
  , Label(..)
  , Lang(..)
  , Language(..)
  , Loading(..)
  , List(..)
  , Loop(..)
  , Low(..)
  , Manifest(..)
  , Max(..)
  , Maxlength(..)
  , Minlength(..)
  , Media(..)
  , Method(..)
  , Min(..)
  , Multiple(..)
  , Muted(..)
  , Name(..)
  , Novalidate(..)
  , Open(..)
  , Optimum(..)
  , Pattern(..)
  , Ping(..)
  , Placeholder(..)
  , Poster(..)
  , Preload(..)
  , Radiogroup(..)
  , Readonly(..)
  , Referrerpolicy(..)
  , Rel(..)
  , Required(..)
  , Reversed(..)
  , Rows(..)
  , Rowspan(..)
  , Sandbox(..)
  , Scope(..)
  , Scoped(..)
  , Selected(..)
  , Shape(..)
  , Size(..)
  , Sizes(..)
  , Slot(..)
  , Span(..)
  , Spellcheck(..)
  , Src(..)
  , Srcdoc(..)
  , Srclang(..)
  , Srcset(..)
  , Start(..)
  , Step(..)
  , Style(..)
  , Summary(..)
  , Tabindex(..)
  , Target(..)
  , Title(..)
  , Translate(..)
  , Usemap(..)
  , Value(..)
  , Width(..)
  , Xtype(..)
  , OnAbort(..)
  , OnAnimationcancel (..)
  , OnAnimationend (..)
  , OnAnimationiteration (..)
  , OnAnimationstart (..)
  , OnAuxclick (..)
  , OnBlur(..)
  , OnError(..)
  , OnFocus(..)
  , OnCancel(..)
  , OnCanplay(..)
  , OnCanplaythrough(..)
  , OnChange(..)
  , OnClick(..)
  , OnClose(..)
  , OnContextmenu(..)
  , OnDblclick(..)
  , OnDrag(..)
  , OnDragend(..)
  , OnDragenter(..)
  , OnDragleave(..)
  , OnDragover(..)
  , OnDragstart(..)
  , OnDrop(..)
  , OnDurationchange(..)
  , OnEmptied(..)
  , OnEnded(..)
  , OnFormdata(..)
  , OnGotpointercapture(..)
  , OnInput(..)
  , OnInvalid(..)
  , OnKeydown(..)
  , OnKeypress(..)
  , OnKeyup(..)
  , OnLoad(..)
  , OnLoadeddata(..)
  , OnLoadedmetadata(..)
  , OnLoadend(..)
  , OnLoadstart(..)
  , OnLostpointercapture(..)
  , OnMousedown(..)
  , OnMouseenter(..)
  , OnMouseleave(..)
  , OnMousemove(..)
  , OnMouseout(..)
  , OnMouseover(..)
  , OnMouseup(..)
  , OnMousewheel  (..)
  , OnWheel(..)
  , OnPause(..)
  , OnPlay(..)
  , OnPlaying(..)
  , OnPointerdown(..)
  , OnPointermove(..)
  , OnPointerup(..)
  , OnPointercancel(..)
  , OnPointerover(..)
  , OnPointerout(..)
  , OnPointerenter(..)
  , OnPointerleave(..)
  , OnPointerlockchange (..)
  , OnPointerlockerror (..)
  , OnProgress(..)
  , OnRatechange(..)
  , OnReset(..)
  , OnResize(..)
  , OnScroll(..)
  , OnSecuritypolicyviolation(..)
  , OnSeeked(..)
  , OnSeeking(..)
  , OnSelect(..)
  , OnSelectstart(..)
  , OnSelectionchange(..)
  , OnShow (..)
  , OnSlotchange(..)
  , OnStalled(..)
  , OnSubmit(..)
  , OnSuspend(..)
  , OnTimeupdate(..)
  , OnVolumechange(..)
  , OnTouchcancel  (..)
  , OnTouchend  (..)
  , OnTouchmove  (..)
  , OnTouchstart  (..)
  , OnTransitioncancel(..)
  , OnTransitionend(..)
  , OnTransitionrun(..)
  , OnTransitionstart(..)
  , OnWaiting(..)
  -- codegen 7
  -- codegen 0
  , A_
  , a
  , a_
  , Abbr_
  , abbr
  , abbr_
  , Acronym_
  , acronym
  , acronym_
  , Address_
  , address
  , address_
  , Applet_
  , applet
  , applet_
  , Area_
  , area
  , area_
  , Article_
  , article
  , article_
  , Aside_
  , aside
  , aside_
  , Audio_
  , audio
  , audio_
  , B_
  , b
  , b_
  , Base_
  , base
  , base_
  , Basefont_
  , basefont
  , basefont_
  , Bdi_
  , bdi
  , bdi_
  , Bdo_
  , bdo
  , bdo_
  , Big_
  , big
  , big_
  , Blockquote_
  , blockquote
  , blockquote_
  , Body_
  , body
  , body_
  , Br_
  , br
  , br_
  , Button_
  , button
  , button_
  , Canvas_
  , canvas
  , canvas_
  , Caption_
  , caption
  , caption_
  , Center_
  , center
  , center_
  , Cite_
  , cite
  , cite_
  , Code_
  , code
  , code_
  , Col_
  , col
  , col_
  , Colgroup_
  , colgroup
  , colgroup_
  , Xdata_
  , xdata
  , xdata_
  , Datalist_
  , datalist
  , datalist_
  , Dd_
  , dd
  , dd_
  , Del_
  , del
  , del_
  , Details_
  , details
  , details_
  , Dfn_
  , dfn
  , dfn_
  , Dialog_
  , dialog
  , dialog_
  , Dir_
  , dir
  , dir_
  , Div_
  , div
  , div_
  , Dl_
  , dl
  , dl_
  , Dt_
  , dt
  , dt_
  , Em_
  , em
  , em_
  , Embed_
  , embed
  , embed_
  , Fieldset_
  , fieldset
  , fieldset_
  , Figcaption_
  , figcaption
  , figcaption_
  , Figure_
  , figure
  , figure_
  , Font_
  , font
  , font_
  , Footer_
  , footer
  , footer_
  , Form_
  , form
  , form_
  , Frame_
  , frame
  , frame_
  , Frameset_
  , frameset
  , frameset_
  , H1_
  , h1
  , h1_
  , H2_
  , h2
  , h2_
  , H3_
  , h3
  , h3_
  , H4_
  , h4
  , h4_
  , H5_
  , h5
  , h5_
  , H6_
  , h6
  , h6_
  , Head_
  , head
  , head_
  , Header_
  , header
  , header_
  , Hr_
  , hr
  , hr_
  , Html_
  , html
  , html_
  , I_
  , i
  , i_
  , Iframe_
  , iframe
  , iframe_
  , Img_
  , img
  , img_
  , Input_
  , input
  , input_
  , Ins_
  , ins
  , ins_
  , Kbd_
  , kbd
  , kbd_
  , Label_
  , label
  , label_
  , Legend_
  , legend
  , legend_
  , Li_
  , li
  , li_
  , Link_
  , link
  , link_
  , Main_
  , main
  , main_
  , Map_
  , map
  , map_
  , Mark_
  , mark
  , mark_
  , Meta_
  , meta
  , meta_
  , Meter_
  , meter
  , meter_
  , Nav_
  , nav
  , nav_
  , Noframes_
  , noframes
  , noframes_
  , Noscript_
  , noscript
  , noscript_
  , Object_
  , object
  , object_
  , Ol_
  , ol
  , ol_
  , Optgroup_
  , optgroup
  , optgroup_
  , Option_
  , option
  , option_
  , Output_
  , output
  , output_
  , P_
  , p
  , p_
  , Param_
  , param
  , param_
  , Picture_
  , picture
  , picture_
  , Pre_
  , pre
  , pre_
  , Progress_
  , progress
  , progress_
  , Q_
  , q
  , q_
  , Rp_
  , rp
  , rp_
  , Rt_
  , rt
  , rt_
  , Ruby_
  , ruby
  , ruby_
  , S_
  , s
  , s_
  , Samp_
  , samp
  , samp_
  , Script_
  , script
  , script_
  , Section_
  , section
  , section_
  , Select_
  , select
  , select_
  , Small_
  , small
  , small_
  , Source_
  , source
  , source_
  , Span_
  , span
  , span_
  , Strike_
  , strike
  , strike_
  , Strong_
  , strong
  , strong_
  , Style_
  , style
  , style_
  , Sub_
  , sub
  , sub_
  , Summary_
  , summary
  , summary_
  , Sup_
  , sup
  , sup_
  , Svg_
  , svg
  , svg_
  , Table_
  , table
  , table_
  , Tbody_
  , tbody
  , tbody_
  , Td_
  , td
  , td_
  , Template_
  , template
  , template_
  , Textarea_
  , textarea
  , textarea_
  , Tfoot_
  , tfoot
  , tfoot_
  , Th_
  , th
  , th_
  , Thead_
  , thead
  , thead_
  , Time_
  , time
  , time_
  , Title_
  , title
  , title_
  , Tr_
  , tr
  , tr_
  , Track_
  , track
  , track_
  , Tt_
  , tt
  , tt_
  , U_
  , u
  , u_
  , Ul_
  , ul
  , ul_
  , Var_
  , var
  , var_
  , Video_
  , video
  , video_
  , Wbr_
  , wbr
  , wbr_
  -- codegen 0
  ) where

import Prelude hiding (map)

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Exists (Exists, mkExists, runExists)
import Data.Foldable (foldl)
import Data.Functor as F
import Data.Hashable (class Hashable)
import Data.Map (Map)
import Deku.Core ( Element', Element_)
import Data.Maybe (Maybe(..))
import Data.Tuple (curry)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Attribute (class Attr, unsafeAttribute, prop', cb', Cb, Attribute, unsafeUnAttributeArray)
import Deku.Control(elementify, text)
import Deku.Core (DOMInterpret(..))
import FRP.Behavior (Behavior, sample_)
import FRP.Event (Event, keepLatest)

class TagToDeku (tag :: Symbol) (deku :: Type) | tag -> deku

-- codegen 8
data Accept = Accept
data AcceptCharset = AcceptCharset
data Accesskey = Accesskey
data Action = Action
data Align = Align
data Allow = Allow
data Alt = Alt
data Async = Async
data Autocapitalize = Autocapitalize
data Autocomplete = Autocomplete
data Autofocus = Autofocus
data Autoplay = Autoplay
data Background = Background
data Bgcolor = Bgcolor
data Border = Border
data Buffered = Buffered
data Capture = Capture
data Challenge = Challenge
data Charset = Charset
data Checked = Checked
data Cite = Cite
data Class = Class
data Code = Code
data Codebase = Codebase
data Color = Color
data Cols = Cols
data Colspan = Colspan
data Content = Content
data Contenteditable = Contenteditable
data Contextmenu = Contextmenu
data Controls = Controls
data Coords = Coords
data Crossorigin = Crossorigin
data Csp = Csp
data Data = Data
data Datetime = Datetime
data Decoding = Decoding
data Default = Default
data Defer = Defer
data Dir = Dir
data Dirname = Dirname
data Disabled = Disabled
data Download = Download
data Draggable = Draggable
data Enctype = Enctype
data Enterkeyhint = Enterkeyhint
data For = For
data Form = Form
data Formaction = Formaction
data Formenctype = Formenctype
data Formmethod = Formmethod
data Formnovalidate = Formnovalidate
data Formtarget = Formtarget
data Headers = Headers
data Height = Height
data Hidden = Hidden
data High = High
data Href = Href
data Hreflang = Hreflang
data HttpEquiv = HttpEquiv
data Icon = Icon
data Id = Id
data Importance = Importance
data Integrity = Integrity
data Intrinsicsize = Intrinsicsize
data Inputmode = Inputmode
data Ismap = Ismap
data Itemprop = Itemprop
data Keytype = Keytype
data Kind = Kind
data Label = Label
data Lang = Lang
data Language = Language
data Loading = Loading
data List = List
data Loop = Loop
data Low = Low
data Manifest = Manifest
data Max = Max
data Maxlength = Maxlength
data Minlength = Minlength
data Media = Media
data Method = Method
data Min = Min
data Multiple = Multiple
data Muted = Muted
data Name = Name
data Novalidate = Novalidate
data Open = Open
data Optimum = Optimum
data Pattern = Pattern
data Ping = Ping
data Placeholder = Placeholder
data Poster = Poster
data Preload = Preload
data Radiogroup = Radiogroup
data Readonly = Readonly
data Referrerpolicy = Referrerpolicy
data Rel = Rel
data Required = Required
data Reversed = Reversed
data Rows = Rows
data Rowspan = Rowspan
data Sandbox = Sandbox
data Scope = Scope
data Scoped = Scoped
data Selected = Selected
data Shape = Shape
data Size = Size
data Sizes = Sizes
data Slot = Slot
data Span = Span
data Spellcheck = Spellcheck
data Src = Src
data Srcdoc = Srcdoc
data Srclang = Srclang
data Srcset = Srcset
data Start = Start
data Step = Step
data Style = Style
data Summary = Summary
data Tabindex = Tabindex
data Target = Target
data Title = Title
data Translate = Translate
data Usemap = Usemap
data Value = Value
data Width = Width
data Xtype = Xtype
data OnAbort = OnAbort
data OnAnimationcancel  = OnAnimationcancel
data OnAnimationend  = OnAnimationend
data OnAnimationiteration  = OnAnimationiteration
data OnAnimationstart  = OnAnimationstart
data OnAuxclick  = OnAuxclick
data OnBlur = OnBlur
data OnError = OnError
data OnFocus = OnFocus
data OnCancel = OnCancel
data OnCanplay = OnCanplay
data OnCanplaythrough = OnCanplaythrough
data OnChange = OnChange
data OnClick = OnClick
data OnClose = OnClose
data OnContextmenu = OnContextmenu
data OnDblclick = OnDblclick
data OnDrag = OnDrag
data OnDragend = OnDragend
data OnDragenter = OnDragenter
data OnDragleave = OnDragleave
data OnDragover = OnDragover
data OnDragstart = OnDragstart
data OnDrop = OnDrop
data OnDurationchange = OnDurationchange
data OnEmptied = OnEmptied
data OnEnded = OnEnded
data OnFormdata = OnFormdata
data OnGotpointercapture = OnGotpointercapture
data OnInput = OnInput
data OnInvalid = OnInvalid
data OnKeydown = OnKeydown
data OnKeypress = OnKeypress
data OnKeyup = OnKeyup
data OnLoad = OnLoad
data OnLoadeddata = OnLoadeddata
data OnLoadedmetadata = OnLoadedmetadata
data OnLoadend = OnLoadend
data OnLoadstart = OnLoadstart
data OnLostpointercapture = OnLostpointercapture
data OnMousedown = OnMousedown
data OnMouseenter = OnMouseenter
data OnMouseleave = OnMouseleave
data OnMousemove = OnMousemove
data OnMouseout = OnMouseout
data OnMouseover = OnMouseover
data OnMouseup = OnMouseup
data OnMousewheel   = OnMousewheel
data OnWheel = OnWheel
data OnPause = OnPause
data OnPlay = OnPlay
data OnPlaying = OnPlaying
data OnPointerdown = OnPointerdown
data OnPointermove = OnPointermove
data OnPointerup = OnPointerup
data OnPointercancel = OnPointercancel
data OnPointerover = OnPointerover
data OnPointerout = OnPointerout
data OnPointerenter = OnPointerenter
data OnPointerleave = OnPointerleave
data OnPointerlockchange  = OnPointerlockchange
data OnPointerlockerror  = OnPointerlockerror
data OnProgress = OnProgress
data OnRatechange = OnRatechange
data OnReset = OnReset
data OnResize = OnResize
data OnScroll = OnScroll
data OnSecuritypolicyviolation = OnSecuritypolicyviolation
data OnSeeked = OnSeeked
data OnSeeking = OnSeeking
data OnSelect = OnSelect
data OnSelectstart = OnSelectstart
data OnSelectionchange = OnSelectionchange
data OnShow  = OnShow
data OnSlotchange = OnSlotchange
data OnStalled = OnStalled
data OnSubmit = OnSubmit
data OnSuspend = OnSuspend
data OnTimeupdate = OnTimeupdate
data OnVolumechange = OnVolumechange
data OnTouchcancel   = OnTouchcancel
data OnTouchend   = OnTouchend
data OnTouchmove   = OnTouchmove
data OnTouchstart   = OnTouchstart
data OnTransitioncancel = OnTransitioncancel
data OnTransitionend = OnTransitionend
data OnTransitionrun = OnTransitionrun
data OnTransitionstart = OnTransitionstart
data OnWaiting = OnWaiting
instance Attr Form_ Accept String where
  attr Accept value = unsafeAttribute { key: "accept", value: prop' value }

instance Attr Input_ Accept String where
  attr Accept value = unsafeAttribute { key: "accept", value: prop' value }

instance Attr Form_ AcceptCharset String where
  attr AcceptCharset value = unsafeAttribute { key: "accept-charset", value: prop' value }

instance Attr A_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Abbr_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Acronym_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Address_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Applet_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Area_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Article_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Aside_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Audio_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr B_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Base_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Basefont_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Bdi_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Bdo_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Big_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Blockquote_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Body_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Br_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Button_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Canvas_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Caption_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Center_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Cite_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Code_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Col_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Colgroup_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Xdata_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Datalist_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Dd_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Del_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Details_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Dfn_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Dialog_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Dir_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Div_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Dl_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Dt_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Em_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Embed_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Fieldset_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Figcaption_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Figure_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Font_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Footer_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Form_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Frame_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Frameset_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr H1_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr H2_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr H3_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr H4_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr H5_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr H6_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Head_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Header_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Hr_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Html_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr I_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Iframe_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Img_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Input_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Ins_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Kbd_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Label_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Legend_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Li_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Link_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Main_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Map_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Mark_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Meta_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Meter_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Nav_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Noframes_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Noscript_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Object_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Ol_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Optgroup_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Option_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Output_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr P_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Param_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Picture_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Pre_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Progress_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Q_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Rp_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Rt_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Ruby_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr S_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Samp_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Script_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Section_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Select_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Small_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Source_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Span_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Strike_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Strong_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Style_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Sub_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Summary_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Sup_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Svg_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Table_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Tbody_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Td_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Template_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Textarea_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Tfoot_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Th_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Thead_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Time_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Title_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Tr_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Track_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Tt_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr U_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Ul_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Var_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Video_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Wbr_ Accesskey String where
  attr Accesskey value = unsafeAttribute { key: "accesskey", value: prop' value }

instance Attr Form_ Action String where
  attr Action value = unsafeAttribute { key: "action", value: prop' value }

instance Attr Applet_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Caption_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Col_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Colgroup_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Hr_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Iframe_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Img_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Table_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Tbody_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Td_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Tfoot_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Th_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Thead_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Tr_ Align String where
  attr Align value = unsafeAttribute { key: "align", value: prop' value }

instance Attr Iframe_ Allow String where
  attr Allow value = unsafeAttribute { key: "allow", value: prop' value }

instance Attr Applet_ Alt String where
  attr Alt value = unsafeAttribute { key: "alt", value: prop' value }

instance Attr Area_ Alt String where
  attr Alt value = unsafeAttribute { key: "alt", value: prop' value }

instance Attr Img_ Alt String where
  attr Alt value = unsafeAttribute { key: "alt", value: prop' value }

instance Attr Input_ Alt String where
  attr Alt value = unsafeAttribute { key: "alt", value: prop' value }

instance Attr Script_ Async String where
  attr Async value = unsafeAttribute { key: "async", value: prop' value }

instance Attr A_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Abbr_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Acronym_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Address_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Applet_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Area_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Article_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Aside_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Audio_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr B_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Base_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Basefont_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Bdi_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Bdo_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Big_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Blockquote_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Body_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Br_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Button_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Canvas_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Caption_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Center_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Cite_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Code_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Col_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Colgroup_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Xdata_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Datalist_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Dd_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Del_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Details_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Dfn_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Dialog_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Dir_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Div_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Dl_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Dt_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Em_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Embed_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Fieldset_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Figcaption_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Figure_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Font_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Footer_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Form_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Frame_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Frameset_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr H1_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr H2_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr H3_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr H4_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr H5_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr H6_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Head_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Header_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Hr_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Html_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr I_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Iframe_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Img_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Input_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Ins_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Kbd_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Label_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Legend_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Li_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Link_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Main_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Map_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Mark_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Meta_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Meter_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Nav_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Noframes_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Noscript_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Object_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Ol_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Optgroup_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Option_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Output_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr P_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Param_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Picture_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Pre_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Progress_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Q_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Rp_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Rt_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Ruby_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr S_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Samp_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Script_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Section_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Select_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Small_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Source_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Span_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Strike_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Strong_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Style_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Sub_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Summary_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Sup_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Svg_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Table_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Tbody_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Td_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Template_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Textarea_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Tfoot_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Th_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Thead_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Time_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Title_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Tr_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Track_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Tt_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr U_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Ul_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Var_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Video_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Wbr_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute { key: "autocapitalize", value: prop' value }

instance Attr Form_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute { key: "autocomplete", value: prop' value }

instance Attr Input_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute { key: "autocomplete", value: prop' value }

instance Attr Select_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute { key: "autocomplete", value: prop' value }

instance Attr Textarea_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute { key: "autocomplete", value: prop' value }

instance Attr Button_ Autofocus String where
  attr Autofocus value = unsafeAttribute { key: "autofocus", value: prop' value }

instance Attr Input_ Autofocus String where
  attr Autofocus value = unsafeAttribute { key: "autofocus", value: prop' value }

instance Attr Select_ Autofocus String where
  attr Autofocus value = unsafeAttribute { key: "autofocus", value: prop' value }

instance Attr Textarea_ Autofocus String where
  attr Autofocus value = unsafeAttribute { key: "autofocus", value: prop' value }

instance Attr Audio_ Autoplay String where
  attr Autoplay value = unsafeAttribute { key: "autoplay", value: prop' value }

instance Attr Video_ Autoplay String where
  attr Autoplay value = unsafeAttribute { key: "autoplay", value: prop' value }

instance Attr Body_ Background String where
  attr Background value = unsafeAttribute { key: "background", value: prop' value }

instance Attr Table_ Background String where
  attr Background value = unsafeAttribute { key: "background", value: prop' value }

instance Attr Td_ Background String where
  attr Background value = unsafeAttribute { key: "background", value: prop' value }

instance Attr Th_ Background String where
  attr Background value = unsafeAttribute { key: "background", value: prop' value }

instance Attr Body_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Col_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Colgroup_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Table_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Tbody_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Tfoot_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Td_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Th_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Tr_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Img_ Border String where
  attr Border value = unsafeAttribute { key: "border", value: prop' value }

instance Attr Object_ Border String where
  attr Border value = unsafeAttribute { key: "border", value: prop' value }

instance Attr Table_ Border String where
  attr Border value = unsafeAttribute { key: "border", value: prop' value }

instance Attr Audio_ Buffered String where
  attr Buffered value = unsafeAttribute { key: "buffered", value: prop' value }

instance Attr Video_ Buffered String where
  attr Buffered value = unsafeAttribute { key: "buffered", value: prop' value }

instance Attr Input_ Capture String where
  attr Capture value = unsafeAttribute { key: "capture", value: prop' value }

instance Attr A_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Abbr_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Acronym_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Address_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Applet_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Area_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Article_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Aside_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Audio_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr B_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Base_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Basefont_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Bdi_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Bdo_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Big_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Blockquote_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Body_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Br_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Button_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Canvas_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Caption_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Center_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Cite_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Code_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Col_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Colgroup_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Xdata_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Datalist_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Dd_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Del_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Details_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Dfn_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Dialog_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Dir_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Div_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Dl_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Dt_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Em_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Embed_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Fieldset_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Figcaption_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Figure_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Font_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Footer_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Form_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Frame_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Frameset_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr H1_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr H2_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr H3_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr H4_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr H5_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr H6_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Head_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Header_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Hr_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Html_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr I_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Iframe_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Img_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Input_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Ins_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Kbd_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Label_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Legend_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Li_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Link_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Main_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Map_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Mark_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Meta_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Meter_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Nav_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Noframes_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Noscript_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Object_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Ol_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Optgroup_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Option_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Output_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr P_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Param_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Picture_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Pre_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Progress_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Q_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Rp_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Rt_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Ruby_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr S_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Samp_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Script_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Section_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Select_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Small_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Source_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Span_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Strike_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Strong_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Style_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Sub_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Summary_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Sup_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Svg_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Table_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Tbody_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Td_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Template_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Textarea_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Tfoot_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Th_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Thead_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Time_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Title_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Tr_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Track_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Tt_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr U_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Ul_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Var_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Video_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Wbr_ Challenge String where
  attr Challenge value = unsafeAttribute { key: "challenge", value: prop' value }

instance Attr Meta_ Charset String where
  attr Charset value = unsafeAttribute { key: "charset", value: prop' value }

instance Attr Script_ Charset String where
  attr Charset value = unsafeAttribute { key: "charset", value: prop' value }

instance Attr Input_ Checked String where
  attr Checked value = unsafeAttribute { key: "checked", value: prop' value }

instance Attr Blockquote_ Cite String where
  attr Cite value = unsafeAttribute { key: "cite", value: prop' value }

instance Attr Del_ Cite String where
  attr Cite value = unsafeAttribute { key: "cite", value: prop' value }

instance Attr Ins_ Cite String where
  attr Cite value = unsafeAttribute { key: "cite", value: prop' value }

instance Attr Q_ Cite String where
  attr Cite value = unsafeAttribute { key: "cite", value: prop' value }

instance Attr A_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Abbr_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Acronym_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Address_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Applet_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Area_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Article_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Aside_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Audio_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr B_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Base_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Basefont_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Bdi_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Bdo_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Big_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Blockquote_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Body_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Br_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Button_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Canvas_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Caption_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Center_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Cite_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Code_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Col_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Colgroup_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Xdata_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Datalist_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Dd_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Del_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Details_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Dfn_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Dialog_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Dir_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Div_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Dl_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Dt_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Em_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Embed_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Fieldset_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Figcaption_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Figure_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Font_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Footer_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Form_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Frame_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Frameset_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr H1_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr H2_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr H3_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr H4_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr H5_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr H6_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Head_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Header_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Hr_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Html_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr I_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Iframe_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Img_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Input_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Ins_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Kbd_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Label_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Legend_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Li_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Link_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Main_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Map_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Mark_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Meta_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Meter_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Nav_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Noframes_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Noscript_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Object_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Ol_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Optgroup_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Option_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Output_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr P_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Param_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Picture_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Pre_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Progress_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Q_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Rp_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Rt_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Ruby_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr S_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Samp_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Script_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Section_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Select_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Small_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Source_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Span_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Strike_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Strong_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Style_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Sub_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Summary_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Sup_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Svg_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Table_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Tbody_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Td_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Template_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Textarea_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Tfoot_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Th_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Thead_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Time_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Title_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Tr_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Track_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Tt_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr U_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Ul_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Var_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Video_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Wbr_ Class String where
  attr Class value = unsafeAttribute { key: "class", value: prop' value }

instance Attr Applet_ Code String where
  attr Code value = unsafeAttribute { key: "code", value: prop' value }

instance Attr Applet_ Codebase String where
  attr Codebase value = unsafeAttribute { key: "codebase", value: prop' value }

instance Attr Basefont_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Font_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Hr_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Textarea_ Cols String where
  attr Cols value = unsafeAttribute { key: "cols", value: prop' value }

instance Attr Td_ Colspan String where
  attr Colspan value = unsafeAttribute { key: "colspan", value: prop' value }

instance Attr Th_ Colspan String where
  attr Colspan value = unsafeAttribute { key: "colspan", value: prop' value }

instance Attr Meta_ Content String where
  attr Content value = unsafeAttribute { key: "content", value: prop' value }

instance Attr A_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Abbr_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Acronym_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Address_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Applet_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Area_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Article_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Aside_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Audio_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr B_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Base_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Basefont_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Bdi_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Bdo_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Big_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Blockquote_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Body_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Br_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Button_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Canvas_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Caption_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Center_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Cite_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Code_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Col_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Colgroup_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Xdata_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Datalist_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Dd_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Del_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Details_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Dfn_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Dialog_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Dir_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Div_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Dl_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Dt_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Em_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Embed_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Fieldset_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Figcaption_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Figure_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Font_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Footer_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Form_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Frame_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Frameset_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr H1_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr H2_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr H3_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr H4_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr H5_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr H6_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Head_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Header_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Hr_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Html_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr I_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Iframe_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Img_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Input_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Ins_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Kbd_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Label_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Legend_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Li_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Link_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Main_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Map_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Mark_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Meta_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Meter_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Nav_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Noframes_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Noscript_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Object_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Ol_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Optgroup_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Option_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Output_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr P_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Param_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Picture_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Pre_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Progress_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Q_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Rp_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Rt_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Ruby_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr S_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Samp_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Script_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Section_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Select_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Small_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Source_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Span_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Strike_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Strong_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Style_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Sub_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Summary_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Sup_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Svg_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Table_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Tbody_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Td_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Template_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Textarea_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Tfoot_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Th_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Thead_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Time_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Title_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Tr_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Track_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Tt_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr U_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Ul_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Var_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Video_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr Wbr_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute { key: "contenteditable", value: prop' value }

instance Attr A_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Abbr_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Acronym_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Address_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Applet_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Area_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Article_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Aside_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Audio_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr B_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Base_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Basefont_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Bdi_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Bdo_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Big_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Blockquote_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Body_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Br_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Button_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Canvas_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Caption_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Center_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Cite_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Code_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Col_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Colgroup_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Xdata_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Datalist_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Dd_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Del_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Details_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Dfn_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Dialog_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Dir_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Div_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Dl_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Dt_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Em_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Embed_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Fieldset_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Figcaption_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Figure_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Font_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Footer_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Form_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Frame_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Frameset_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr H1_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr H2_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr H3_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr H4_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr H5_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr H6_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Head_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Header_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Hr_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Html_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr I_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Iframe_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Img_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Input_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Ins_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Kbd_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Label_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Legend_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Li_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Link_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Main_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Map_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Mark_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Meta_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Meter_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Nav_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Noframes_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Noscript_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Object_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Ol_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Optgroup_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Option_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Output_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr P_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Param_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Picture_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Pre_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Progress_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Q_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Rp_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Rt_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Ruby_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr S_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Samp_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Script_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Section_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Select_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Small_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Source_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Span_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Strike_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Strong_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Style_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Sub_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Summary_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Sup_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Svg_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Table_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Tbody_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Td_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Template_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Textarea_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Tfoot_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Th_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Thead_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Time_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Title_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Tr_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Track_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Tt_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr U_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Ul_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Var_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Video_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Wbr_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute { key: "contextmenu", value: prop' value }

instance Attr Audio_ Controls String where
  attr Controls value = unsafeAttribute { key: "controls", value: prop' value }

instance Attr Video_ Controls String where
  attr Controls value = unsafeAttribute { key: "controls", value: prop' value }

instance Attr Area_ Coords String where
  attr Coords value = unsafeAttribute { key: "coords", value: prop' value }

instance Attr Audio_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute { key: "crossorigin", value: prop' value }

instance Attr Img_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute { key: "crossorigin", value: prop' value }

instance Attr Link_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute { key: "crossorigin", value: prop' value }

instance Attr Script_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute { key: "crossorigin", value: prop' value }

instance Attr Video_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute { key: "crossorigin", value: prop' value }

instance Attr Iframe_ Csp String where
  attr Csp value = unsafeAttribute { key: "csp", value: prop' value }

instance Attr Object_ Data String where
  attr Data value = unsafeAttribute { key: "data", value: prop' value }

instance Attr Del_ Datetime String where
  attr Datetime value = unsafeAttribute { key: "datetime", value: prop' value }

instance Attr Ins_ Datetime String where
  attr Datetime value = unsafeAttribute { key: "datetime", value: prop' value }

instance Attr Time_ Datetime String where
  attr Datetime value = unsafeAttribute { key: "datetime", value: prop' value }

instance Attr Img_ Decoding String where
  attr Decoding value = unsafeAttribute { key: "decoding", value: prop' value }

instance Attr Track_ Default String where
  attr Default value = unsafeAttribute { key: "default", value: prop' value }

instance Attr Script_ Defer String where
  attr Defer value = unsafeAttribute { key: "defer", value: prop' value }

instance Attr A_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Abbr_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Acronym_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Address_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Applet_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Area_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Article_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Aside_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Audio_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr B_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Base_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Basefont_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Bdi_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Bdo_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Big_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Blockquote_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Body_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Br_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Button_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Canvas_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Caption_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Center_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Cite_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Code_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Col_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Colgroup_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Xdata_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Datalist_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dd_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Del_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Details_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dfn_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dialog_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dir_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Div_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dl_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dt_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Em_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Embed_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Fieldset_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Figcaption_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Figure_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Font_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Footer_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Form_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Frame_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Frameset_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H1_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H2_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H3_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H4_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H5_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H6_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Head_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Header_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Hr_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Html_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr I_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Iframe_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Img_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Input_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Ins_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Kbd_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Label_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Legend_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Li_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Link_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Main_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Map_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Mark_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Meta_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Meter_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Nav_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Noframes_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Noscript_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Object_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Ol_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Optgroup_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Option_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Output_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr P_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Param_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Picture_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Pre_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Progress_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Q_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Rp_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Rt_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Ruby_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr S_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Samp_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Script_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Section_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Select_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Small_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Source_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Span_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Strike_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Strong_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Style_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Sub_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Summary_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Sup_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Svg_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Table_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Tbody_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Td_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Template_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Textarea_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Tfoot_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Th_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Thead_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Time_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Title_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Tr_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Track_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Tt_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr U_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Ul_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Var_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Video_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Wbr_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Input_ Dirname String where
  attr Dirname value = unsafeAttribute { key: "dirname", value: prop' value }

instance Attr Textarea_ Dirname String where
  attr Dirname value = unsafeAttribute { key: "dirname", value: prop' value }

instance Attr Button_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Fieldset_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Input_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Optgroup_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Option_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Select_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Textarea_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr A_ Download String where
  attr Download value = unsafeAttribute { key: "download", value: prop' value }

instance Attr Area_ Download String where
  attr Download value = unsafeAttribute { key: "download", value: prop' value }

instance Attr A_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Abbr_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Acronym_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Address_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Applet_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Area_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Article_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Aside_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Audio_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr B_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Base_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Basefont_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Bdi_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Bdo_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Big_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Blockquote_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Body_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Br_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Button_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Canvas_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Caption_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Center_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Cite_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Code_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Col_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Colgroup_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Xdata_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Datalist_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Dd_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Del_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Details_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Dfn_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Dialog_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Dir_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Div_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Dl_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Dt_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Em_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Embed_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Fieldset_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Figcaption_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Figure_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Font_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Footer_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Form_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Frame_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Frameset_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr H1_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr H2_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr H3_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr H4_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr H5_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr H6_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Head_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Header_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Hr_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Html_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr I_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Iframe_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Img_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Input_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Ins_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Kbd_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Label_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Legend_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Li_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Link_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Main_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Map_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Mark_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Meta_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Meter_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Nav_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Noframes_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Noscript_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Object_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Ol_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Optgroup_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Option_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Output_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr P_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Param_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Picture_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Pre_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Progress_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Q_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Rp_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Rt_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Ruby_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr S_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Samp_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Script_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Section_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Select_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Small_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Source_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Span_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Strike_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Strong_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Style_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Sub_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Summary_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Sup_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Svg_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Table_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Tbody_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Td_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Template_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Textarea_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Tfoot_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Th_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Thead_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Time_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Title_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Tr_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Track_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Tt_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr U_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Ul_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Var_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Video_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Wbr_ Draggable String where
  attr Draggable value = unsafeAttribute { key: "draggable", value: prop' value }

instance Attr Form_ Enctype String where
  attr Enctype value = unsafeAttribute { key: "enctype", value: prop' value }

instance Attr Textarea_ Enterkeyhint String where
  attr Enterkeyhint value = unsafeAttribute { key: "enterkeyhint", value: prop' value }

instance Attr Label_ For String where
  attr For value = unsafeAttribute { key: "for", value: prop' value }

instance Attr Output_ For String where
  attr For value = unsafeAttribute { key: "for", value: prop' value }

instance Attr Button_ Form String where
  attr Form value = unsafeAttribute { key: "form", value: prop' value }

instance Attr Fieldset_ Form String where
  attr Form value = unsafeAttribute { key: "form", value: prop' value }

instance Attr Input_ Form String where
  attr Form value = unsafeAttribute { key: "form", value: prop' value }

instance Attr Label_ Form String where
  attr Form value = unsafeAttribute { key: "form", value: prop' value }

instance Attr Meter_ Form String where
  attr Form value = unsafeAttribute { key: "form", value: prop' value }

instance Attr Object_ Form String where
  attr Form value = unsafeAttribute { key: "form", value: prop' value }

instance Attr Output_ Form String where
  attr Form value = unsafeAttribute { key: "form", value: prop' value }

instance Attr Progress_ Form String where
  attr Form value = unsafeAttribute { key: "form", value: prop' value }

instance Attr Select_ Form String where
  attr Form value = unsafeAttribute { key: "form", value: prop' value }

instance Attr Textarea_ Form String where
  attr Form value = unsafeAttribute { key: "form", value: prop' value }

instance Attr Input_ Formaction String where
  attr Formaction value = unsafeAttribute { key: "formaction", value: prop' value }

instance Attr Button_ Formaction String where
  attr Formaction value = unsafeAttribute { key: "formaction", value: prop' value }

instance Attr Button_ Formenctype String where
  attr Formenctype value = unsafeAttribute { key: "formenctype", value: prop' value }

instance Attr Input_ Formenctype String where
  attr Formenctype value = unsafeAttribute { key: "formenctype", value: prop' value }

instance Attr Button_ Formmethod String where
  attr Formmethod value = unsafeAttribute { key: "formmethod", value: prop' value }

instance Attr Input_ Formmethod String where
  attr Formmethod value = unsafeAttribute { key: "formmethod", value: prop' value }

instance Attr Button_ Formnovalidate String where
  attr Formnovalidate value = unsafeAttribute { key: "formnovalidate", value: prop' value }

instance Attr Input_ Formnovalidate String where
  attr Formnovalidate value = unsafeAttribute { key: "formnovalidate", value: prop' value }

instance Attr Button_ Formtarget String where
  attr Formtarget value = unsafeAttribute { key: "formtarget", value: prop' value }

instance Attr Input_ Formtarget String where
  attr Formtarget value = unsafeAttribute { key: "formtarget", value: prop' value }

instance Attr Td_ Headers String where
  attr Headers value = unsafeAttribute { key: "headers", value: prop' value }

instance Attr Th_ Headers String where
  attr Headers value = unsafeAttribute { key: "headers", value: prop' value }

instance Attr Canvas_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Embed_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Iframe_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Img_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Input_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Object_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Video_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr A_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Abbr_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Acronym_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Address_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Applet_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Area_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Article_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Aside_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Audio_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr B_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Base_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Basefont_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Bdi_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Bdo_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Big_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Blockquote_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Body_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Br_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Button_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Canvas_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Caption_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Center_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Cite_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Code_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Col_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Colgroup_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Xdata_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Datalist_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Dd_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Del_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Details_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Dfn_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Dialog_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Dir_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Div_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Dl_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Dt_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Em_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Embed_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Fieldset_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Figcaption_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Figure_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Font_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Footer_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Form_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Frame_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Frameset_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr H1_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr H2_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr H3_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr H4_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr H5_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr H6_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Head_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Header_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Hr_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Html_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr I_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Iframe_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Img_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Input_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Ins_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Kbd_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Label_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Legend_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Li_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Link_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Main_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Map_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Mark_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Meta_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Meter_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Nav_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Noframes_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Noscript_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Object_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Ol_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Optgroup_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Option_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Output_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr P_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Param_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Picture_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Pre_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Progress_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Q_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Rp_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Rt_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Ruby_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr S_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Samp_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Script_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Section_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Select_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Small_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Source_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Span_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Strike_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Strong_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Style_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Sub_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Summary_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Sup_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Svg_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Table_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Tbody_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Td_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Template_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Textarea_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Tfoot_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Th_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Thead_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Time_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Title_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Tr_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Track_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Tt_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr U_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Ul_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Var_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Video_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Wbr_ Hidden String where
  attr Hidden value = unsafeAttribute { key: "hidden", value: prop' value }

instance Attr Meter_ High String where
  attr High value = unsafeAttribute { key: "high", value: prop' value }

instance Attr A_ Href String where
  attr Href value = unsafeAttribute { key: "href", value: prop' value }

instance Attr Area_ Href String where
  attr Href value = unsafeAttribute { key: "href", value: prop' value }

instance Attr Base_ Href String where
  attr Href value = unsafeAttribute { key: "href", value: prop' value }

instance Attr Link_ Href String where
  attr Href value = unsafeAttribute { key: "href", value: prop' value }

instance Attr A_ Hreflang String where
  attr Hreflang value = unsafeAttribute { key: "hreflang", value: prop' value }

instance Attr Area_ Hreflang String where
  attr Hreflang value = unsafeAttribute { key: "hreflang", value: prop' value }

instance Attr Link_ Hreflang String where
  attr Hreflang value = unsafeAttribute { key: "hreflang", value: prop' value }

instance Attr Meta_ HttpEquiv String where
  attr HttpEquiv value = unsafeAttribute { key: "http-equiv", value: prop' value }

instance Attr A_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Abbr_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Acronym_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Address_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Applet_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Area_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Article_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Aside_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Audio_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr B_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Base_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Basefont_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Bdi_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Bdo_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Big_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Blockquote_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Body_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Br_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Button_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Canvas_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Caption_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Center_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Cite_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Code_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Col_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Colgroup_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Xdata_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Datalist_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Dd_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Del_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Details_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Dfn_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Dialog_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Dir_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Div_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Dl_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Dt_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Em_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Embed_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Fieldset_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Figcaption_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Figure_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Font_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Footer_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Form_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Frame_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Frameset_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr H1_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr H2_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr H3_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr H4_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr H5_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr H6_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Head_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Header_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Hr_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Html_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr I_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Iframe_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Img_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Input_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Ins_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Kbd_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Label_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Legend_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Li_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Link_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Main_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Map_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Mark_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Meta_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Meter_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Nav_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Noframes_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Noscript_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Object_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Ol_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Optgroup_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Option_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Output_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr P_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Param_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Picture_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Pre_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Progress_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Q_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Rp_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Rt_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Ruby_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr S_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Samp_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Script_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Section_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Select_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Small_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Source_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Span_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Strike_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Strong_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Style_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Sub_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Summary_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Sup_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Svg_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Table_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Tbody_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Td_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Template_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Textarea_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Tfoot_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Th_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Thead_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Time_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Title_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Tr_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Track_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Tt_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr U_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Ul_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Var_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Video_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr Wbr_ Icon String where
  attr Icon value = unsafeAttribute { key: "icon", value: prop' value }

instance Attr A_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Abbr_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Acronym_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Address_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Applet_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Area_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Article_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Aside_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Audio_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr B_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Base_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Basefont_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Bdi_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Bdo_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Big_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Blockquote_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Body_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Br_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Button_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Canvas_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Caption_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Center_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Cite_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Code_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Col_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Colgroup_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Xdata_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Datalist_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Dd_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Del_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Details_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Dfn_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Dialog_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Dir_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Div_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Dl_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Dt_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Em_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Embed_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Fieldset_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Figcaption_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Figure_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Font_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Footer_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Form_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Frame_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Frameset_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr H1_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr H2_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr H3_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr H4_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr H5_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr H6_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Head_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Header_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Hr_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Html_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr I_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Iframe_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Img_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Input_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Ins_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Kbd_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Label_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Legend_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Li_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Link_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Main_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Map_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Mark_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Meta_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Meter_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Nav_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Noframes_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Noscript_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Object_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Ol_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Optgroup_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Option_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Output_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr P_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Param_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Picture_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Pre_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Progress_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Q_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Rp_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Rt_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Ruby_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr S_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Samp_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Script_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Section_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Select_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Small_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Source_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Span_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Strike_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Strong_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Style_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Sub_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Summary_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Sup_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Svg_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Table_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Tbody_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Td_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Template_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Textarea_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Tfoot_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Th_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Thead_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Time_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Title_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Tr_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Track_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Tt_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr U_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Ul_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Var_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Video_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Wbr_ Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop' value }

instance Attr Iframe_ Importance String where
  attr Importance value = unsafeAttribute { key: "importance", value: prop' value }

instance Attr Img_ Importance String where
  attr Importance value = unsafeAttribute { key: "importance", value: prop' value }

instance Attr Link_ Importance String where
  attr Importance value = unsafeAttribute { key: "importance", value: prop' value }

instance Attr Script_ Importance String where
  attr Importance value = unsafeAttribute { key: "importance", value: prop' value }

instance Attr Link_ Integrity String where
  attr Integrity value = unsafeAttribute { key: "integrity", value: prop' value }

instance Attr Script_ Integrity String where
  attr Integrity value = unsafeAttribute { key: "integrity", value: prop' value }

instance Attr Img_ Intrinsicsize String where
  attr Intrinsicsize value = unsafeAttribute { key: "intrinsicsize", value: prop' value }

instance Attr Textarea_ Inputmode String where
  attr Inputmode value = unsafeAttribute { key: "inputmode", value: prop' value }

instance Attr Img_ Ismap String where
  attr Ismap value = unsafeAttribute { key: "ismap", value: prop' value }

instance Attr A_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Abbr_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Acronym_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Address_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Applet_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Area_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Article_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Aside_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Audio_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr B_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Base_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Basefont_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Bdi_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Bdo_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Big_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Blockquote_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Body_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Br_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Button_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Canvas_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Caption_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Center_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Cite_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Code_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Col_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Colgroup_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Xdata_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Datalist_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dd_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Del_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Details_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dfn_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dialog_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dir_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Div_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dl_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dt_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Em_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Embed_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Fieldset_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Figcaption_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Figure_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Font_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Footer_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Form_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Frame_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Frameset_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H1_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H2_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H3_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H4_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H5_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H6_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Head_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Header_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Hr_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Html_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr I_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Iframe_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Img_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Input_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Ins_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Kbd_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Label_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Legend_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Li_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Link_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Main_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Map_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Mark_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Meta_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Meter_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Nav_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Noframes_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Noscript_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Object_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Ol_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Optgroup_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Option_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Output_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr P_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Param_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Picture_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Pre_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Progress_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Q_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Rp_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Rt_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Ruby_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr S_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Samp_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Script_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Section_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Select_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Small_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Source_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Span_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Strike_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Strong_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Style_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Sub_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Summary_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Sup_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Svg_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Table_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Tbody_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Td_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Template_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Textarea_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Tfoot_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Th_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Thead_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Time_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Title_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Tr_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Track_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Tt_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr U_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Ul_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Var_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Video_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Wbr_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr A_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Abbr_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Acronym_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Address_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Applet_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Area_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Article_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Aside_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Audio_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr B_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Base_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Basefont_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Bdi_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Bdo_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Big_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Blockquote_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Body_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Br_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Button_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Canvas_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Caption_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Center_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Cite_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Code_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Col_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Colgroup_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Xdata_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Datalist_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Dd_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Del_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Details_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Dfn_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Dialog_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Dir_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Div_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Dl_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Dt_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Em_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Embed_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Fieldset_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Figcaption_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Figure_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Font_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Footer_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Form_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Frame_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Frameset_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr H1_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr H2_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr H3_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr H4_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr H5_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr H6_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Head_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Header_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Hr_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Html_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr I_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Iframe_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Img_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Input_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Ins_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Kbd_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Label_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Legend_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Li_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Link_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Main_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Map_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Mark_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Meta_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Meter_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Nav_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Noframes_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Noscript_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Object_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Ol_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Optgroup_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Option_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Output_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr P_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Param_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Picture_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Pre_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Progress_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Q_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Rp_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Rt_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Ruby_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr S_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Samp_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Script_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Section_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Select_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Small_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Source_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Span_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Strike_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Strong_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Style_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Sub_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Summary_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Sup_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Svg_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Table_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Tbody_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Td_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Template_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Textarea_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Tfoot_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Th_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Thead_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Time_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Title_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Tr_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Track_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Tt_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr U_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Ul_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Var_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Video_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Wbr_ Keytype String where
  attr Keytype value = unsafeAttribute { key: "keytype", value: prop' value }

instance Attr Track_ Kind String where
  attr Kind value = unsafeAttribute { key: "kind", value: prop' value }

instance Attr Optgroup_ Label String where
  attr Label value = unsafeAttribute { key: "label", value: prop' value }

instance Attr Option_ Label String where
  attr Label value = unsafeAttribute { key: "label", value: prop' value }

instance Attr Track_ Label String where
  attr Label value = unsafeAttribute { key: "label", value: prop' value }

instance Attr A_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Abbr_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Acronym_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Address_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Applet_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Area_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Article_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Aside_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Audio_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr B_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Base_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Basefont_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Bdi_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Bdo_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Big_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Blockquote_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Body_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Br_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Button_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Canvas_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Caption_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Center_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Cite_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Code_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Col_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Colgroup_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Xdata_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Datalist_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Dd_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Del_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Details_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Dfn_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Dialog_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Dir_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Div_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Dl_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Dt_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Em_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Embed_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Fieldset_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Figcaption_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Figure_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Font_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Footer_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Form_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Frame_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Frameset_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr H1_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr H2_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr H3_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr H4_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr H5_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr H6_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Head_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Header_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Hr_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Html_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr I_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Iframe_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Img_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Input_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Ins_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Kbd_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Label_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Legend_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Li_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Link_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Main_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Map_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Mark_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Meta_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Meter_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Nav_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Noframes_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Noscript_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Object_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Ol_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Optgroup_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Option_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Output_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr P_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Param_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Picture_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Pre_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Progress_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Q_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Rp_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Rt_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Ruby_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr S_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Samp_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Script_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Section_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Select_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Small_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Source_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Span_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Strike_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Strong_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Style_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Sub_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Summary_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Sup_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Svg_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Table_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Tbody_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Td_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Template_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Textarea_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Tfoot_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Th_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Thead_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Time_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Title_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Tr_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Track_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Tt_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr U_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Ul_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Var_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Video_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Wbr_ Lang String where
  attr Lang value = unsafeAttribute { key: "lang", value: prop' value }

instance Attr Script_ Language String where
  attr Language value = unsafeAttribute { key: "language", value: prop' value }

instance Attr Img_ Loading String where
  attr Loading value = unsafeAttribute { key: "loading", value: prop' value }

instance Attr Iframe_ Loading String where
  attr Loading value = unsafeAttribute { key: "loading", value: prop' value }

instance Attr Input_ List String where
  attr List value = unsafeAttribute { key: "list", value: prop' value }

instance Attr Audio_ Loop String where
  attr Loop value = unsafeAttribute { key: "loop", value: prop' value }

instance Attr Video_ Loop String where
  attr Loop value = unsafeAttribute { key: "loop", value: prop' value }

instance Attr Meter_ Low String where
  attr Low value = unsafeAttribute { key: "low", value: prop' value }

instance Attr Html_ Manifest String where
  attr Manifest value = unsafeAttribute { key: "manifest", value: prop' value }

instance Attr Input_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr Meter_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr Progress_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr Input_ Maxlength String where
  attr Maxlength value = unsafeAttribute { key: "maxlength", value: prop' value }

instance Attr Textarea_ Maxlength String where
  attr Maxlength value = unsafeAttribute { key: "maxlength", value: prop' value }

instance Attr Input_ Minlength String where
  attr Minlength value = unsafeAttribute { key: "minlength", value: prop' value }

instance Attr Textarea_ Minlength String where
  attr Minlength value = unsafeAttribute { key: "minlength", value: prop' value }

instance Attr A_ Media String where
  attr Media value = unsafeAttribute { key: "media", value: prop' value }

instance Attr Area_ Media String where
  attr Media value = unsafeAttribute { key: "media", value: prop' value }

instance Attr Link_ Media String where
  attr Media value = unsafeAttribute { key: "media", value: prop' value }

instance Attr Source_ Media String where
  attr Media value = unsafeAttribute { key: "media", value: prop' value }

instance Attr Style_ Media String where
  attr Media value = unsafeAttribute { key: "media", value: prop' value }

instance Attr Form_ Method String where
  attr Method value = unsafeAttribute { key: "method", value: prop' value }

instance Attr Input_ Min String where
  attr Min value = unsafeAttribute { key: "min", value: prop' value }

instance Attr Meter_ Min String where
  attr Min value = unsafeAttribute { key: "min", value: prop' value }

instance Attr Input_ Multiple String where
  attr Multiple value = unsafeAttribute { key: "multiple", value: prop' value }

instance Attr Select_ Multiple String where
  attr Multiple value = unsafeAttribute { key: "multiple", value: prop' value }

instance Attr Audio_ Muted String where
  attr Muted value = unsafeAttribute { key: "muted", value: prop' value }

instance Attr Video_ Muted String where
  attr Muted value = unsafeAttribute { key: "muted", value: prop' value }

instance Attr Button_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Form_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Fieldset_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Iframe_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Input_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Object_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Output_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Select_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Textarea_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Map_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Meta_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Param_ Name String where
  attr Name value = unsafeAttribute { key: "name", value: prop' value }

instance Attr Form_ Novalidate String where
  attr Novalidate value = unsafeAttribute { key: "novalidate", value: prop' value }

instance Attr Details_ Open String where
  attr Open value = unsafeAttribute { key: "open", value: prop' value }

instance Attr Dialog_ Open String where
  attr Open value = unsafeAttribute { key: "open", value: prop' value }

instance Attr Meter_ Optimum String where
  attr Optimum value = unsafeAttribute { key: "optimum", value: prop' value }

instance Attr Input_ Pattern String where
  attr Pattern value = unsafeAttribute { key: "pattern", value: prop' value }

instance Attr A_ Ping String where
  attr Ping value = unsafeAttribute { key: "ping", value: prop' value }

instance Attr Area_ Ping String where
  attr Ping value = unsafeAttribute { key: "ping", value: prop' value }

instance Attr Input_ Placeholder String where
  attr Placeholder value = unsafeAttribute { key: "placeholder", value: prop' value }

instance Attr Textarea_ Placeholder String where
  attr Placeholder value = unsafeAttribute { key: "placeholder", value: prop' value }

instance Attr Video_ Poster String where
  attr Poster value = unsafeAttribute { key: "poster", value: prop' value }

instance Attr Audio_ Preload String where
  attr Preload value = unsafeAttribute { key: "preload", value: prop' value }

instance Attr Video_ Preload String where
  attr Preload value = unsafeAttribute { key: "preload", value: prop' value }

instance Attr A_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Abbr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Acronym_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Address_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Applet_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Area_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Article_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Aside_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Audio_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr B_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Base_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Basefont_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Bdi_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Bdo_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Big_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Blockquote_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Body_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Br_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Button_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Canvas_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Caption_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Center_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Cite_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Code_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Col_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Colgroup_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Xdata_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Datalist_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Dd_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Del_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Details_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Dfn_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Dialog_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Dir_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Div_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Dl_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Dt_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Em_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Embed_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Fieldset_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Figcaption_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Figure_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Font_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Footer_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Form_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Frame_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Frameset_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr H1_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr H2_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr H3_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr H4_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr H5_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr H6_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Head_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Header_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Hr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Html_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr I_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Iframe_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Img_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Input_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Ins_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Kbd_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Label_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Legend_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Li_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Link_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Main_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Map_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Mark_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Meta_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Meter_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Nav_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Noframes_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Noscript_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Object_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Ol_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Optgroup_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Option_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Output_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr P_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Param_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Picture_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Pre_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Progress_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Q_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Rp_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Rt_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Ruby_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr S_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Samp_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Script_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Section_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Select_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Small_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Source_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Span_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Strike_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Strong_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Style_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Sub_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Summary_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Sup_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Svg_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Table_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Tbody_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Td_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Template_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Textarea_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Tfoot_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Th_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Thead_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Time_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Title_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Tr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Track_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Tt_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr U_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Ul_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Var_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Video_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Wbr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute { key: "radiogroup", value: prop' value }

instance Attr Input_ Readonly String where
  attr Readonly value = unsafeAttribute { key: "readonly", value: prop' value }

instance Attr Textarea_ Readonly String where
  attr Readonly value = unsafeAttribute { key: "readonly", value: prop' value }

instance Attr A_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute { key: "referrerpolicy", value: prop' value }

instance Attr Area_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute { key: "referrerpolicy", value: prop' value }

instance Attr Iframe_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute { key: "referrerpolicy", value: prop' value }

instance Attr Img_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute { key: "referrerpolicy", value: prop' value }

instance Attr Link_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute { key: "referrerpolicy", value: prop' value }

instance Attr Script_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute { key: "referrerpolicy", value: prop' value }

instance Attr A_ Rel String where
  attr Rel value = unsafeAttribute { key: "rel", value: prop' value }

instance Attr Area_ Rel String where
  attr Rel value = unsafeAttribute { key: "rel", value: prop' value }

instance Attr Link_ Rel String where
  attr Rel value = unsafeAttribute { key: "rel", value: prop' value }

instance Attr Input_ Required String where
  attr Required value = unsafeAttribute { key: "required", value: prop' value }

instance Attr Select_ Required String where
  attr Required value = unsafeAttribute { key: "required", value: prop' value }

instance Attr Textarea_ Required String where
  attr Required value = unsafeAttribute { key: "required", value: prop' value }

instance Attr Ol_ Reversed String where
  attr Reversed value = unsafeAttribute { key: "reversed", value: prop' value }

instance Attr Textarea_ Rows String where
  attr Rows value = unsafeAttribute { key: "rows", value: prop' value }

instance Attr Td_ Rowspan String where
  attr Rowspan value = unsafeAttribute { key: "rowspan", value: prop' value }

instance Attr Th_ Rowspan String where
  attr Rowspan value = unsafeAttribute { key: "rowspan", value: prop' value }

instance Attr Iframe_ Sandbox String where
  attr Sandbox value = unsafeAttribute { key: "sandbox", value: prop' value }

instance Attr Th_ Scope String where
  attr Scope value = unsafeAttribute { key: "scope", value: prop' value }

instance Attr Style_ Scoped String where
  attr Scoped value = unsafeAttribute { key: "scoped", value: prop' value }

instance Attr Option_ Selected String where
  attr Selected value = unsafeAttribute { key: "selected", value: prop' value }

instance Attr A_ Shape String where
  attr Shape value = unsafeAttribute { key: "shape", value: prop' value }

instance Attr Area_ Shape String where
  attr Shape value = unsafeAttribute { key: "shape", value: prop' value }

instance Attr Input_ Size String where
  attr Size value = unsafeAttribute { key: "size", value: prop' value }

instance Attr Select_ Size String where
  attr Size value = unsafeAttribute { key: "size", value: prop' value }

instance Attr Link_ Sizes String where
  attr Sizes value = unsafeAttribute { key: "sizes", value: prop' value }

instance Attr Img_ Sizes String where
  attr Sizes value = unsafeAttribute { key: "sizes", value: prop' value }

instance Attr Source_ Sizes String where
  attr Sizes value = unsafeAttribute { key: "sizes", value: prop' value }

instance Attr A_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Abbr_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Acronym_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Address_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Applet_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Area_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Article_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Aside_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Audio_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr B_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Base_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Basefont_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Bdi_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Bdo_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Big_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Blockquote_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Body_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Br_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Button_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Canvas_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Caption_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Center_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Cite_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Code_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Col_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Colgroup_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Xdata_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Datalist_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Dd_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Del_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Details_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Dfn_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Dialog_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Dir_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Div_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Dl_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Dt_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Em_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Embed_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Fieldset_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Figcaption_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Figure_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Font_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Footer_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Form_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Frame_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Frameset_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr H1_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr H2_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr H3_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr H4_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr H5_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr H6_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Head_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Header_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Hr_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Html_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr I_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Iframe_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Img_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Input_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Ins_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Kbd_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Label_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Legend_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Li_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Link_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Main_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Map_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Mark_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Meta_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Meter_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Nav_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Noframes_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Noscript_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Object_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Ol_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Optgroup_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Option_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Output_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr P_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Param_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Picture_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Pre_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Progress_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Q_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Rp_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Rt_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Ruby_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr S_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Samp_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Script_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Section_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Select_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Small_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Source_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Span_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Strike_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Strong_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Style_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Sub_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Summary_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Sup_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Svg_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Table_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Tbody_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Td_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Template_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Textarea_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Tfoot_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Th_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Thead_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Time_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Title_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Tr_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Track_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Tt_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr U_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Ul_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Var_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Video_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Wbr_ Slot String where
  attr Slot value = unsafeAttribute { key: "slot", value: prop' value }

instance Attr Col_ Span String where
  attr Span value = unsafeAttribute { key: "span", value: prop' value }

instance Attr Colgroup_ Span String where
  attr Span value = unsafeAttribute { key: "span", value: prop' value }

instance Attr A_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Abbr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Acronym_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Address_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Applet_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Area_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Article_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Aside_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Audio_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr B_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Base_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Basefont_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Bdi_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Bdo_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Big_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Blockquote_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Body_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Br_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Button_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Canvas_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Caption_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Center_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Cite_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Code_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Col_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Colgroup_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Xdata_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Datalist_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Dd_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Del_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Details_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Dfn_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Dialog_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Dir_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Div_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Dl_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Dt_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Em_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Embed_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Fieldset_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Figcaption_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Figure_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Font_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Footer_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Form_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Frame_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Frameset_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr H1_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr H2_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr H3_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr H4_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr H5_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr H6_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Head_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Header_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Hr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Html_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr I_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Iframe_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Img_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Input_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Ins_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Kbd_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Label_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Legend_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Li_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Link_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Main_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Map_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Mark_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Meta_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Meter_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Nav_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Noframes_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Noscript_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Object_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Ol_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Optgroup_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Option_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Output_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr P_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Param_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Picture_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Pre_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Progress_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Q_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Rp_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Rt_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Ruby_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr S_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Samp_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Script_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Section_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Select_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Small_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Source_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Span_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Strike_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Strong_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Style_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Sub_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Summary_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Sup_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Svg_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Table_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Tbody_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Td_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Template_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Textarea_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Tfoot_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Th_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Thead_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Time_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Title_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Tr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Track_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Tt_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr U_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Ul_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Var_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Video_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Wbr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute { key: "spellcheck", value: prop' value }

instance Attr Audio_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Embed_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Iframe_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Img_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Input_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Script_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Source_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Track_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Video_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Iframe_ Srcdoc String where
  attr Srcdoc value = unsafeAttribute { key: "srcdoc", value: prop' value }

instance Attr Track_ Srclang String where
  attr Srclang value = unsafeAttribute { key: "srclang", value: prop' value }

instance Attr Img_ Srcset String where
  attr Srcset value = unsafeAttribute { key: "srcset", value: prop' value }

instance Attr Source_ Srcset String where
  attr Srcset value = unsafeAttribute { key: "srcset", value: prop' value }

instance Attr Ol_ Start String where
  attr Start value = unsafeAttribute { key: "start", value: prop' value }

instance Attr Input_ Step String where
  attr Step value = unsafeAttribute { key: "step", value: prop' value }

instance Attr A_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Abbr_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Acronym_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Address_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Applet_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Area_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Article_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Aside_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Audio_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr B_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Base_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Basefont_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Bdi_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Bdo_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Big_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Blockquote_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Body_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Br_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Button_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Canvas_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Caption_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Center_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Cite_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Code_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Col_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Colgroup_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Xdata_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Datalist_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dd_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Del_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Details_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dfn_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dialog_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dir_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Div_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dl_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dt_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Em_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Embed_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Fieldset_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Figcaption_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Figure_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Font_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Footer_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Form_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Frame_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Frameset_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H1_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H2_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H3_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H4_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H5_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H6_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Head_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Header_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Hr_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Html_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr I_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Iframe_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Img_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Input_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Ins_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Kbd_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Label_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Legend_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Li_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Link_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Main_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Map_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Mark_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Meta_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Meter_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Nav_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Noframes_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Noscript_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Object_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Ol_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Optgroup_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Option_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Output_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr P_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Param_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Picture_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Pre_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Progress_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Q_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Rp_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Rt_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Ruby_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr S_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Samp_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Script_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Section_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Select_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Small_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Source_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Span_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Strike_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Strong_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Style_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Sub_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Summary_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Sup_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Svg_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Table_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Tbody_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Td_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Template_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Textarea_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Tfoot_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Th_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Thead_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Time_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Title_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Tr_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Track_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Tt_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr U_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Ul_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Var_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Video_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Wbr_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Table_ Summary String where
  attr Summary value = unsafeAttribute { key: "summary", value: prop' value }

instance Attr A_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Abbr_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Acronym_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Address_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Applet_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Area_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Article_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Aside_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Audio_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr B_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Base_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Basefont_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Bdi_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Bdo_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Big_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Blockquote_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Body_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Br_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Button_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Canvas_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Caption_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Center_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Cite_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Code_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Col_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Colgroup_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Xdata_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Datalist_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Dd_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Del_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Details_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Dfn_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Dialog_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Dir_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Div_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Dl_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Dt_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Em_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Embed_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Fieldset_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Figcaption_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Figure_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Font_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Footer_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Form_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Frame_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Frameset_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr H1_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr H2_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr H3_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr H4_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr H5_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr H6_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Head_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Header_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Hr_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Html_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr I_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Iframe_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Img_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Input_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Ins_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Kbd_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Label_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Legend_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Li_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Link_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Main_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Map_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Mark_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Meta_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Meter_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Nav_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Noframes_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Noscript_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Object_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Ol_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Optgroup_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Option_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Output_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr P_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Param_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Picture_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Pre_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Progress_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Q_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Rp_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Rt_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Ruby_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr S_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Samp_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Script_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Section_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Select_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Small_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Source_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Span_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Strike_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Strong_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Style_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Sub_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Summary_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Sup_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Svg_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Table_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Tbody_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Td_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Template_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Textarea_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Tfoot_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Th_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Thead_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Time_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Title_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Tr_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Track_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Tt_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr U_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Ul_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Var_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Video_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr Wbr_ Tabindex String where
  attr Tabindex value = unsafeAttribute { key: "tabindex", value: prop' value }

instance Attr A_ Target String where
  attr Target value = unsafeAttribute { key: "target", value: prop' value }

instance Attr Area_ Target String where
  attr Target value = unsafeAttribute { key: "target", value: prop' value }

instance Attr Base_ Target String where
  attr Target value = unsafeAttribute { key: "target", value: prop' value }

instance Attr Form_ Target String where
  attr Target value = unsafeAttribute { key: "target", value: prop' value }

instance Attr A_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Abbr_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Acronym_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Address_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Applet_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Area_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Article_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Aside_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Audio_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr B_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Base_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Basefont_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Bdi_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Bdo_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Big_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Blockquote_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Body_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Br_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Button_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Canvas_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Caption_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Center_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Cite_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Code_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Col_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Colgroup_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Xdata_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Datalist_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dd_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Del_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Details_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dfn_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dialog_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dir_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Div_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dl_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dt_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Em_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Embed_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Fieldset_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Figcaption_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Figure_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Font_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Footer_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Form_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Frame_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Frameset_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H1_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H2_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H3_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H4_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H5_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H6_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Head_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Header_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Hr_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Html_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr I_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Iframe_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Img_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Input_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Ins_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Kbd_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Label_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Legend_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Li_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Link_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Main_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Map_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Mark_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Meta_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Meter_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Nav_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Noframes_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Noscript_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Object_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Ol_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Optgroup_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Option_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Output_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr P_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Param_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Picture_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Pre_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Progress_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Q_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Rp_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Rt_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Ruby_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr S_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Samp_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Script_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Section_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Select_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Small_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Source_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Span_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Strike_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Strong_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Style_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Sub_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Summary_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Sup_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Svg_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Table_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Tbody_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Td_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Template_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Textarea_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Tfoot_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Th_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Thead_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Time_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Title_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Tr_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Track_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Tt_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr U_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Ul_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Var_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Video_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Wbr_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr A_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Abbr_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Acronym_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Address_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Applet_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Area_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Article_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Aside_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Audio_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr B_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Base_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Basefont_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Bdi_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Bdo_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Big_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Blockquote_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Body_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Br_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Button_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Canvas_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Caption_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Center_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Cite_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Code_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Col_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Colgroup_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Xdata_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Datalist_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Dd_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Del_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Details_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Dfn_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Dialog_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Dir_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Div_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Dl_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Dt_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Em_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Embed_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Fieldset_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Figcaption_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Figure_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Font_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Footer_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Form_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Frame_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Frameset_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr H1_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr H2_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr H3_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr H4_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr H5_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr H6_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Head_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Header_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Hr_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Html_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr I_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Iframe_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Img_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Input_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Ins_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Kbd_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Label_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Legend_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Li_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Link_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Main_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Map_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Mark_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Meta_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Meter_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Nav_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Noframes_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Noscript_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Object_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Ol_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Optgroup_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Option_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Output_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr P_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Param_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Picture_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Pre_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Progress_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Q_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Rp_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Rt_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Ruby_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr S_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Samp_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Script_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Section_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Select_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Small_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Source_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Span_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Strike_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Strong_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Style_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Sub_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Summary_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Sup_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Svg_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Table_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Tbody_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Td_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Template_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Textarea_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Tfoot_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Th_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Thead_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Time_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Title_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Tr_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Track_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Tt_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr U_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Ul_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Var_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Video_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Wbr_ Translate String where
  attr Translate value = unsafeAttribute { key: "translate", value: prop' value }

instance Attr Img_ Usemap String where
  attr Usemap value = unsafeAttribute { key: "usemap", value: prop' value }

instance Attr Input_ Usemap String where
  attr Usemap value = unsafeAttribute { key: "usemap", value: prop' value }

instance Attr Object_ Usemap String where
  attr Usemap value = unsafeAttribute { key: "usemap", value: prop' value }

instance Attr Button_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Input_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Li_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Meter_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Option_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Progress_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Param_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Canvas_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Embed_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Iframe_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Img_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Input_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Object_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Video_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Button_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Input_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Embed_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Object_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Script_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Source_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Style_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Link_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr anything OnAbort Cb where
  attr OnAbort value = unsafeAttribute { key: "abort", value: cb' value }
instance Attr anything OnAnimationcancel  Cb where
  attr OnAnimationcancel  value = unsafeAttribute { key: "animationcancel ", value: cb' value }
instance Attr anything OnAnimationend  Cb where
  attr OnAnimationend  value = unsafeAttribute { key: "animationend ", value: cb' value }
instance Attr anything OnAnimationiteration  Cb where
  attr OnAnimationiteration  value = unsafeAttribute { key: "animationiteration ", value: cb' value }
instance Attr anything OnAnimationstart  Cb where
  attr OnAnimationstart  value = unsafeAttribute { key: "animationstart ", value: cb' value }
instance Attr anything OnAuxclick  Cb where
  attr OnAuxclick  value = unsafeAttribute { key: "auxclick ", value: cb' value }
instance Attr anything OnBlur Cb where
  attr OnBlur value = unsafeAttribute { key: "blur", value: cb' value }
instance Attr anything OnError Cb where
  attr OnError value = unsafeAttribute { key: "error", value: cb' value }
instance Attr anything OnFocus Cb where
  attr OnFocus value = unsafeAttribute { key: "focus", value: cb' value }
instance Attr anything OnCancel Cb where
  attr OnCancel value = unsafeAttribute { key: "cancel", value: cb' value }
instance Attr anything OnCanplay Cb where
  attr OnCanplay value = unsafeAttribute { key: "canplay", value: cb' value }
instance Attr anything OnCanplaythrough Cb where
  attr OnCanplaythrough value = unsafeAttribute { key: "canplaythrough", value: cb' value }
instance Attr anything OnChange Cb where
  attr OnChange value = unsafeAttribute { key: "change", value: cb' value }
instance Attr anything OnClick Cb where
  attr OnClick value = unsafeAttribute { key: "click", value: cb' value }
instance Attr anything OnClose Cb where
  attr OnClose value = unsafeAttribute { key: "close", value: cb' value }
instance Attr anything OnContextmenu Cb where
  attr OnContextmenu value = unsafeAttribute { key: "contextmenu", value: cb' value }
instance Attr anything OnDblclick Cb where
  attr OnDblclick value = unsafeAttribute { key: "dblclick", value: cb' value }
instance Attr anything OnDrag Cb where
  attr OnDrag value = unsafeAttribute { key: "drag", value: cb' value }
instance Attr anything OnDragend Cb where
  attr OnDragend value = unsafeAttribute { key: "dragend", value: cb' value }
instance Attr anything OnDragenter Cb where
  attr OnDragenter value = unsafeAttribute { key: "dragenter", value: cb' value }
instance Attr anything OnDragleave Cb where
  attr OnDragleave value = unsafeAttribute { key: "dragleave", value: cb' value }
instance Attr anything OnDragover Cb where
  attr OnDragover value = unsafeAttribute { key: "dragover", value: cb' value }
instance Attr anything OnDragstart Cb where
  attr OnDragstart value = unsafeAttribute { key: "dragstart", value: cb' value }
instance Attr anything OnDrop Cb where
  attr OnDrop value = unsafeAttribute { key: "drop", value: cb' value }
instance Attr anything OnDurationchange Cb where
  attr OnDurationchange value = unsafeAttribute { key: "durationchange", value: cb' value }
instance Attr anything OnEmptied Cb where
  attr OnEmptied value = unsafeAttribute { key: "emptied", value: cb' value }
instance Attr anything OnEnded Cb where
  attr OnEnded value = unsafeAttribute { key: "ended", value: cb' value }
instance Attr anything OnFormdata Cb where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb' value }
instance Attr anything OnGotpointercapture Cb where
  attr OnGotpointercapture value = unsafeAttribute { key: "gotpointercapture", value: cb' value }
instance Attr anything OnInput Cb where
  attr OnInput value = unsafeAttribute { key: "input", value: cb' value }
instance Attr anything OnInvalid Cb where
  attr OnInvalid value = unsafeAttribute { key: "invalid", value: cb' value }
instance Attr anything OnKeydown Cb where
  attr OnKeydown value = unsafeAttribute { key: "keydown", value: cb' value }
instance Attr anything OnKeypress Cb where
  attr OnKeypress value = unsafeAttribute { key: "keypress", value: cb' value }
instance Attr anything OnKeyup Cb where
  attr OnKeyup value = unsafeAttribute { key: "keyup", value: cb' value }
instance Attr anything OnLoad Cb where
  attr OnLoad value = unsafeAttribute { key: "load", value: cb' value }
instance Attr anything OnLoadeddata Cb where
  attr OnLoadeddata value = unsafeAttribute { key: "loadeddata", value: cb' value }
instance Attr anything OnLoadedmetadata Cb where
  attr OnLoadedmetadata value = unsafeAttribute { key: "loadedmetadata", value: cb' value }
instance Attr anything OnLoadend Cb where
  attr OnLoadend value = unsafeAttribute { key: "loadend", value: cb' value }
instance Attr anything OnLoadstart Cb where
  attr OnLoadstart value = unsafeAttribute { key: "loadstart", value: cb' value }
instance Attr anything OnLostpointercapture Cb where
  attr OnLostpointercapture value = unsafeAttribute { key: "lostpointercapture", value: cb' value }
instance Attr anything OnMousedown Cb where
  attr OnMousedown value = unsafeAttribute { key: "mousedown", value: cb' value }
instance Attr anything OnMouseenter Cb where
  attr OnMouseenter value = unsafeAttribute { key: "mouseenter", value: cb' value }
instance Attr anything OnMouseleave Cb where
  attr OnMouseleave value = unsafeAttribute { key: "mouseleave", value: cb' value }
instance Attr anything OnMousemove Cb where
  attr OnMousemove value = unsafeAttribute { key: "mousemove", value: cb' value }
instance Attr anything OnMouseout Cb where
  attr OnMouseout value = unsafeAttribute { key: "mouseout", value: cb' value }
instance Attr anything OnMouseover Cb where
  attr OnMouseover value = unsafeAttribute { key: "mouseover", value: cb' value }
instance Attr anything OnMouseup Cb where
  attr OnMouseup value = unsafeAttribute { key: "mouseup", value: cb' value }
instance Attr anything OnMousewheel   Cb where
  attr OnMousewheel   value = unsafeAttribute { key: "mousewheel  ", value: cb' value }
instance Attr anything OnWheel Cb where
  attr OnWheel value = unsafeAttribute { key: "wheel", value: cb' value }
instance Attr anything OnPause Cb where
  attr OnPause value = unsafeAttribute { key: "pause", value: cb' value }
instance Attr anything OnPlay Cb where
  attr OnPlay value = unsafeAttribute { key: "play", value: cb' value }
instance Attr anything OnPlaying Cb where
  attr OnPlaying value = unsafeAttribute { key: "playing", value: cb' value }
instance Attr anything OnPointerdown Cb where
  attr OnPointerdown value = unsafeAttribute { key: "pointerdown", value: cb' value }
instance Attr anything OnPointermove Cb where
  attr OnPointermove value = unsafeAttribute { key: "pointermove", value: cb' value }
instance Attr anything OnPointerup Cb where
  attr OnPointerup value = unsafeAttribute { key: "pointerup", value: cb' value }
instance Attr anything OnPointercancel Cb where
  attr OnPointercancel value = unsafeAttribute { key: "pointercancel", value: cb' value }
instance Attr anything OnPointerover Cb where
  attr OnPointerover value = unsafeAttribute { key: "pointerover", value: cb' value }
instance Attr anything OnPointerout Cb where
  attr OnPointerout value = unsafeAttribute { key: "pointerout", value: cb' value }
instance Attr anything OnPointerenter Cb where
  attr OnPointerenter value = unsafeAttribute { key: "pointerenter", value: cb' value }
instance Attr anything OnPointerleave Cb where
  attr OnPointerleave value = unsafeAttribute { key: "pointerleave", value: cb' value }
instance Attr anything OnPointerlockchange  Cb where
  attr OnPointerlockchange  value = unsafeAttribute { key: "pointerlockchange ", value: cb' value }
instance Attr anything OnPointerlockerror  Cb where
  attr OnPointerlockerror  value = unsafeAttribute { key: "pointerlockerror ", value: cb' value }
instance Attr anything OnProgress Cb where
  attr OnProgress value = unsafeAttribute { key: "progress", value: cb' value }
instance Attr anything OnRatechange Cb where
  attr OnRatechange value = unsafeAttribute { key: "ratechange", value: cb' value }
instance Attr anything OnReset Cb where
  attr OnReset value = unsafeAttribute { key: "reset", value: cb' value }
instance Attr anything OnResize Cb where
  attr OnResize value = unsafeAttribute { key: "resize", value: cb' value }
instance Attr anything OnScroll Cb where
  attr OnScroll value = unsafeAttribute { key: "scroll", value: cb' value }
instance Attr anything OnSecuritypolicyviolation Cb where
  attr OnSecuritypolicyviolation value = unsafeAttribute { key: "securitypolicyviolation", value: cb' value }
instance Attr anything OnSeeked Cb where
  attr OnSeeked value = unsafeAttribute { key: "seeked", value: cb' value }
instance Attr anything OnSeeking Cb where
  attr OnSeeking value = unsafeAttribute { key: "seeking", value: cb' value }
instance Attr anything OnSelect Cb where
  attr OnSelect value = unsafeAttribute { key: "select", value: cb' value }
instance Attr anything OnSelectstart Cb where
  attr OnSelectstart value = unsafeAttribute { key: "selectstart", value: cb' value }
instance Attr anything OnSelectionchange Cb where
  attr OnSelectionchange value = unsafeAttribute { key: "selectionchange", value: cb' value }
instance Attr anything OnShow  Cb where
  attr OnShow  value = unsafeAttribute { key: "show ", value: cb' value }
instance Attr anything OnSlotchange Cb where
  attr OnSlotchange value = unsafeAttribute { key: "slotchange", value: cb' value }
instance Attr anything OnStalled Cb where
  attr OnStalled value = unsafeAttribute { key: "stalled", value: cb' value }
instance Attr anything OnSubmit Cb where
  attr OnSubmit value = unsafeAttribute { key: "submit", value: cb' value }
instance Attr anything OnSuspend Cb where
  attr OnSuspend value = unsafeAttribute { key: "suspend", value: cb' value }
instance Attr anything OnTimeupdate Cb where
  attr OnTimeupdate value = unsafeAttribute { key: "timeupdate", value: cb' value }
instance Attr anything OnVolumechange Cb where
  attr OnVolumechange value = unsafeAttribute { key: "volumechange", value: cb' value }
instance Attr anything OnTouchcancel   Cb where
  attr OnTouchcancel   value = unsafeAttribute { key: "touchcancel  ", value: cb' value }
instance Attr anything OnTouchend   Cb where
  attr OnTouchend   value = unsafeAttribute { key: "touchend  ", value: cb' value }
instance Attr anything OnTouchmove   Cb where
  attr OnTouchmove   value = unsafeAttribute { key: "touchmove  ", value: cb' value }
instance Attr anything OnTouchstart   Cb where
  attr OnTouchstart   value = unsafeAttribute { key: "touchstart  ", value: cb' value }
instance Attr anything OnTransitioncancel Cb where
  attr OnTransitioncancel value = unsafeAttribute { key: "transitioncancel", value: cb' value }
instance Attr anything OnTransitionend Cb where
  attr OnTransitionend value = unsafeAttribute { key: "transitionend", value: cb' value }
instance Attr anything OnTransitionrun Cb where
  attr OnTransitionrun value = unsafeAttribute { key: "transitionrun", value: cb' value }
instance Attr anything OnTransitionstart Cb where
  attr OnTransitionstart value = unsafeAttribute { key: "transitionstart", value: cb' value }
instance Attr anything OnWaiting Cb where
  attr OnWaiting value = unsafeAttribute { key: "waiting", value: cb' value }
-- codegen 8
-- codegen 1
data A_

a
  :: forall dom engine
   . Event (Attribute A_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
a = elementify "a"

a_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
a_ = a empty
instance tagToDekuA_ :: TagToDeku "a" A_

data Abbr_

abbr
  :: forall dom engine
   . Event (Attribute Abbr_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
abbr = elementify "abbr"

abbr_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
abbr_ = abbr empty
instance tagToDekuAbbr_ :: TagToDeku "abbr" Abbr_

data Acronym_

acronym
  :: forall dom engine
   . Event (Attribute Acronym_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
acronym = elementify "acronym"

acronym_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
acronym_ = acronym empty
instance tagToDekuAcronym_ :: TagToDeku "acronym" Acronym_

data Address_

address
  :: forall dom engine
   . Event (Attribute Address_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
address = elementify "address"

address_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
address_ = address empty
instance tagToDekuAddress_ :: TagToDeku "address" Address_

data Applet_

applet
  :: forall dom engine
   . Event (Attribute Applet_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
applet = elementify "applet"

applet_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
applet_ = applet empty
instance tagToDekuApplet_ :: TagToDeku "applet" Applet_

data Area_

area
  :: forall dom engine
   . Event (Attribute Area_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
area = elementify "area"

area_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
area_ = area empty
instance tagToDekuArea_ :: TagToDeku "area" Area_

data Article_

article
  :: forall dom engine
   . Event (Attribute Article_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
article = elementify "article"

article_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
article_ = article empty
instance tagToDekuArticle_ :: TagToDeku "article" Article_

data Aside_

aside
  :: forall dom engine
   . Event (Attribute Aside_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
aside = elementify "aside"

aside_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
aside_ = aside empty
instance tagToDekuAside_ :: TagToDeku "aside" Aside_

data Audio_

audio
  :: forall dom engine
   . Event (Attribute Audio_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
audio = elementify "audio"

audio_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
audio_ = audio empty
instance tagToDekuAudio_ :: TagToDeku "audio" Audio_

data B_

b
  :: forall dom engine
   . Event (Attribute B_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
b = elementify "b"

b_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
b_ = b empty
instance tagToDekuB_ :: TagToDeku "b" B_

data Base_

base
  :: forall dom engine
   . Event (Attribute Base_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
base = elementify "base"

base_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
base_ = base empty
instance tagToDekuBase_ :: TagToDeku "base" Base_

data Basefont_

basefont
  :: forall dom engine
   . Event (Attribute Basefont_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
basefont = elementify "basefont"

basefont_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
basefont_ = basefont empty
instance tagToDekuBasefont_ :: TagToDeku "basefont" Basefont_

data Bdi_

bdi
  :: forall dom engine
   . Event (Attribute Bdi_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
bdi = elementify "bdi"

bdi_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
bdi_ = bdi empty
instance tagToDekuBdi_ :: TagToDeku "bdi" Bdi_

data Bdo_

bdo
  :: forall dom engine
   . Event (Attribute Bdo_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
bdo = elementify "bdo"

bdo_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
bdo_ = bdo empty
instance tagToDekuBdo_ :: TagToDeku "bdo" Bdo_

data Big_

big
  :: forall dom engine
   . Event (Attribute Big_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
big = elementify "big"

big_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
big_ = big empty
instance tagToDekuBig_ :: TagToDeku "big" Big_

data Blockquote_

blockquote
  :: forall dom engine
   . Event (Attribute Blockquote_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
blockquote = elementify "blockquote"

blockquote_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
blockquote_ = blockquote empty
instance tagToDekuBlockquote_ :: TagToDeku "blockquote" Blockquote_

data Body_

body
  :: forall dom engine
   . Event (Attribute Body_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
body = elementify "body"

body_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
body_ = body empty
instance tagToDekuBody_ :: TagToDeku "body" Body_

data Br_

br
  :: forall dom engine
   . Event (Attribute Br_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
br = elementify "br"

br_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
br_ = br empty
instance tagToDekuBr_ :: TagToDeku "br" Br_

data Button_

button
  :: forall dom engine
   . Event (Attribute Button_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
button = elementify "button"

button_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
button_ = button empty
instance tagToDekuButton_ :: TagToDeku "button" Button_

data Canvas_

canvas
  :: forall dom engine
   . Event (Attribute Canvas_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
canvas = elementify "canvas"

canvas_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
canvas_ = canvas empty
instance tagToDekuCanvas_ :: TagToDeku "canvas" Canvas_

data Caption_

caption
  :: forall dom engine
   . Event (Attribute Caption_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
caption = elementify "caption"

caption_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
caption_ = caption empty
instance tagToDekuCaption_ :: TagToDeku "caption" Caption_

data Center_

center
  :: forall dom engine
   . Event (Attribute Center_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
center = elementify "center"

center_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
center_ = center empty
instance tagToDekuCenter_ :: TagToDeku "center" Center_

data Cite_

cite
  :: forall dom engine
   . Event (Attribute Cite_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
cite = elementify "cite"

cite_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
cite_ = cite empty
instance tagToDekuCite_ :: TagToDeku "cite" Cite_

data Code_

code
  :: forall dom engine
   . Event (Attribute Code_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
code = elementify "code"

code_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
code_ = code empty
instance tagToDekuCode_ :: TagToDeku "code" Code_

data Col_

col
  :: forall dom engine
   . Event (Attribute Col_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
col = elementify "col"

col_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
col_ = col empty
instance tagToDekuCol_ :: TagToDeku "col" Col_

data Colgroup_

colgroup
  :: forall dom engine
   . Event (Attribute Colgroup_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
colgroup = elementify "colgroup"

colgroup_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
colgroup_ = colgroup empty
instance tagToDekuColgroup_ :: TagToDeku "colgroup" Colgroup_

data Xdata_

xdata
  :: forall dom engine
   . Event (Attribute Xdata_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
xdata = elementify "data"

xdata_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
xdata_ = xdata empty
instance tagToDekuXdata_ :: TagToDeku "data" Xdata_

data Datalist_

datalist
  :: forall dom engine
   . Event (Attribute Datalist_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
datalist = elementify "datalist"

datalist_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
datalist_ = datalist empty
instance tagToDekuDatalist_ :: TagToDeku "datalist" Datalist_

data Dd_

dd
  :: forall dom engine
   . Event (Attribute Dd_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
dd = elementify "dd"

dd_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
dd_ = dd empty
instance tagToDekuDd_ :: TagToDeku "dd" Dd_

data Del_

del
  :: forall dom engine
   . Event (Attribute Del_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
del = elementify "del"

del_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
del_ = del empty
instance tagToDekuDel_ :: TagToDeku "del" Del_

data Details_

details
  :: forall dom engine
   . Event (Attribute Details_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
details = elementify "details"

details_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
details_ = details empty
instance tagToDekuDetails_ :: TagToDeku "details" Details_

data Dfn_

dfn
  :: forall dom engine
   . Event (Attribute Dfn_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
dfn = elementify "dfn"

dfn_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
dfn_ = dfn empty
instance tagToDekuDfn_ :: TagToDeku "dfn" Dfn_

data Dialog_

dialog
  :: forall dom engine
   . Event (Attribute Dialog_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
dialog = elementify "dialog"

dialog_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
dialog_ = dialog empty
instance tagToDekuDialog_ :: TagToDeku "dialog" Dialog_

data Dir_

dir
  :: forall dom engine
   . Event (Attribute Dir_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
dir = elementify "dir"

dir_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
dir_ = dir empty
instance tagToDekuDir_ :: TagToDeku "dir" Dir_

data Div_

div
  :: forall dom engine
   . Event (Attribute Div_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
div = elementify "div"

div_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
div_ = div empty
instance tagToDekuDiv_ :: TagToDeku "div" Div_

data Dl_

dl
  :: forall dom engine
   . Event (Attribute Dl_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
dl = elementify "dl"

dl_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
dl_ = dl empty
instance tagToDekuDl_ :: TagToDeku "dl" Dl_

data Dt_

dt
  :: forall dom engine
   . Event (Attribute Dt_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
dt = elementify "dt"

dt_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
dt_ = dt empty
instance tagToDekuDt_ :: TagToDeku "dt" Dt_

data Em_

em
  :: forall dom engine
   . Event (Attribute Em_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
em = elementify "em"

em_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
em_ = em empty
instance tagToDekuEm_ :: TagToDeku "em" Em_

data Embed_

embed
  :: forall dom engine
   . Event (Attribute Embed_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
embed = elementify "embed"

embed_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
embed_ = embed empty
instance tagToDekuEmbed_ :: TagToDeku "embed" Embed_

data Fieldset_

fieldset
  :: forall dom engine
   . Event (Attribute Fieldset_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
fieldset = elementify "fieldset"

fieldset_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
fieldset_ = fieldset empty
instance tagToDekuFieldset_ :: TagToDeku "fieldset" Fieldset_

data Figcaption_

figcaption
  :: forall dom engine
   . Event (Attribute Figcaption_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
figcaption = elementify "figcaption"

figcaption_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
figcaption_ = figcaption empty
instance tagToDekuFigcaption_ :: TagToDeku "figcaption" Figcaption_

data Figure_

figure
  :: forall dom engine
   . Event (Attribute Figure_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
figure = elementify "figure"

figure_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
figure_ = figure empty
instance tagToDekuFigure_ :: TagToDeku "figure" Figure_

data Font_

font
  :: forall dom engine
   . Event (Attribute Font_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
font = elementify "font"

font_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
font_ = font empty
instance tagToDekuFont_ :: TagToDeku "font" Font_

data Footer_

footer
  :: forall dom engine
   . Event (Attribute Footer_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
footer = elementify "footer"

footer_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
footer_ = footer empty
instance tagToDekuFooter_ :: TagToDeku "footer" Footer_

data Form_

form
  :: forall dom engine
   . Event (Attribute Form_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
form = elementify "form"

form_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
form_ = form empty
instance tagToDekuForm_ :: TagToDeku "form" Form_

data Frame_

frame
  :: forall dom engine
   . Event (Attribute Frame_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
frame = elementify "frame"

frame_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
frame_ = frame empty
instance tagToDekuFrame_ :: TagToDeku "frame" Frame_

data Frameset_

frameset
  :: forall dom engine
   . Event (Attribute Frameset_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
frameset = elementify "frameset"

frameset_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
frameset_ = frameset empty
instance tagToDekuFrameset_ :: TagToDeku "frameset" Frameset_

data H1_

h1
  :: forall dom engine
   . Event (Attribute H1_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
h1 = elementify "h1"

h1_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
h1_ = h1 empty
instance tagToDekuH1_ :: TagToDeku "h1" H1_

data H2_

h2
  :: forall dom engine
   . Event (Attribute H2_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
h2 = elementify "h2"

h2_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
h2_ = h2 empty
instance tagToDekuH2_ :: TagToDeku "h2" H2_

data H3_

h3
  :: forall dom engine
   . Event (Attribute H3_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
h3 = elementify "h3"

h3_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
h3_ = h3 empty
instance tagToDekuH3_ :: TagToDeku "h3" H3_

data H4_

h4
  :: forall dom engine
   . Event (Attribute H4_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
h4 = elementify "h4"

h4_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
h4_ = h4 empty
instance tagToDekuH4_ :: TagToDeku "h4" H4_

data H5_

h5
  :: forall dom engine
   . Event (Attribute H5_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
h5 = elementify "h5"

h5_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
h5_ = h5 empty
instance tagToDekuH5_ :: TagToDeku "h5" H5_

data H6_

h6
  :: forall dom engine
   . Event (Attribute H6_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
h6 = elementify "h6"

h6_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
h6_ = h6 empty
instance tagToDekuH6_ :: TagToDeku "h6" H6_

data Head_

head
  :: forall dom engine
   . Event (Attribute Head_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
head = elementify "head"

head_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
head_ = head empty
instance tagToDekuHead_ :: TagToDeku "head" Head_

data Header_

header
  :: forall dom engine
   . Event (Attribute Header_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
header = elementify "header"

header_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
header_ = header empty
instance tagToDekuHeader_ :: TagToDeku "header" Header_

data Hr_

hr
  :: forall dom engine
   . Event (Attribute Hr_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
hr = elementify "hr"

hr_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
hr_ = hr empty
instance tagToDekuHr_ :: TagToDeku "hr" Hr_

data Html_

html
  :: forall dom engine
   . Event (Attribute Html_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
html = elementify "html"

html_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
html_ = html empty
instance tagToDekuHtml_ :: TagToDeku "html" Html_

data I_

i
  :: forall dom engine
   . Event (Attribute I_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
i = elementify "i"

i_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
i_ = i empty
instance tagToDekuI_ :: TagToDeku "i" I_

data Iframe_

iframe
  :: forall dom engine
   . Event (Attribute Iframe_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
iframe = elementify "iframe"

iframe_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
iframe_ = iframe empty
instance tagToDekuIframe_ :: TagToDeku "iframe" Iframe_

data Img_

img
  :: forall dom engine
   . Event (Attribute Img_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
img = elementify "img"

img_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
img_ = img empty
instance tagToDekuImg_ :: TagToDeku "img" Img_

data Input_

input
  :: forall dom engine
   . Event (Attribute Input_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
input = elementify "input"

input_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
input_ = input empty
instance tagToDekuInput_ :: TagToDeku "input" Input_

data Ins_

ins
  :: forall dom engine
   . Event (Attribute Ins_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
ins = elementify "ins"

ins_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
ins_ = ins empty
instance tagToDekuIns_ :: TagToDeku "ins" Ins_

data Kbd_

kbd
  :: forall dom engine
   . Event (Attribute Kbd_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
kbd = elementify "kbd"

kbd_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
kbd_ = kbd empty
instance tagToDekuKbd_ :: TagToDeku "kbd" Kbd_

data Label_

label
  :: forall dom engine
   . Event (Attribute Label_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
label = elementify "label"

label_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
label_ = label empty
instance tagToDekuLabel_ :: TagToDeku "label" Label_

data Legend_

legend
  :: forall dom engine
   . Event (Attribute Legend_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
legend = elementify "legend"

legend_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
legend_ = legend empty
instance tagToDekuLegend_ :: TagToDeku "legend" Legend_

data Li_

li
  :: forall dom engine
   . Event (Attribute Li_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
li = elementify "li"

li_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
li_ = li empty
instance tagToDekuLi_ :: TagToDeku "li" Li_

data Link_

link
  :: forall dom engine
   . Event (Attribute Link_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
link = elementify "link"

link_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
link_ = link empty
instance tagToDekuLink_ :: TagToDeku "link" Link_

data Main_

main
  :: forall dom engine
   . Event (Attribute Main_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
main = elementify "main"

main_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
main_ = main empty
instance tagToDekuMain_ :: TagToDeku "main" Main_

data Map_

map
  :: forall dom engine
   . Event (Attribute Map_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
map = elementify "map"

map_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
map_ = map empty
instance tagToDekuMap_ :: TagToDeku "map" Map_

data Mark_

mark
  :: forall dom engine
   . Event (Attribute Mark_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
mark = elementify "mark"

mark_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
mark_ = mark empty
instance tagToDekuMark_ :: TagToDeku "mark" Mark_

data Meta_

meta
  :: forall dom engine
   . Event (Attribute Meta_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
meta = elementify "meta"

meta_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
meta_ = meta empty
instance tagToDekuMeta_ :: TagToDeku "meta" Meta_

data Meter_

meter
  :: forall dom engine
   . Event (Attribute Meter_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
meter = elementify "meter"

meter_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
meter_ = meter empty
instance tagToDekuMeter_ :: TagToDeku "meter" Meter_

data Nav_

nav
  :: forall dom engine
   . Event (Attribute Nav_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
nav = elementify "nav"

nav_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
nav_ = nav empty
instance tagToDekuNav_ :: TagToDeku "nav" Nav_

data Noframes_

noframes
  :: forall dom engine
   . Event (Attribute Noframes_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
noframes = elementify "noframes"

noframes_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
noframes_ = noframes empty
instance tagToDekuNoframes_ :: TagToDeku "noframes" Noframes_

data Noscript_

noscript
  :: forall dom engine
   . Event (Attribute Noscript_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
noscript = elementify "noscript"

noscript_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
noscript_ = noscript empty
instance tagToDekuNoscript_ :: TagToDeku "noscript" Noscript_

data Object_

object
  :: forall dom engine
   . Event (Attribute Object_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
object = elementify "object"

object_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
object_ = object empty
instance tagToDekuObject_ :: TagToDeku "object" Object_

data Ol_

ol
  :: forall dom engine
   . Event (Attribute Ol_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
ol = elementify "ol"

ol_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
ol_ = ol empty
instance tagToDekuOl_ :: TagToDeku "ol" Ol_

data Optgroup_

optgroup
  :: forall dom engine
   . Event (Attribute Optgroup_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
optgroup = elementify "optgroup"

optgroup_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
optgroup_ = optgroup empty
instance tagToDekuOptgroup_ :: TagToDeku "optgroup" Optgroup_

data Option_

option
  :: forall dom engine
   . Event (Attribute Option_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
option = elementify "option"

option_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
option_ = option empty
instance tagToDekuOption_ :: TagToDeku "option" Option_

data Output_

output
  :: forall dom engine
   . Event (Attribute Output_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
output = elementify "output"

output_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
output_ = output empty
instance tagToDekuOutput_ :: TagToDeku "output" Output_

data P_

p
  :: forall dom engine
   . Event (Attribute P_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
p = elementify "p"

p_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
p_ = p empty
instance tagToDekuP_ :: TagToDeku "p" P_

data Param_

param
  :: forall dom engine
   . Event (Attribute Param_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
param = elementify "param"

param_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
param_ = param empty
instance tagToDekuParam_ :: TagToDeku "param" Param_

data Picture_

picture
  :: forall dom engine
   . Event (Attribute Picture_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
picture = elementify "picture"

picture_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
picture_ = picture empty
instance tagToDekuPicture_ :: TagToDeku "picture" Picture_

data Pre_

pre
  :: forall dom engine
   . Event (Attribute Pre_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
pre = elementify "pre"

pre_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
pre_ = pre empty
instance tagToDekuPre_ :: TagToDeku "pre" Pre_

data Progress_

progress
  :: forall dom engine
   . Event (Attribute Progress_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
progress = elementify "progress"

progress_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
progress_ = progress empty
instance tagToDekuProgress_ :: TagToDeku "progress" Progress_

data Q_

q
  :: forall dom engine
   . Event (Attribute Q_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
q = elementify "q"

q_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
q_ = q empty
instance tagToDekuQ_ :: TagToDeku "q" Q_

data Rp_

rp
  :: forall dom engine
   . Event (Attribute Rp_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
rp = elementify "rp"

rp_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
rp_ = rp empty
instance tagToDekuRp_ :: TagToDeku "rp" Rp_

data Rt_

rt
  :: forall dom engine
   . Event (Attribute Rt_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
rt = elementify "rt"

rt_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
rt_ = rt empty
instance tagToDekuRt_ :: TagToDeku "rt" Rt_

data Ruby_

ruby
  :: forall dom engine
   . Event (Attribute Ruby_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
ruby = elementify "ruby"

ruby_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
ruby_ = ruby empty
instance tagToDekuRuby_ :: TagToDeku "ruby" Ruby_

data S_

s
  :: forall dom engine
   . Event (Attribute S_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
s = elementify "s"

s_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
s_ = s empty
instance tagToDekuS_ :: TagToDeku "s" S_

data Samp_

samp
  :: forall dom engine
   . Event (Attribute Samp_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
samp = elementify "samp"

samp_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
samp_ = samp empty
instance tagToDekuSamp_ :: TagToDeku "samp" Samp_

data Script_

script
  :: forall dom engine
   . Event (Attribute Script_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
script = elementify "script"

script_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
script_ = script empty
instance tagToDekuScript_ :: TagToDeku "script" Script_

data Section_

section
  :: forall dom engine
   . Event (Attribute Section_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
section = elementify "section"

section_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
section_ = section empty
instance tagToDekuSection_ :: TagToDeku "section" Section_

data Select_

select
  :: forall dom engine
   . Event (Attribute Select_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
select = elementify "select"

select_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
select_ = select empty
instance tagToDekuSelect_ :: TagToDeku "select" Select_

data Small_

small
  :: forall dom engine
   . Event (Attribute Small_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
small = elementify "small"

small_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
small_ = small empty
instance tagToDekuSmall_ :: TagToDeku "small" Small_

data Source_

source
  :: forall dom engine
   . Event (Attribute Source_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
source = elementify "source"

source_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
source_ = source empty
instance tagToDekuSource_ :: TagToDeku "source" Source_

data Span_

span
  :: forall dom engine
   . Event (Attribute Span_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
span = elementify "span"

span_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
span_ = span empty
instance tagToDekuSpan_ :: TagToDeku "span" Span_

data Strike_

strike
  :: forall dom engine
   . Event (Attribute Strike_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
strike = elementify "strike"

strike_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
strike_ = strike empty
instance tagToDekuStrike_ :: TagToDeku "strike" Strike_

data Strong_

strong
  :: forall dom engine
   . Event (Attribute Strong_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
strong = elementify "strong"

strong_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
strong_ = strong empty
instance tagToDekuStrong_ :: TagToDeku "strong" Strong_

data Style_

style
  :: forall dom engine
   . Event (Attribute Style_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
style = elementify "style"

style_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
style_ = style empty
instance tagToDekuStyle_ :: TagToDeku "style" Style_

data Sub_

sub
  :: forall dom engine
   . Event (Attribute Sub_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
sub = elementify "sub"

sub_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
sub_ = sub empty
instance tagToDekuSub_ :: TagToDeku "sub" Sub_

data Summary_

summary
  :: forall dom engine
   . Event (Attribute Summary_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
summary = elementify "summary"

summary_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
summary_ = summary empty
instance tagToDekuSummary_ :: TagToDeku "summary" Summary_

data Sup_

sup
  :: forall dom engine
   . Event (Attribute Sup_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
sup = elementify "sup"

sup_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
sup_ = sup empty
instance tagToDekuSup_ :: TagToDeku "sup" Sup_

data Svg_

svg
  :: forall dom engine
   . Event (Attribute Svg_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
svg = elementify "svg"

svg_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
svg_ = svg empty
instance tagToDekuSvg_ :: TagToDeku "svg" Svg_

data Table_

table
  :: forall dom engine
   . Event (Attribute Table_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
table = elementify "table"

table_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
table_ = table empty
instance tagToDekuTable_ :: TagToDeku "table" Table_

data Tbody_

tbody
  :: forall dom engine
   . Event (Attribute Tbody_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
tbody = elementify "tbody"

tbody_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
tbody_ = tbody empty
instance tagToDekuTbody_ :: TagToDeku "tbody" Tbody_

data Td_

td
  :: forall dom engine
   . Event (Attribute Td_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
td = elementify "td"

td_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
td_ = td empty
instance tagToDekuTd_ :: TagToDeku "td" Td_

data Template_

template
  :: forall dom engine
   . Event (Attribute Template_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
template = elementify "template"

template_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
template_ = template empty
instance tagToDekuTemplate_ :: TagToDeku "template" Template_

data Textarea_

textarea
  :: forall dom engine
   . Event (Attribute Textarea_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
textarea = elementify "textarea"

textarea_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
textarea_ = textarea empty
instance tagToDekuTextarea_ :: TagToDeku "textarea" Textarea_

data Tfoot_

tfoot
  :: forall dom engine
   . Event (Attribute Tfoot_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
tfoot = elementify "tfoot"

tfoot_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
tfoot_ = tfoot empty
instance tagToDekuTfoot_ :: TagToDeku "tfoot" Tfoot_

data Th_

th
  :: forall dom engine
   . Event (Attribute Th_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
th = elementify "th"

th_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
th_ = th empty
instance tagToDekuTh_ :: TagToDeku "th" Th_

data Thead_

thead
  :: forall dom engine
   . Event (Attribute Thead_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
thead = elementify "thead"

thead_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
thead_ = thead empty
instance tagToDekuThead_ :: TagToDeku "thead" Thead_

data Time_

time
  :: forall dom engine
   . Event (Attribute Time_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
time = elementify "time"

time_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
time_ = time empty
instance tagToDekuTime_ :: TagToDeku "time" Time_

data Title_

title
  :: forall dom engine
   . Event (Attribute Title_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
title = elementify "title"

title_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
title_ = title empty
instance tagToDekuTitle_ :: TagToDeku "title" Title_

data Tr_

tr
  :: forall dom engine
   . Event (Attribute Tr_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
tr = elementify "tr"

tr_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
tr_ = tr empty
instance tagToDekuTr_ :: TagToDeku "tr" Tr_

data Track_

track
  :: forall dom engine
   . Event (Attribute Track_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
track = elementify "track"

track_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
track_ = track empty
instance tagToDekuTrack_ :: TagToDeku "track" Track_

data Tt_

tt
  :: forall dom engine
   . Event (Attribute Tt_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
tt = elementify "tt"

tt_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
tt_ = tt empty
instance tagToDekuTt_ :: TagToDeku "tt" Tt_

data U_

u
  :: forall dom engine
   . Event (Attribute U_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
u = elementify "u"

u_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
u_ = u empty
instance tagToDekuU_ :: TagToDeku "u" U_

data Ul_

ul
  :: forall dom engine
   . Event (Attribute Ul_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
ul = elementify "ul"

ul_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
ul_ = ul empty
instance tagToDekuUl_ :: TagToDeku "ul" Ul_

data Var_

var
  :: forall dom engine
   . Event (Attribute Var_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
var = elementify "var"

var_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
var_ = var empty
instance tagToDekuVar_ :: TagToDeku "var" Var_

data Video_

video
  :: forall dom engine
   . Event (Attribute Video_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
video = elementify "video"

video_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
video_ = video empty
instance tagToDekuVideo_ :: TagToDeku "video" Video_

data Wbr_

wbr
  :: forall dom engine
   . Event (Attribute Wbr_)
  -> Array (Element_ dom engine)
  -> Element_ dom engine
wbr = elementify "wbr"

wbr_
  :: forall dom engine
   . Array (Element_ dom engine)
  -> Element_ dom engine
wbr_ = wbr empty
instance tagToDekuWbr_ :: TagToDeku "wbr" Wbr_

-- codegen 1
