module Deku.DOM
  ( class TagToDeku
  , Self(..)
  -- codegen 7
, module Deku.DOM.Attr.Accept
, module Deku.DOM.Attr.AcceptCharset
, module Deku.DOM.Attr.Accesskey
, module Deku.DOM.Attr.Action
, module Deku.DOM.Attr.Align
, module Deku.DOM.Attr.Allow
, module Deku.DOM.Attr.Alt
, module Deku.DOM.Attr.Async
, module Deku.DOM.Attr.Autocapitalize
, module Deku.DOM.Attr.Autocomplete
, module Deku.DOM.Attr.Autofocus
, module Deku.DOM.Attr.Autoplay
, module Deku.DOM.Attr.Background
, module Deku.DOM.Attr.Bgcolor
, module Deku.DOM.Attr.Border
, module Deku.DOM.Attr.Buffered
, module Deku.DOM.Attr.Capture
, module Deku.DOM.Attr.Challenge
, module Deku.DOM.Attr.Charset
, module Deku.DOM.Attr.Checked
, module Deku.DOM.Attr.Cite
, module Deku.DOM.Attr.Class
, module Deku.DOM.Attr.Code
, module Deku.DOM.Attr.Codebase
, module Deku.DOM.Attr.Color
, module Deku.DOM.Attr.Cols
, module Deku.DOM.Attr.Colspan
, module Deku.DOM.Attr.Content
, module Deku.DOM.Attr.Contenteditable
, module Deku.DOM.Attr.Contextmenu
, module Deku.DOM.Attr.Controls
, module Deku.DOM.Attr.Coords
, module Deku.DOM.Attr.Crossorigin
, module Deku.DOM.Attr.Csp
, module Deku.DOM.Attr.Data
, module Deku.DOM.Attr.Datetime
, module Deku.DOM.Attr.Decoding
, module Deku.DOM.Attr.Default
, module Deku.DOM.Attr.Defer
, module Deku.DOM.Attr.Dir
, module Deku.DOM.Attr.Dirname
, module Deku.DOM.Attr.Disabled
, module Deku.DOM.Attr.Download
, module Deku.DOM.Attr.Draggable
, module Deku.DOM.Attr.Enctype
, module Deku.DOM.Attr.Enterkeyhint
, module Deku.DOM.Attr.For
, module Deku.DOM.Attr.Form
, module Deku.DOM.Attr.Formaction
, module Deku.DOM.Attr.Formenctype
, module Deku.DOM.Attr.Formmethod
, module Deku.DOM.Attr.Formnovalidate
, module Deku.DOM.Attr.Formtarget
, module Deku.DOM.Attr.Headers
, module Deku.DOM.Attr.Height
, module Deku.DOM.Attr.Hidden
, module Deku.DOM.Attr.High
, module Deku.DOM.Attr.Href
, module Deku.DOM.Attr.Hreflang
, module Deku.DOM.Attr.HttpEquiv
, module Deku.DOM.Attr.Icon
, module Deku.DOM.Attr.Id
, module Deku.DOM.Attr.Importance
, module Deku.DOM.Attr.Integrity
, module Deku.DOM.Attr.Intrinsicsize
, module Deku.DOM.Attr.Inputmode
, module Deku.DOM.Attr.Ismap
, module Deku.DOM.Attr.Itemprop
, module Deku.DOM.Attr.Keytype
, module Deku.DOM.Attr.Kind
, module Deku.DOM.Attr.Label
, module Deku.DOM.Attr.Lang
, module Deku.DOM.Attr.Language
, module Deku.DOM.Attr.Loading 
, module Deku.DOM.Attr.List
, module Deku.DOM.Attr.Loop
, module Deku.DOM.Attr.Low
, module Deku.DOM.Attr.Manifest
, module Deku.DOM.Attr.Max
, module Deku.DOM.Attr.Maxlength
, module Deku.DOM.Attr.Minlength
, module Deku.DOM.Attr.Media
, module Deku.DOM.Attr.Method
, module Deku.DOM.Attr.Min
, module Deku.DOM.Attr.Multiple
, module Deku.DOM.Attr.Muted
, module Deku.DOM.Attr.Name
, module Deku.DOM.Attr.Novalidate
, module Deku.DOM.Attr.Open
, module Deku.DOM.Attr.Optimum
, module Deku.DOM.Attr.Pattern
, module Deku.DOM.Attr.Ping
, module Deku.DOM.Attr.Placeholder
, module Deku.DOM.Attr.Poster
, module Deku.DOM.Attr.Preload
, module Deku.DOM.Attr.Radiogroup
, module Deku.DOM.Attr.Readonly
, module Deku.DOM.Attr.Referrerpolicy
, module Deku.DOM.Attr.Rel
, module Deku.DOM.Attr.Required
, module Deku.DOM.Attr.Reversed
, module Deku.DOM.Attr.Role
, module Deku.DOM.Attr.Rows
, module Deku.DOM.Attr.Rowspan
, module Deku.DOM.Attr.Sandbox
, module Deku.DOM.Attr.Scope
, module Deku.DOM.Attr.Scoped
, module Deku.DOM.Attr.Selected
, module Deku.DOM.Attr.Shape
, module Deku.DOM.Attr.Size
, module Deku.DOM.Attr.Sizes
, module Deku.DOM.Attr.Slot
, module Deku.DOM.Attr.Span
, module Deku.DOM.Attr.Spellcheck
, module Deku.DOM.Attr.Src
, module Deku.DOM.Attr.Srcdoc
, module Deku.DOM.Attr.Srclang
, module Deku.DOM.Attr.Srcset
, module Deku.DOM.Attr.Start
, module Deku.DOM.Attr.Step
, module Deku.DOM.Attr.Style
, module Deku.DOM.Attr.Summary
, module Deku.DOM.Attr.Tabindex
, module Deku.DOM.Attr.Target
, module Deku.DOM.Attr.Title
, module Deku.DOM.Attr.Translate
, module Deku.DOM.Attr.Usemap
, module Deku.DOM.Attr.Value
, module Deku.DOM.Attr.Width
, module Deku.DOM.Attr.Xtype
, module Deku.DOM.Attr.OnAbort
, module Deku.DOM.Attr.OnAnimationcancel 
, module Deku.DOM.Attr.OnAnimationend 
, module Deku.DOM.Attr.OnAnimationiteration 
, module Deku.DOM.Attr.OnAnimationstart 
, module Deku.DOM.Attr.OnAuxclick 
, module Deku.DOM.Attr.OnBlur
, module Deku.DOM.Attr.OnError
, module Deku.DOM.Attr.OnFocus
, module Deku.DOM.Attr.OnCancel
, module Deku.DOM.Attr.OnCanplay
, module Deku.DOM.Attr.OnCanplaythrough
, module Deku.DOM.Attr.OnChange
, module Deku.DOM.Attr.OnClick
, module Deku.DOM.Attr.OnClose
, module Deku.DOM.Attr.OnContextmenu
, module Deku.DOM.Attr.OnDblclick
, module Deku.DOM.Attr.OnDrag
, module Deku.DOM.Attr.OnDragend
, module Deku.DOM.Attr.OnDragenter
, module Deku.DOM.Attr.OnDragleave
, module Deku.DOM.Attr.OnDragover
, module Deku.DOM.Attr.OnDragstart
, module Deku.DOM.Attr.OnDrop
, module Deku.DOM.Attr.OnDurationchange
, module Deku.DOM.Attr.OnEmptied
, module Deku.DOM.Attr.OnEnded
, module Deku.DOM.Attr.OnFormdata
, module Deku.DOM.Attr.OnGotpointercapture
, module Deku.DOM.Attr.OnInput
, module Deku.DOM.Attr.OnInvalid
, module Deku.DOM.Attr.OnKeydown
, module Deku.DOM.Attr.OnKeypress
, module Deku.DOM.Attr.OnKeyup
, module Deku.DOM.Attr.OnLoad
, module Deku.DOM.Attr.OnLoadeddata
, module Deku.DOM.Attr.OnLoadedmetadata
, module Deku.DOM.Attr.OnLoadend
, module Deku.DOM.Attr.OnLoadstart
, module Deku.DOM.Attr.OnLostpointercapture
, module Deku.DOM.Attr.OnMousedown
, module Deku.DOM.Attr.OnMouseenter
, module Deku.DOM.Attr.OnMouseleave
, module Deku.DOM.Attr.OnMousemove
, module Deku.DOM.Attr.OnMouseout
, module Deku.DOM.Attr.OnMouseover
, module Deku.DOM.Attr.OnMouseup
, module Deku.DOM.Attr.OnMousewheel  
, module Deku.DOM.Attr.OnWheel
, module Deku.DOM.Attr.OnPause
, module Deku.DOM.Attr.OnPlay
, module Deku.DOM.Attr.OnPlaying
, module Deku.DOM.Attr.OnPointerdown
, module Deku.DOM.Attr.OnPointermove
, module Deku.DOM.Attr.OnPointerup
, module Deku.DOM.Attr.OnPointercancel
, module Deku.DOM.Attr.OnPointerover
, module Deku.DOM.Attr.OnPointerout
, module Deku.DOM.Attr.OnPointerenter
, module Deku.DOM.Attr.OnPointerleave
, module Deku.DOM.Attr.OnPointerlockchange 
, module Deku.DOM.Attr.OnPointerlockerror 
, module Deku.DOM.Attr.OnProgress
, module Deku.DOM.Attr.OnRatechange
, module Deku.DOM.Attr.OnReset
, module Deku.DOM.Attr.OnResize
, module Deku.DOM.Attr.OnScroll
, module Deku.DOM.Attr.OnSecuritypolicyviolation
, module Deku.DOM.Attr.OnSeeked
, module Deku.DOM.Attr.OnSeeking
, module Deku.DOM.Attr.OnSelect
, module Deku.DOM.Attr.OnSelectstart
, module Deku.DOM.Attr.OnSelectionchange
, module Deku.DOM.Attr.OnShow 
, module Deku.DOM.Attr.OnSlotchange
, module Deku.DOM.Attr.OnStalled
, module Deku.DOM.Attr.OnSubmit
, module Deku.DOM.Attr.OnSuspend
, module Deku.DOM.Attr.OnTimeupdate
, module Deku.DOM.Attr.OnVolumechange
, module Deku.DOM.Attr.OnTouchcancel  
, module Deku.DOM.Attr.OnTouchend  
, module Deku.DOM.Attr.OnTouchmove  
, module Deku.DOM.Attr.OnTouchstart  
, module Deku.DOM.Attr.OnTransitioncancel
, module Deku.DOM.Attr.OnTransitionend
, module Deku.DOM.Attr.OnTransitionrun
, module Deku.DOM.Attr.OnTransitionstart
, module Deku.DOM.Attr.OnWaiting
  -- codegen 7
  -- codegen 0
, module Deku.DOM.Elt.A
, module Deku.DOM.Elt.Abbr
, module Deku.DOM.Elt.Acronym
, module Deku.DOM.Elt.Address
, module Deku.DOM.Elt.Applet
, module Deku.DOM.Elt.Area
, module Deku.DOM.Elt.Article
, module Deku.DOM.Elt.Aside
, module Deku.DOM.Elt.Audio
, module Deku.DOM.Elt.B
, module Deku.DOM.Elt.Base
, module Deku.DOM.Elt.Basefont
, module Deku.DOM.Elt.Bdi
, module Deku.DOM.Elt.Bdo
, module Deku.DOM.Elt.Big
, module Deku.DOM.Elt.Blockquote
, module Deku.DOM.Elt.Body
, module Deku.DOM.Elt.Br
, module Deku.DOM.Elt.Button
, module Deku.DOM.Elt.Canvas
, module Deku.DOM.Elt.Caption
, module Deku.DOM.Elt.Center
, module Deku.DOM.Elt.Cite
, module Deku.DOM.Elt.Code
, module Deku.DOM.Elt.Col
, module Deku.DOM.Elt.Colgroup
, module Deku.DOM.Elt.Xdata
, module Deku.DOM.Elt.Datalist
, module Deku.DOM.Elt.Dd
, module Deku.DOM.Elt.Del
, module Deku.DOM.Elt.Details
, module Deku.DOM.Elt.Dfn
, module Deku.DOM.Elt.Dialog
, module Deku.DOM.Elt.Dir
, module Deku.DOM.Elt.Div
, module Deku.DOM.Elt.Dl
, module Deku.DOM.Elt.Dt
, module Deku.DOM.Elt.Em
, module Deku.DOM.Elt.Embed
, module Deku.DOM.Elt.Fieldset
, module Deku.DOM.Elt.Figcaption
, module Deku.DOM.Elt.Figure
, module Deku.DOM.Elt.Font
, module Deku.DOM.Elt.Footer
, module Deku.DOM.Elt.Form
, module Deku.DOM.Elt.Frame
, module Deku.DOM.Elt.Frameset
, module Deku.DOM.Elt.H1
, module Deku.DOM.Elt.H2
, module Deku.DOM.Elt.H3
, module Deku.DOM.Elt.H4
, module Deku.DOM.Elt.H5
, module Deku.DOM.Elt.H6
, module Deku.DOM.Elt.Head
, module Deku.DOM.Elt.Header
, module Deku.DOM.Elt.Hr
, module Deku.DOM.Elt.Html
, module Deku.DOM.Elt.I
, module Deku.DOM.Elt.Iframe
, module Deku.DOM.Elt.Img
, module Deku.DOM.Elt.Input
, module Deku.DOM.Elt.Ins
, module Deku.DOM.Elt.Kbd
, module Deku.DOM.Elt.Label
, module Deku.DOM.Elt.Legend
, module Deku.DOM.Elt.Li
, module Deku.DOM.Elt.Link
, module Deku.DOM.Elt.Main
, module Deku.DOM.Elt.Map
, module Deku.DOM.Elt.Mark
, module Deku.DOM.Elt.Meta
, module Deku.DOM.Elt.Meter
, module Deku.DOM.Elt.Nav
, module Deku.DOM.Elt.Noframes
, module Deku.DOM.Elt.Noscript
, module Deku.DOM.Elt.Object
, module Deku.DOM.Elt.Ol
, module Deku.DOM.Elt.Optgroup
, module Deku.DOM.Elt.Option
, module Deku.DOM.Elt.Output
, module Deku.DOM.Elt.P
, module Deku.DOM.Elt.Param
, module Deku.DOM.Elt.Picture
, module Deku.DOM.Elt.Pre
, module Deku.DOM.Elt.Progress
, module Deku.DOM.Elt.Q
, module Deku.DOM.Elt.Rp
, module Deku.DOM.Elt.Rt
, module Deku.DOM.Elt.Ruby
, module Deku.DOM.Elt.S
, module Deku.DOM.Elt.Samp
, module Deku.DOM.Elt.Script
, module Deku.DOM.Elt.Section
, module Deku.DOM.Elt.Select
, module Deku.DOM.Elt.Small
, module Deku.DOM.Elt.Source
, module Deku.DOM.Elt.Span
, module Deku.DOM.Elt.Strike
, module Deku.DOM.Elt.Strong
, module Deku.DOM.Elt.Style
, module Deku.DOM.Elt.Sub
, module Deku.DOM.Elt.Summary
, module Deku.DOM.Elt.Sup
, module Deku.DOM.Elt.Svg
, module Deku.DOM.Elt.Table
, module Deku.DOM.Elt.Tbody
, module Deku.DOM.Elt.Td
, module Deku.DOM.Elt.Template
, module Deku.DOM.Elt.Textarea
, module Deku.DOM.Elt.Tfoot
, module Deku.DOM.Elt.Th
, module Deku.DOM.Elt.Thead
, module Deku.DOM.Elt.Time
, module Deku.DOM.Elt.Title
, module Deku.DOM.Elt.Tr
, module Deku.DOM.Elt.Track
, module Deku.DOM.Elt.Tt
, module Deku.DOM.Elt.U
, module Deku.DOM.Elt.Ul
, module Deku.DOM.Elt.Var
, module Deku.DOM.Elt.Video
, module Deku.DOM.Elt.Wbr
  -- codegen 0
  ) where

import Deku.Attribute

-- codegen 9
import Deku.DOM.Attr.Accept(Accept(..))
import Deku.DOM.Attr.AcceptCharset(AcceptCharset(..))
import Deku.DOM.Attr.Accesskey(Accesskey(..))
import Deku.DOM.Attr.Action(Action(..))
import Deku.DOM.Attr.Align(Align(..))
import Deku.DOM.Attr.Allow(Allow(..))
import Deku.DOM.Attr.Alt(Alt(..))
import Deku.DOM.Attr.Async(Async(..))
import Deku.DOM.Attr.Autocapitalize(Autocapitalize(..))
import Deku.DOM.Attr.Autocomplete(Autocomplete(..))
import Deku.DOM.Attr.Autofocus(Autofocus(..))
import Deku.DOM.Attr.Autoplay(Autoplay(..))
import Deku.DOM.Attr.Background(Background(..))
import Deku.DOM.Attr.Bgcolor(Bgcolor(..))
import Deku.DOM.Attr.Border(Border(..))
import Deku.DOM.Attr.Buffered(Buffered(..))
import Deku.DOM.Attr.Capture(Capture(..))
import Deku.DOM.Attr.Challenge(Challenge(..))
import Deku.DOM.Attr.Charset(Charset(..))
import Deku.DOM.Attr.Checked(Checked(..))
import Deku.DOM.Attr.Cite(Cite(..))
import Deku.DOM.Attr.Class(Class(..))
import Deku.DOM.Attr.Code(Code(..))
import Deku.DOM.Attr.Codebase(Codebase(..))
import Deku.DOM.Attr.Color(Color(..))
import Deku.DOM.Attr.Cols(Cols(..))
import Deku.DOM.Attr.Colspan(Colspan(..))
import Deku.DOM.Attr.Content(Content(..))
import Deku.DOM.Attr.Contenteditable(Contenteditable(..))
import Deku.DOM.Attr.Contextmenu(Contextmenu(..))
import Deku.DOM.Attr.Controls(Controls(..))
import Deku.DOM.Attr.Coords(Coords(..))
import Deku.DOM.Attr.Crossorigin(Crossorigin(..))
import Deku.DOM.Attr.Csp(Csp(..))
import Deku.DOM.Attr.Data(Data(..))
import Deku.DOM.Attr.Datetime(Datetime(..))
import Deku.DOM.Attr.Decoding(Decoding(..))
import Deku.DOM.Attr.Default(Default(..))
import Deku.DOM.Attr.Defer(Defer(..))
import Deku.DOM.Attr.Dir(Dir(..))
import Deku.DOM.Attr.Dirname(Dirname(..))
import Deku.DOM.Attr.Disabled(Disabled(..))
import Deku.DOM.Attr.Download(Download(..))
import Deku.DOM.Attr.Draggable(Draggable(..))
import Deku.DOM.Attr.Enctype(Enctype(..))
import Deku.DOM.Attr.Enterkeyhint(Enterkeyhint(..))
import Deku.DOM.Attr.For(For(..))
import Deku.DOM.Attr.Form(Form(..))
import Deku.DOM.Attr.Formaction(Formaction(..))
import Deku.DOM.Attr.Formenctype(Formenctype(..))
import Deku.DOM.Attr.Formmethod(Formmethod(..))
import Deku.DOM.Attr.Formnovalidate(Formnovalidate(..))
import Deku.DOM.Attr.Formtarget(Formtarget(..))
import Deku.DOM.Attr.Headers(Headers(..))
import Deku.DOM.Attr.Height(Height(..))
import Deku.DOM.Attr.Hidden(Hidden(..))
import Deku.DOM.Attr.High(High(..))
import Deku.DOM.Attr.Href(Href(..))
import Deku.DOM.Attr.Hreflang(Hreflang(..))
import Deku.DOM.Attr.HttpEquiv(HttpEquiv(..))
import Deku.DOM.Attr.Icon(Icon(..))
import Deku.DOM.Attr.Id(Id(..))
import Deku.DOM.Attr.Importance(Importance(..))
import Deku.DOM.Attr.Integrity(Integrity(..))
import Deku.DOM.Attr.Intrinsicsize(Intrinsicsize(..))
import Deku.DOM.Attr.Inputmode(Inputmode(..))
import Deku.DOM.Attr.Ismap(Ismap(..))
import Deku.DOM.Attr.Itemprop(Itemprop(..))
import Deku.DOM.Attr.Keytype(Keytype(..))
import Deku.DOM.Attr.Kind(Kind(..))
import Deku.DOM.Attr.Label(Label(..))
import Deku.DOM.Attr.Lang(Lang(..))
import Deku.DOM.Attr.Language(Language(..))
import Deku.DOM.Attr.Loading (Loading (..))
import Deku.DOM.Attr.List(List(..))
import Deku.DOM.Attr.Loop(Loop(..))
import Deku.DOM.Attr.Low(Low(..))
import Deku.DOM.Attr.Manifest(Manifest(..))
import Deku.DOM.Attr.Max(Max(..))
import Deku.DOM.Attr.Maxlength(Maxlength(..))
import Deku.DOM.Attr.Minlength(Minlength(..))
import Deku.DOM.Attr.Media(Media(..))
import Deku.DOM.Attr.Method(Method(..))
import Deku.DOM.Attr.Min(Min(..))
import Deku.DOM.Attr.Multiple(Multiple(..))
import Deku.DOM.Attr.Muted(Muted(..))
import Deku.DOM.Attr.Name(Name(..))
import Deku.DOM.Attr.Novalidate(Novalidate(..))
import Deku.DOM.Attr.Open(Open(..))
import Deku.DOM.Attr.Optimum(Optimum(..))
import Deku.DOM.Attr.Pattern(Pattern(..))
import Deku.DOM.Attr.Ping(Ping(..))
import Deku.DOM.Attr.Placeholder(Placeholder(..))
import Deku.DOM.Attr.Poster(Poster(..))
import Deku.DOM.Attr.Preload(Preload(..))
import Deku.DOM.Attr.Radiogroup(Radiogroup(..))
import Deku.DOM.Attr.Readonly(Readonly(..))
import Deku.DOM.Attr.Referrerpolicy(Referrerpolicy(..))
import Deku.DOM.Attr.Rel(Rel(..))
import Deku.DOM.Attr.Required(Required(..))
import Deku.DOM.Attr.Reversed(Reversed(..))
import Deku.DOM.Attr.Role(Role(..))
import Deku.DOM.Attr.Rows(Rows(..))
import Deku.DOM.Attr.Rowspan(Rowspan(..))
import Deku.DOM.Attr.Sandbox(Sandbox(..))
import Deku.DOM.Attr.Scope(Scope(..))
import Deku.DOM.Attr.Scoped(Scoped(..))
import Deku.DOM.Attr.Selected(Selected(..))
import Deku.DOM.Attr.Shape(Shape(..))
import Deku.DOM.Attr.Size(Size(..))
import Deku.DOM.Attr.Sizes(Sizes(..))
import Deku.DOM.Attr.Slot(Slot(..))
import Deku.DOM.Attr.Span(Span(..))
import Deku.DOM.Attr.Spellcheck(Spellcheck(..))
import Deku.DOM.Attr.Src(Src(..))
import Deku.DOM.Attr.Srcdoc(Srcdoc(..))
import Deku.DOM.Attr.Srclang(Srclang(..))
import Deku.DOM.Attr.Srcset(Srcset(..))
import Deku.DOM.Attr.Start(Start(..))
import Deku.DOM.Attr.Step(Step(..))
import Deku.DOM.Attr.Style(Style(..))
import Deku.DOM.Attr.Summary(Summary(..))
import Deku.DOM.Attr.Tabindex(Tabindex(..))
import Deku.DOM.Attr.Target(Target(..))
import Deku.DOM.Attr.Title(Title(..))
import Deku.DOM.Attr.Translate(Translate(..))
import Deku.DOM.Attr.Usemap(Usemap(..))
import Deku.DOM.Attr.Value(Value(..))
import Deku.DOM.Attr.Width(Width(..))
import Deku.DOM.Attr.Xtype(Xtype(..))
import Deku.DOM.Attr.OnAbort(OnAbort(..))
import Deku.DOM.Attr.OnAnimationcancel (OnAnimationcancel (..))
import Deku.DOM.Attr.OnAnimationend (OnAnimationend (..))
import Deku.DOM.Attr.OnAnimationiteration (OnAnimationiteration (..))
import Deku.DOM.Attr.OnAnimationstart (OnAnimationstart (..))
import Deku.DOM.Attr.OnAuxclick (OnAuxclick (..))
import Deku.DOM.Attr.OnBlur(OnBlur(..))
import Deku.DOM.Attr.OnError(OnError(..))
import Deku.DOM.Attr.OnFocus(OnFocus(..))
import Deku.DOM.Attr.OnCancel(OnCancel(..))
import Deku.DOM.Attr.OnCanplay(OnCanplay(..))
import Deku.DOM.Attr.OnCanplaythrough(OnCanplaythrough(..))
import Deku.DOM.Attr.OnChange(OnChange(..))
import Deku.DOM.Attr.OnClick(OnClick(..))
import Deku.DOM.Attr.OnClose(OnClose(..))
import Deku.DOM.Attr.OnContextmenu(OnContextmenu(..))
import Deku.DOM.Attr.OnDblclick(OnDblclick(..))
import Deku.DOM.Attr.OnDrag(OnDrag(..))
import Deku.DOM.Attr.OnDragend(OnDragend(..))
import Deku.DOM.Attr.OnDragenter(OnDragenter(..))
import Deku.DOM.Attr.OnDragleave(OnDragleave(..))
import Deku.DOM.Attr.OnDragover(OnDragover(..))
import Deku.DOM.Attr.OnDragstart(OnDragstart(..))
import Deku.DOM.Attr.OnDrop(OnDrop(..))
import Deku.DOM.Attr.OnDurationchange(OnDurationchange(..))
import Deku.DOM.Attr.OnEmptied(OnEmptied(..))
import Deku.DOM.Attr.OnEnded(OnEnded(..))
import Deku.DOM.Attr.OnFormdata(OnFormdata(..))
import Deku.DOM.Attr.OnGotpointercapture(OnGotpointercapture(..))
import Deku.DOM.Attr.OnInput(OnInput(..))
import Deku.DOM.Attr.OnInvalid(OnInvalid(..))
import Deku.DOM.Attr.OnKeydown(OnKeydown(..))
import Deku.DOM.Attr.OnKeypress(OnKeypress(..))
import Deku.DOM.Attr.OnKeyup(OnKeyup(..))
import Deku.DOM.Attr.OnLoad(OnLoad(..))
import Deku.DOM.Attr.OnLoadeddata(OnLoadeddata(..))
import Deku.DOM.Attr.OnLoadedmetadata(OnLoadedmetadata(..))
import Deku.DOM.Attr.OnLoadend(OnLoadend(..))
import Deku.DOM.Attr.OnLoadstart(OnLoadstart(..))
import Deku.DOM.Attr.OnLostpointercapture(OnLostpointercapture(..))
import Deku.DOM.Attr.OnMousedown(OnMousedown(..))
import Deku.DOM.Attr.OnMouseenter(OnMouseenter(..))
import Deku.DOM.Attr.OnMouseleave(OnMouseleave(..))
import Deku.DOM.Attr.OnMousemove(OnMousemove(..))
import Deku.DOM.Attr.OnMouseout(OnMouseout(..))
import Deku.DOM.Attr.OnMouseover(OnMouseover(..))
import Deku.DOM.Attr.OnMouseup(OnMouseup(..))
import Deku.DOM.Attr.OnMousewheel  (OnMousewheel  (..))
import Deku.DOM.Attr.OnWheel(OnWheel(..))
import Deku.DOM.Attr.OnPause(OnPause(..))
import Deku.DOM.Attr.OnPlay(OnPlay(..))
import Deku.DOM.Attr.OnPlaying(OnPlaying(..))
import Deku.DOM.Attr.OnPointerdown(OnPointerdown(..))
import Deku.DOM.Attr.OnPointermove(OnPointermove(..))
import Deku.DOM.Attr.OnPointerup(OnPointerup(..))
import Deku.DOM.Attr.OnPointercancel(OnPointercancel(..))
import Deku.DOM.Attr.OnPointerover(OnPointerover(..))
import Deku.DOM.Attr.OnPointerout(OnPointerout(..))
import Deku.DOM.Attr.OnPointerenter(OnPointerenter(..))
import Deku.DOM.Attr.OnPointerleave(OnPointerleave(..))
import Deku.DOM.Attr.OnPointerlockchange (OnPointerlockchange (..))
import Deku.DOM.Attr.OnPointerlockerror (OnPointerlockerror (..))
import Deku.DOM.Attr.OnProgress(OnProgress(..))
import Deku.DOM.Attr.OnRatechange(OnRatechange(..))
import Deku.DOM.Attr.OnReset(OnReset(..))
import Deku.DOM.Attr.OnResize(OnResize(..))
import Deku.DOM.Attr.OnScroll(OnScroll(..))
import Deku.DOM.Attr.OnSecuritypolicyviolation(OnSecuritypolicyviolation(..))
import Deku.DOM.Attr.OnSeeked(OnSeeked(..))
import Deku.DOM.Attr.OnSeeking(OnSeeking(..))
import Deku.DOM.Attr.OnSelect(OnSelect(..))
import Deku.DOM.Attr.OnSelectstart(OnSelectstart(..))
import Deku.DOM.Attr.OnSelectionchange(OnSelectionchange(..))
import Deku.DOM.Attr.OnShow (OnShow (..))
import Deku.DOM.Attr.OnSlotchange(OnSlotchange(..))
import Deku.DOM.Attr.OnStalled(OnStalled(..))
import Deku.DOM.Attr.OnSubmit(OnSubmit(..))
import Deku.DOM.Attr.OnSuspend(OnSuspend(..))
import Deku.DOM.Attr.OnTimeupdate(OnTimeupdate(..))
import Deku.DOM.Attr.OnVolumechange(OnVolumechange(..))
import Deku.DOM.Attr.OnTouchcancel  (OnTouchcancel  (..))
import Deku.DOM.Attr.OnTouchend  (OnTouchend  (..))
import Deku.DOM.Attr.OnTouchmove  (OnTouchmove  (..))
import Deku.DOM.Attr.OnTouchstart  (OnTouchstart  (..))
import Deku.DOM.Attr.OnTransitioncancel(OnTransitioncancel(..))
import Deku.DOM.Attr.OnTransitionend(OnTransitionend(..))
import Deku.DOM.Attr.OnTransitionrun(OnTransitionrun(..))
import Deku.DOM.Attr.OnTransitionstart(OnTransitionstart(..))
import Deku.DOM.Attr.OnWaiting(OnWaiting(..))
-- codegen 9
-- codegen 2
import Deku.DOM.Elt.A(A_, a, a_)
import Deku.DOM.Elt.Abbr(Abbr_, abbr, abbr_)
import Deku.DOM.Elt.Acronym(Acronym_, acronym, acronym_)
import Deku.DOM.Elt.Address(Address_, address, address_)
import Deku.DOM.Elt.Applet(Applet_, applet, applet_)
import Deku.DOM.Elt.Area(Area_, area, area_)
import Deku.DOM.Elt.Article(Article_, article, article_)
import Deku.DOM.Elt.Aside(Aside_, aside, aside_)
import Deku.DOM.Elt.Audio(Audio_, audio, audio_)
import Deku.DOM.Elt.B(B_, b, b_)
import Deku.DOM.Elt.Base(Base_, base, base_)
import Deku.DOM.Elt.Basefont(Basefont_, basefont, basefont_)
import Deku.DOM.Elt.Bdi(Bdi_, bdi, bdi_)
import Deku.DOM.Elt.Bdo(Bdo_, bdo, bdo_)
import Deku.DOM.Elt.Big(Big_, big, big_)
import Deku.DOM.Elt.Blockquote(Blockquote_, blockquote, blockquote_)
import Deku.DOM.Elt.Body(Body_, body, body_)
import Deku.DOM.Elt.Br(Br_, br, br_)
import Deku.DOM.Elt.Button(Button_, button, button_)
import Deku.DOM.Elt.Canvas(Canvas_, canvas, canvas_)
import Deku.DOM.Elt.Caption(Caption_, caption, caption_)
import Deku.DOM.Elt.Center(Center_, center, center_)
import Deku.DOM.Elt.Cite(Cite_, cite, cite_)
import Deku.DOM.Elt.Code(Code_, code, code_)
import Deku.DOM.Elt.Col(Col_, col, col_)
import Deku.DOM.Elt.Colgroup(Colgroup_, colgroup, colgroup_)
import Deku.DOM.Elt.Xdata(Xdata_, xdata, xdata_)
import Deku.DOM.Elt.Datalist(Datalist_, datalist, datalist_)
import Deku.DOM.Elt.Dd(Dd_, dd, dd_)
import Deku.DOM.Elt.Del(Del_, del, del_)
import Deku.DOM.Elt.Details(Details_, details, details_)
import Deku.DOM.Elt.Dfn(Dfn_, dfn, dfn_)
import Deku.DOM.Elt.Dialog(Dialog_, dialog, dialog_)
import Deku.DOM.Elt.Dir(Dir_, dir, dir_)
import Deku.DOM.Elt.Div(Div_, div, div_)
import Deku.DOM.Elt.Dl(Dl_, dl, dl_)
import Deku.DOM.Elt.Dt(Dt_, dt, dt_)
import Deku.DOM.Elt.Em(Em_, em, em_)
import Deku.DOM.Elt.Embed(Embed_, embed, embed_)
import Deku.DOM.Elt.Fieldset(Fieldset_, fieldset, fieldset_)
import Deku.DOM.Elt.Figcaption(Figcaption_, figcaption, figcaption_)
import Deku.DOM.Elt.Figure(Figure_, figure, figure_)
import Deku.DOM.Elt.Font(Font_, font, font_)
import Deku.DOM.Elt.Footer(Footer_, footer, footer_)
import Deku.DOM.Elt.Form(Form_, form, form_)
import Deku.DOM.Elt.Frame(Frame_, frame, frame_)
import Deku.DOM.Elt.Frameset(Frameset_, frameset, frameset_)
import Deku.DOM.Elt.H1(H1_, h1, h1_)
import Deku.DOM.Elt.H2(H2_, h2, h2_)
import Deku.DOM.Elt.H3(H3_, h3, h3_)
import Deku.DOM.Elt.H4(H4_, h4, h4_)
import Deku.DOM.Elt.H5(H5_, h5, h5_)
import Deku.DOM.Elt.H6(H6_, h6, h6_)
import Deku.DOM.Elt.Head(Head_, head, head_)
import Deku.DOM.Elt.Header(Header_, header, header_)
import Deku.DOM.Elt.Hr(Hr_, hr, hr_)
import Deku.DOM.Elt.Html(Html_, html, html_)
import Deku.DOM.Elt.I(I_, i, i_)
import Deku.DOM.Elt.Iframe(Iframe_, iframe, iframe_)
import Deku.DOM.Elt.Img(Img_, img, img_)
import Deku.DOM.Elt.Input(Input_, input, input_)
import Deku.DOM.Elt.Ins(Ins_, ins, ins_)
import Deku.DOM.Elt.Kbd(Kbd_, kbd, kbd_)
import Deku.DOM.Elt.Label(Label_, label, label_)
import Deku.DOM.Elt.Legend(Legend_, legend, legend_)
import Deku.DOM.Elt.Li(Li_, li, li_)
import Deku.DOM.Elt.Link(Link_, link, link_)
import Deku.DOM.Elt.Main(Main_, main, main_)
import Deku.DOM.Elt.Map(Map_, map, map_)
import Deku.DOM.Elt.Mark(Mark_, mark, mark_)
import Deku.DOM.Elt.Meta(Meta_, meta, meta_)
import Deku.DOM.Elt.Meter(Meter_, meter, meter_)
import Deku.DOM.Elt.Nav(Nav_, nav, nav_)
import Deku.DOM.Elt.Noframes(Noframes_, noframes, noframes_)
import Deku.DOM.Elt.Noscript(Noscript_, noscript, noscript_)
import Deku.DOM.Elt.Object(Object_, object, object_)
import Deku.DOM.Elt.Ol(Ol_, ol, ol_)
import Deku.DOM.Elt.Optgroup(Optgroup_, optgroup, optgroup_)
import Deku.DOM.Elt.Option(Option_, option, option_)
import Deku.DOM.Elt.Output(Output_, output, output_)
import Deku.DOM.Elt.P(P_, p, p_)
import Deku.DOM.Elt.Param(Param_, param, param_)
import Deku.DOM.Elt.Picture(Picture_, picture, picture_)
import Deku.DOM.Elt.Pre(Pre_, pre, pre_)
import Deku.DOM.Elt.Progress(Progress_, progress, progress_)
import Deku.DOM.Elt.Q(Q_, q, q_)
import Deku.DOM.Elt.Rp(Rp_, rp, rp_)
import Deku.DOM.Elt.Rt(Rt_, rt, rt_)
import Deku.DOM.Elt.Ruby(Ruby_, ruby, ruby_)
import Deku.DOM.Elt.S(S_, s, s_)
import Deku.DOM.Elt.Samp(Samp_, samp, samp_)
import Deku.DOM.Elt.Script(Script_, script, script_)
import Deku.DOM.Elt.Section(Section_, section, section_)
import Deku.DOM.Elt.Select(Select_, select, select_)
import Deku.DOM.Elt.Small(Small_, small, small_)
import Deku.DOM.Elt.Source(Source_, source, source_)
import Deku.DOM.Elt.Span(Span_, span, span_)
import Deku.DOM.Elt.Strike(Strike_, strike, strike_)
import Deku.DOM.Elt.Strong(Strong_, strong, strong_)
import Deku.DOM.Elt.Style(Style_, style, style_)
import Deku.DOM.Elt.Sub(Sub_, sub, sub_)
import Deku.DOM.Elt.Summary(Summary_, summary, summary_)
import Deku.DOM.Elt.Sup(Sup_, sup, sup_)
import Deku.DOM.Elt.Svg(Svg_, svg, svg_)
import Deku.DOM.Elt.Table(Table_, table, table_)
import Deku.DOM.Elt.Tbody(Tbody_, tbody, tbody_)
import Deku.DOM.Elt.Td(Td_, td, td_)
import Deku.DOM.Elt.Template(Template_, template, template_)
import Deku.DOM.Elt.Textarea(Textarea_, textarea, textarea_)
import Deku.DOM.Elt.Tfoot(Tfoot_, tfoot, tfoot_)
import Deku.DOM.Elt.Th(Th_, th, th_)
import Deku.DOM.Elt.Thead(Thead_, thead, thead_)
import Deku.DOM.Elt.Time(Time_, time, time_)
import Deku.DOM.Elt.Title(Title_, title, title_)
import Deku.DOM.Elt.Tr(Tr_, tr, tr_)
import Deku.DOM.Elt.Track(Track_, track, track_)
import Deku.DOM.Elt.Tt(Tt_, tt, tt_)
import Deku.DOM.Elt.U(U_, u, u_)
import Deku.DOM.Elt.Ul(Ul_, ul, ul_)
import Deku.DOM.Elt.Var(Var_, var, var_)
import Deku.DOM.Elt.Video(Video_, video, video_)
import Deku.DOM.Elt.Wbr(Wbr_, wbr, wbr_)
-- codegen 2
import Effect (Effect)
import Prelude (Unit)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM as DOM

class TagToDeku (tag :: Symbol) (deku :: Type) | tag -> deku

-- codegen 3
instance tagToDekuA_ :: TagToDeku "a" A_
instance tagToDekuAbbr_ :: TagToDeku "abbr" Abbr_
instance tagToDekuAcronym_ :: TagToDeku "acronym" Acronym_
instance tagToDekuAddress_ :: TagToDeku "address" Address_
instance tagToDekuApplet_ :: TagToDeku "applet" Applet_
instance tagToDekuArea_ :: TagToDeku "area" Area_
instance tagToDekuArticle_ :: TagToDeku "article" Article_
instance tagToDekuAside_ :: TagToDeku "aside" Aside_
instance tagToDekuAudio_ :: TagToDeku "audio" Audio_
instance tagToDekuB_ :: TagToDeku "b" B_
instance tagToDekuBase_ :: TagToDeku "base" Base_
instance tagToDekuBasefont_ :: TagToDeku "basefont" Basefont_
instance tagToDekuBdi_ :: TagToDeku "bdi" Bdi_
instance tagToDekuBdo_ :: TagToDeku "bdo" Bdo_
instance tagToDekuBig_ :: TagToDeku "big" Big_
instance tagToDekuBlockquote_ :: TagToDeku "blockquote" Blockquote_
instance tagToDekuBody_ :: TagToDeku "body" Body_
instance tagToDekuBr_ :: TagToDeku "br" Br_
instance tagToDekuButton_ :: TagToDeku "button" Button_
instance tagToDekuCanvas_ :: TagToDeku "canvas" Canvas_
instance tagToDekuCaption_ :: TagToDeku "caption" Caption_
instance tagToDekuCenter_ :: TagToDeku "center" Center_
instance tagToDekuCite_ :: TagToDeku "cite" Cite_
instance tagToDekuCode_ :: TagToDeku "code" Code_
instance tagToDekuCol_ :: TagToDeku "col" Col_
instance tagToDekuColgroup_ :: TagToDeku "colgroup" Colgroup_
instance tagToDekuXdata_ :: TagToDeku "data" Xdata_
instance tagToDekuDatalist_ :: TagToDeku "datalist" Datalist_
instance tagToDekuDd_ :: TagToDeku "dd" Dd_
instance tagToDekuDel_ :: TagToDeku "del" Del_
instance tagToDekuDetails_ :: TagToDeku "details" Details_
instance tagToDekuDfn_ :: TagToDeku "dfn" Dfn_
instance tagToDekuDialog_ :: TagToDeku "dialog" Dialog_
instance tagToDekuDir_ :: TagToDeku "dir" Dir_
instance tagToDekuDiv_ :: TagToDeku "div" Div_
instance tagToDekuDl_ :: TagToDeku "dl" Dl_
instance tagToDekuDt_ :: TagToDeku "dt" Dt_
instance tagToDekuEm_ :: TagToDeku "em" Em_
instance tagToDekuEmbed_ :: TagToDeku "embed" Embed_
instance tagToDekuFieldset_ :: TagToDeku "fieldset" Fieldset_
instance tagToDekuFigcaption_ :: TagToDeku "figcaption" Figcaption_
instance tagToDekuFigure_ :: TagToDeku "figure" Figure_
instance tagToDekuFont_ :: TagToDeku "font" Font_
instance tagToDekuFooter_ :: TagToDeku "footer" Footer_
instance tagToDekuForm_ :: TagToDeku "form" Form_
instance tagToDekuFrame_ :: TagToDeku "frame" Frame_
instance tagToDekuFrameset_ :: TagToDeku "frameset" Frameset_
instance tagToDekuH1_ :: TagToDeku "h1" H1_
instance tagToDekuH2_ :: TagToDeku "h2" H2_
instance tagToDekuH3_ :: TagToDeku "h3" H3_
instance tagToDekuH4_ :: TagToDeku "h4" H4_
instance tagToDekuH5_ :: TagToDeku "h5" H5_
instance tagToDekuH6_ :: TagToDeku "h6" H6_
instance tagToDekuHead_ :: TagToDeku "head" Head_
instance tagToDekuHeader_ :: TagToDeku "header" Header_
instance tagToDekuHr_ :: TagToDeku "hr" Hr_
instance tagToDekuHtml_ :: TagToDeku "html" Html_
instance tagToDekuI_ :: TagToDeku "i" I_
instance tagToDekuIframe_ :: TagToDeku "iframe" Iframe_
instance tagToDekuImg_ :: TagToDeku "img" Img_
instance tagToDekuInput_ :: TagToDeku "input" Input_
instance tagToDekuIns_ :: TagToDeku "ins" Ins_
instance tagToDekuKbd_ :: TagToDeku "kbd" Kbd_
instance tagToDekuLabel_ :: TagToDeku "label" Label_
instance tagToDekuLegend_ :: TagToDeku "legend" Legend_
instance tagToDekuLi_ :: TagToDeku "li" Li_
instance tagToDekuLink_ :: TagToDeku "link" Link_
instance tagToDekuMain_ :: TagToDeku "main" Main_
instance tagToDekuMap_ :: TagToDeku "map" Map_
instance tagToDekuMark_ :: TagToDeku "mark" Mark_
instance tagToDekuMeta_ :: TagToDeku "meta" Meta_
instance tagToDekuMeter_ :: TagToDeku "meter" Meter_
instance tagToDekuNav_ :: TagToDeku "nav" Nav_
instance tagToDekuNoframes_ :: TagToDeku "noframes" Noframes_
instance tagToDekuNoscript_ :: TagToDeku "noscript" Noscript_
instance tagToDekuObject_ :: TagToDeku "object" Object_
instance tagToDekuOl_ :: TagToDeku "ol" Ol_
instance tagToDekuOptgroup_ :: TagToDeku "optgroup" Optgroup_
instance tagToDekuOption_ :: TagToDeku "option" Option_
instance tagToDekuOutput_ :: TagToDeku "output" Output_
instance tagToDekuP_ :: TagToDeku "p" P_
instance tagToDekuParam_ :: TagToDeku "param" Param_
instance tagToDekuPicture_ :: TagToDeku "picture" Picture_
instance tagToDekuPre_ :: TagToDeku "pre" Pre_
instance tagToDekuProgress_ :: TagToDeku "progress" Progress_
instance tagToDekuQ_ :: TagToDeku "q" Q_
instance tagToDekuRp_ :: TagToDeku "rp" Rp_
instance tagToDekuRt_ :: TagToDeku "rt" Rt_
instance tagToDekuRuby_ :: TagToDeku "ruby" Ruby_
instance tagToDekuS_ :: TagToDeku "s" S_
instance tagToDekuSamp_ :: TagToDeku "samp" Samp_
instance tagToDekuScript_ :: TagToDeku "script" Script_
instance tagToDekuSection_ :: TagToDeku "section" Section_
instance tagToDekuSelect_ :: TagToDeku "select" Select_
instance tagToDekuSmall_ :: TagToDeku "small" Small_
instance tagToDekuSource_ :: TagToDeku "source" Source_
instance tagToDekuSpan_ :: TagToDeku "span" Span_
instance tagToDekuStrike_ :: TagToDeku "strike" Strike_
instance tagToDekuStrong_ :: TagToDeku "strong" Strong_
instance tagToDekuStyle_ :: TagToDeku "style" Style_
instance tagToDekuSub_ :: TagToDeku "sub" Sub_
instance tagToDekuSummary_ :: TagToDeku "summary" Summary_
instance tagToDekuSup_ :: TagToDeku "sup" Sup_
instance tagToDekuSvg_ :: TagToDeku "svg" Svg_
instance tagToDekuTable_ :: TagToDeku "table" Table_
instance tagToDekuTbody_ :: TagToDeku "tbody" Tbody_
instance tagToDekuTd_ :: TagToDeku "td" Td_
instance tagToDekuTemplate_ :: TagToDeku "template" Template_
instance tagToDekuTextarea_ :: TagToDeku "textarea" Textarea_
instance tagToDekuTfoot_ :: TagToDeku "tfoot" Tfoot_
instance tagToDekuTh_ :: TagToDeku "th" Th_
instance tagToDekuThead_ :: TagToDeku "thead" Thead_
instance tagToDekuTime_ :: TagToDeku "time" Time_
instance tagToDekuTitle_ :: TagToDeku "title" Title_
instance tagToDekuTr_ :: TagToDeku "tr" Tr_
instance tagToDekuTrack_ :: TagToDeku "track" Track_
instance tagToDekuTt_ :: TagToDeku "tt" Tt_
instance tagToDekuU_ :: TagToDeku "u" U_
instance tagToDekuUl_ :: TagToDeku "ul" Ul_
instance tagToDekuVar_ :: TagToDeku "var" Var_
instance tagToDekuVideo_ :: TagToDeku "video" Video_
instance tagToDekuWbr_ :: TagToDeku "wbr" Wbr_
-- codegen 3

-- we can always refer to ourself
data Self = Self

instance Attr anything Self (DOM.Element -> Effect Unit) where
  attr Self value = unsafeAttribute
    { key: "@self@", value: cb' (Cb (unsafeCoerce value)) }