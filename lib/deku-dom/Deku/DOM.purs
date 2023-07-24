-- | This large, unwieldy module contains reexports of all the DOM elements plus a few extra functions
-- | for working with the DOM. It just documents the esoteric bits, namely `Self`, `SelfT`, and `unsafeCustomElement`.
module Deku.DOM
  ( module Deku.DOM.Elt.Html
  , module Deku.DOM.Elt.Head
  , module Deku.DOM.Elt.Title
  , module Deku.DOM.Elt.Base
  , module Deku.DOM.Elt.Link
  , module Deku.DOM.Elt.Meta
  , module Deku.DOM.Elt.Style
  , module Deku.DOM.Elt.Body
  , module Deku.DOM.Elt.Article
  , module Deku.DOM.Elt.Section
  , module Deku.DOM.Elt.Nav
  , module Deku.DOM.Elt.Aside
  , module Deku.DOM.Elt.H1
  , module Deku.DOM.Elt.H2
  , module Deku.DOM.Elt.H3
  , module Deku.DOM.Elt.H4
  , module Deku.DOM.Elt.H5
  , module Deku.DOM.Elt.H6
  , module Deku.DOM.Elt.Hgroup
  , module Deku.DOM.Elt.Header
  , module Deku.DOM.Elt.Footer
  , module Deku.DOM.Elt.Address
  , module Deku.DOM.Elt.P
  , module Deku.DOM.Elt.Hr
  , module Deku.DOM.Elt.Pre
  , module Deku.DOM.Elt.Blockquote
  , module Deku.DOM.Elt.Ol
  , module Deku.DOM.Elt.Ul
  , module Deku.DOM.Elt.Menu
  , module Deku.DOM.Elt.Li
  , module Deku.DOM.Elt.Dl
  , module Deku.DOM.Elt.Dt
  , module Deku.DOM.Elt.Dd
  , module Deku.DOM.Elt.Figure
  , module Deku.DOM.Elt.Figcaption
  , module Deku.DOM.Elt.Main
  , module Deku.DOM.Elt.Search
  , module Deku.DOM.Elt.Div
  , module Deku.DOM.Elt.A
  , module Deku.DOM.Elt.Em
  , module Deku.DOM.Elt.Strong
  , module Deku.DOM.Elt.Small
  , module Deku.DOM.Elt.S
  , module Deku.DOM.Elt.Cite
  , module Deku.DOM.Elt.Q
  , module Deku.DOM.Elt.Dfn
  , module Deku.DOM.Elt.Abbr
  , module Deku.DOM.Elt.Ruby
  , module Deku.DOM.Elt.Rt
  , module Deku.DOM.Elt.Rp
  , module Deku.DOM.Elt.Xdata
  , module Deku.DOM.Elt.Time
  , module Deku.DOM.Elt.Code
  , module Deku.DOM.Elt.Var
  , module Deku.DOM.Elt.Samp
  , module Deku.DOM.Elt.Kbd
  , module Deku.DOM.Elt.Sub
  , module Deku.DOM.Elt.Sup
  , module Deku.DOM.Elt.I
  , module Deku.DOM.Elt.B
  , module Deku.DOM.Elt.U
  , module Deku.DOM.Elt.Mark
  , module Deku.DOM.Elt.Bdi
  , module Deku.DOM.Elt.Bdo
  , module Deku.DOM.Elt.Span
  , module Deku.DOM.Elt.Br
  , module Deku.DOM.Elt.Wbr
  , module Deku.DOM.Elt.Ins
  , module Deku.DOM.Elt.Del
  , module Deku.DOM.Elt.Picture
  , module Deku.DOM.Elt.Source
  , module Deku.DOM.Elt.Img
  , module Deku.DOM.Elt.Iframe
  , module Deku.DOM.Elt.Embed
  , module Deku.DOM.Elt.Object
  , module Deku.DOM.Elt.Video
  , module Deku.DOM.Elt.Audio
  , module Deku.DOM.Elt.Track
  , module Deku.DOM.Elt.Map
  , module Deku.DOM.Elt.Area
  , module Deku.DOM.Elt.Table
  , module Deku.DOM.Elt.Caption
  , module Deku.DOM.Elt.Colgroup
  , module Deku.DOM.Elt.Col
  , module Deku.DOM.Elt.Tbody
  , module Deku.DOM.Elt.Thead
  , module Deku.DOM.Elt.Tfoot
  , module Deku.DOM.Elt.Tr
  , module Deku.DOM.Elt.Td
  , module Deku.DOM.Elt.Th
  , module Deku.DOM.Elt.Form
  , module Deku.DOM.Elt.Label
  , module Deku.DOM.Elt.Input
  , module Deku.DOM.Elt.Button
  , module Deku.DOM.Elt.Select
  , module Deku.DOM.Elt.Datalist
  , module Deku.DOM.Elt.Optgroup
  , module Deku.DOM.Elt.Option
  , module Deku.DOM.Elt.Textarea
  , module Deku.DOM.Elt.Output
  , module Deku.DOM.Elt.Progress
  , module Deku.DOM.Elt.Meter
  , module Deku.DOM.Elt.Fieldset
  , module Deku.DOM.Elt.Legend
  , module Deku.DOM.Elt.Details
  , module Deku.DOM.Elt.Summary
  , module Deku.DOM.Elt.Dialog
  , module Deku.DOM.Elt.Script
  , module Deku.DOM.Elt.Noscript
  , module Deku.DOM.Elt.Template
  , module Deku.DOM.Elt.Slot
  , module Deku.DOM.Elt.Canvas
  , module Deku.DOM.Elt.Applet
  , module Deku.DOM.Elt.Acronym
  , module Deku.DOM.Elt.Bgsound
  , module Deku.DOM.Elt.Dir
  , module Deku.DOM.Elt.Noframes
  , module Deku.DOM.Elt.Isindex
  , module Deku.DOM.Elt.Keygen
  , module Deku.DOM.Elt.Listing
  , module Deku.DOM.Elt.Menuitem
  , module Deku.DOM.Elt.Nextid
  , module Deku.DOM.Elt.Noembed
  , module Deku.DOM.Elt.Param
  , module Deku.DOM.Elt.Plaintext
  , module Deku.DOM.Elt.Rb
  , module Deku.DOM.Elt.Rtc
  , module Deku.DOM.Elt.Strike
  , module Deku.DOM.Elt.Xmp
  , module Deku.DOM.Elt.Basefont
  , module Deku.DOM.Elt.Big
  , module Deku.DOM.Elt.Blink
  , module Deku.DOM.Elt.Center
  , module Deku.DOM.Elt.Font
  , module Deku.DOM.Elt.Multicol
  , module Deku.DOM.Elt.Nobr
  , module Deku.DOM.Elt.Spacer
  , module Deku.DOM.Elt.Tt
  , module Deku.DOM.Elt.Marquee
  , module Deku.DOM.Elt.Frameset
  , module Deku.DOM.Elt.Frame
  , module Deku.DOM.Elt.Svg
  , module Deku.DOM.Elt.G
  , module Deku.DOM.Elt.Defs
  , module Deku.DOM.Elt.Symbol
  , module Deku.DOM.Elt.Use
  , module Deku.DOM.Elt.Switch
  , module Deku.DOM.Elt.Desc
  , module Deku.DOM.Elt.Metadata
  , module Deku.DOM.Elt.Path
  , module Deku.DOM.Elt.Rect
  , module Deku.DOM.Elt.Circle
  , module Deku.DOM.Elt.Ellipse
  , module Deku.DOM.Elt.Line
  , module Deku.DOM.Elt.Polyline
  , module Deku.DOM.Elt.Polygon
  , module Deku.DOM.Elt.Text
  , module Deku.DOM.Elt.Tspan
  , module Deku.DOM.Elt.TextPath
  , module Deku.DOM.Elt.Image
  , module Deku.DOM.Elt.ForeignObject
  , module Deku.DOM.Elt.Marker
  , module Deku.DOM.Elt.LinearGradient
  , module Deku.DOM.Elt.RadialGradient
  , module Deku.DOM.Elt.Stop
  , module Deku.DOM.Elt.Pattern
  , module Deku.DOM.Elt.View
  , module Deku.DOM.Elt.FilterPrimitive
  , module Deku.DOM.Elt.Filter
  , module Deku.DOM.Elt.FeBlend
  , module Deku.DOM.Elt.FeColorMatrix
  , module Deku.DOM.Elt.FeComponentTransfer
  , module Deku.DOM.Elt.FeFuncR
  , module Deku.DOM.Elt.FeFuncG
  , module Deku.DOM.Elt.FeFuncB
  , module Deku.DOM.Elt.FeFuncA
  , module Deku.DOM.Elt.FeComposite
  , module Deku.DOM.Elt.FeConvolveMatrix
  , module Deku.DOM.Elt.FeDiffuseLighting
  , module Deku.DOM.Elt.FeDisplacementMap
  , module Deku.DOM.Elt.FeDropShadow
  , module Deku.DOM.Elt.FeFlood
  , module Deku.DOM.Elt.FeGaussianBlur
  , module Deku.DOM.Elt.FeImage
  , module Deku.DOM.Elt.FeMerge
  , module Deku.DOM.Elt.FeMergeNode
  , module Deku.DOM.Elt.FeMorphology
  , module Deku.DOM.Elt.FeOffset
  , module Deku.DOM.Elt.FeSpecularLighting
  , module Deku.DOM.Elt.FeTile
  , module Deku.DOM.Elt.FeTurbulence
  , module Deku.DOM.Elt.FeDistantLight
  , module Deku.DOM.Elt.FePointLight
  , module Deku.DOM.Elt.FeSpotLight
  , module Deku.DOM.Elt.Animate
  , module Deku.DOM.Elt.Set
  , module Deku.DOM.Elt.Discard
  , module Deku.DOM.Elt.AnimateMotion
  , module Deku.DOM.Elt.Mpath
  , module Deku.DOM.Elt.AnimateTransform
  , module Deku.DOM.Attr.Abbr
  , module Deku.DOM.Attr.Accept
  , module Deku.DOM.Attr.AcceptCharset
  , module Deku.DOM.Attr.Accumulate
  , module Deku.DOM.Attr.Action
  , module Deku.DOM.Attr.Additive
  , module Deku.DOM.Attr.Align
  , module Deku.DOM.Attr.AlignmentBaseline
  , module Deku.DOM.Attr.Alink
  , module Deku.DOM.Attr.Allow
  , module Deku.DOM.Attr.Allowfullscreen
  , module Deku.DOM.Attr.Allowtransparency
  , module Deku.DOM.Attr.Alt
  , module Deku.DOM.Attr.Amplitude
  , module Deku.DOM.Attr.Archive
  , module Deku.DOM.Attr.As
  , module Deku.DOM.Attr.Async
  , module Deku.DOM.Attr.AttributeName
  , module Deku.DOM.Attr.Autocomplete
  , module Deku.DOM.Attr.Autoplay
  , module Deku.DOM.Attr.Axis
  , module Deku.DOM.Attr.Azimuth
  , module Deku.DOM.Attr.BaseFrequency
  , module Deku.DOM.Attr.BaselineShift
  , module Deku.DOM.Attr.Begin
  , module Deku.DOM.Attr.Behavior
  , module Deku.DOM.Attr.Bgcolor
  , module Deku.DOM.Attr.Bias
  , module Deku.DOM.Attr.Blocking
  , module Deku.DOM.Attr.Border
  , module Deku.DOM.Attr.Bordercolor
  , module Deku.DOM.Attr.Bottommargin
  , module Deku.DOM.Attr.By
  , module Deku.DOM.Attr.CalcMode
  , module Deku.DOM.Attr.Capture
  , module Deku.DOM.Attr.Cellpadding
  , module Deku.DOM.Attr.Cellspacing
  , module Deku.DOM.Attr.Char
  , module Deku.DOM.Attr.Charoff
  , module Deku.DOM.Attr.Charset
  , module Deku.DOM.Attr.Checked
  , module Deku.DOM.Attr.Cite
  , module Deku.DOM.Attr.Classid
  , module Deku.DOM.Attr.Clear
  , module Deku.DOM.Attr.ClipPath
  , module Deku.DOM.Attr.ClipRule
  , module Deku.DOM.Attr.Code
  , module Deku.DOM.Attr.Codebase
  , module Deku.DOM.Attr.Codetype
  , module Deku.DOM.Attr.Color
  , module Deku.DOM.Attr.Cols
  , module Deku.DOM.Attr.Colspan
  , module Deku.DOM.Attr.Compact
  , module Deku.DOM.Attr.Content
  , module Deku.DOM.Attr.Controls
  , module Deku.DOM.Attr.Coords
  , module Deku.DOM.Attr.Crossorigin
  , module Deku.DOM.Attr.Cursor
  , module Deku.DOM.Attr.Cx
  , module Deku.DOM.Attr.Cy
  , module Deku.DOM.Attr.Data
  , module Deku.DOM.Attr.Datapagesize
  , module Deku.DOM.Attr.Datetime
  , module Deku.DOM.Attr.Declare
  , module Deku.DOM.Attr.Decoding
  , module Deku.DOM.Attr.Default
  , module Deku.DOM.Attr.Defer
  , module Deku.DOM.Attr.DiffuseConstant
  , module Deku.DOM.Attr.Direction
  , module Deku.DOM.Attr.Dirname
  , module Deku.DOM.Attr.Disabled
  , module Deku.DOM.Attr.Display
  , module Deku.DOM.Attr.Divisor
  , module Deku.DOM.Attr.DominantBaseline
  , module Deku.DOM.Attr.Download
  , module Deku.DOM.Attr.Dur
  , module Deku.DOM.Attr.Dx
  , module Deku.DOM.Attr.Dy
  , module Deku.DOM.Attr.EdgeMode
  , module Deku.DOM.Attr.Elevation
  , module Deku.DOM.Attr.Enctype
  , module Deku.DOM.Attr.End
  , module Deku.DOM.Attr.Event
  , module Deku.DOM.Attr.Exponent
  , module Deku.DOM.Attr.Fetchpriority
  , module Deku.DOM.Attr.Fill
  , module Deku.DOM.Attr.FilterRes
  , module Deku.DOM.Attr.FilterUnits
  , module Deku.DOM.Attr.FontFamily
  , module Deku.DOM.Attr.FontSize
  , module Deku.DOM.Attr.FontSizeAdjust
  , module Deku.DOM.Attr.FontStretch
  , module Deku.DOM.Attr.FontStyle
  , module Deku.DOM.Attr.FontVariant
  , module Deku.DOM.Attr.FontWeight
  , module Deku.DOM.Attr.For
  , module Deku.DOM.Attr.Form
  , module Deku.DOM.Attr.Formaction
  , module Deku.DOM.Attr.Formenctype
  , module Deku.DOM.Attr.Formmethod
  , module Deku.DOM.Attr.Formnovalidate
  , module Deku.DOM.Attr.Formtarget
  , module Deku.DOM.Attr.Fr
  , module Deku.DOM.Attr.Frame
  , module Deku.DOM.Attr.Frameborder
  , module Deku.DOM.Attr.Framespacing
  , module Deku.DOM.Attr.From
  , module Deku.DOM.Attr.Fx
  , module Deku.DOM.Attr.Fy
  , module Deku.DOM.Attr.GradientTransform
  , module Deku.DOM.Attr.GradientUnits
  , module Deku.DOM.Attr.Headers
  , module Deku.DOM.Attr.Height
  , module Deku.DOM.Attr.High
  , module Deku.DOM.Attr.Href
  , module Deku.DOM.Attr.Hreflang
  , module Deku.DOM.Attr.Hspace
  , module Deku.DOM.Attr.HttpEquiv
  , module Deku.DOM.Attr.Imagesizes
  , module Deku.DOM.Attr.Imagesrcset
  , module Deku.DOM.Attr.In
  , module Deku.DOM.Attr.In2
  , module Deku.DOM.Attr.Integrity
  , module Deku.DOM.Attr.Intercept
  , module Deku.DOM.Attr.Ismap
  , module Deku.DOM.Attr.K1
  , module Deku.DOM.Attr.K2
  , module Deku.DOM.Attr.K3
  , module Deku.DOM.Attr.K4
  , module Deku.DOM.Attr.KernelMatrix
  , module Deku.DOM.Attr.KernelUnitLength
  , module Deku.DOM.Attr.KeyPoints
  , module Deku.DOM.Attr.KeySplines
  , module Deku.DOM.Attr.KeyTimes
  , module Deku.DOM.Attr.Kind
  , module Deku.DOM.Attr.Label
  , module Deku.DOM.Attr.Language
  , module Deku.DOM.Attr.Leftmargin
  , module Deku.DOM.Attr.LengthAdjust
  , module Deku.DOM.Attr.LetterSpacing
  , module Deku.DOM.Attr.LimitingConeAngle
  , module Deku.DOM.Attr.Link
  , module Deku.DOM.Attr.List
  , module Deku.DOM.Attr.Loading
  , module Deku.DOM.Attr.Longdesc
  , module Deku.DOM.Attr.Loop
  , module Deku.DOM.Attr.Low
  , module Deku.DOM.Attr.Lowsrc
  , module Deku.DOM.Attr.Manifest
  , module Deku.DOM.Attr.Marginheight
  , module Deku.DOM.Attr.Marginwidth
  , module Deku.DOM.Attr.MarkerHeight
  , module Deku.DOM.Attr.MarkerUnits
  , module Deku.DOM.Attr.MarkerWidth
  , module Deku.DOM.Attr.Mask
  , module Deku.DOM.Attr.Max
  , module Deku.DOM.Attr.Maxlength
  , module Deku.DOM.Attr.Media
  , module Deku.DOM.Attr.Method
  , module Deku.DOM.Attr.Methods
  , module Deku.DOM.Attr.Min
  , module Deku.DOM.Attr.Minlength
  , module Deku.DOM.Attr.Mode
  , module Deku.DOM.Attr.Multiple
  , module Deku.DOM.Attr.Muted
  , module Deku.DOM.Attr.Name
  , module Deku.DOM.Attr.NoComposite
  , module Deku.DOM.Attr.Nohref
  , module Deku.DOM.Attr.Nomodule
  , module Deku.DOM.Attr.Noshade
  , module Deku.DOM.Attr.Novalidate
  , module Deku.DOM.Attr.Nowrap
  , module Deku.DOM.Attr.NumOctaves
  , module Deku.DOM.Attr.Offset
  , module Deku.DOM.Attr.Onbegin
  , module Deku.DOM.Attr.Onend
  , module Deku.DOM.Attr.Onrepeat
  , module Deku.DOM.Attr.Opacity
  , module Deku.DOM.Attr.Open
  , module Deku.DOM.Attr.Operator
  , module Deku.DOM.Attr.Optimum
  , module Deku.DOM.Attr.Order
  , module Deku.DOM.Attr.Orient
  , module Deku.DOM.Attr.Origin
  , module Deku.DOM.Attr.Overflow
  , module Deku.DOM.Attr.Path
  , module Deku.DOM.Attr.PathLength
  , module Deku.DOM.Attr.Pattern
  , module Deku.DOM.Attr.PatternContentUnits
  , module Deku.DOM.Attr.PatternTransform
  , module Deku.DOM.Attr.PatternUnits
  , module Deku.DOM.Attr.Ping
  , module Deku.DOM.Attr.Placeholder
  , module Deku.DOM.Attr.Playsinline
  , module Deku.DOM.Attr.Points
  , module Deku.DOM.Attr.PointsAtX
  , module Deku.DOM.Attr.PointsAtY
  , module Deku.DOM.Attr.PointsAtZ
  , module Deku.DOM.Attr.Poster
  , module Deku.DOM.Attr.Preload
  , module Deku.DOM.Attr.PreserveAlpha
  , module Deku.DOM.Attr.PreserveAspectRatio
  , module Deku.DOM.Attr.PrimitiveUnits
  , module Deku.DOM.Attr.Profile
  , module Deku.DOM.Attr.R
  , module Deku.DOM.Attr.Radius
  , module Deku.DOM.Attr.Readonly
  , module Deku.DOM.Attr.RefX
  , module Deku.DOM.Attr.RefY
  , module Deku.DOM.Attr.Referrerpolicy
  , module Deku.DOM.Attr.Rel
  , module Deku.DOM.Attr.RepeatCount
  , module Deku.DOM.Attr.RepeatDur
  , module Deku.DOM.Attr.Required
  , module Deku.DOM.Attr.RequiredExtensions
  , module Deku.DOM.Attr.Restart
  , module Deku.DOM.Attr.Result
  , module Deku.DOM.Attr.Rev
  , module Deku.DOM.Attr.Reversed
  , module Deku.DOM.Attr.Rightmargin
  , module Deku.DOM.Attr.Rotate
  , module Deku.DOM.Attr.Rows
  , module Deku.DOM.Attr.Rowspan
  , module Deku.DOM.Attr.Rules
  , module Deku.DOM.Attr.Sandbox
  , module Deku.DOM.Attr.Scale
  , module Deku.DOM.Attr.Scheme
  , module Deku.DOM.Attr.Scope
  , module Deku.DOM.Attr.Scrolling
  , module Deku.DOM.Attr.Seed
  , module Deku.DOM.Attr.Selected
  , module Deku.DOM.Attr.Shape
  , module Deku.DOM.Attr.Side
  , module Deku.DOM.Attr.Size
  , module Deku.DOM.Attr.Sizes
  , module Deku.DOM.Attr.Slope
  , module Deku.DOM.Attr.Spacing
  , module Deku.DOM.Attr.Span
  , module Deku.DOM.Attr.SpecularConstant
  , module Deku.DOM.Attr.SpecularExponent
  , module Deku.DOM.Attr.SpreadMethod
  , module Deku.DOM.Attr.Src
  , module Deku.DOM.Attr.Srcdoc
  , module Deku.DOM.Attr.Srclang
  , module Deku.DOM.Attr.Srcset
  , module Deku.DOM.Attr.Standby
  , module Deku.DOM.Attr.Start
  , module Deku.DOM.Attr.StartOffset
  , module Deku.DOM.Attr.StdDeviation
  , module Deku.DOM.Attr.Step
  , module Deku.DOM.Attr.StitchTiles
  , module Deku.DOM.Attr.StopColor
  , module Deku.DOM.Attr.StopOpacity
  , module Deku.DOM.Attr.Summary
  , module Deku.DOM.Attr.SurfaceScale
  , module Deku.DOM.Attr.SystemLanguage
  , module Deku.DOM.Attr.TableValues
  , module Deku.DOM.Attr.Target
  , module Deku.DOM.Attr.TargetX
  , module Deku.DOM.Attr.TargetY
  , module Deku.DOM.Attr.Text
  , module Deku.DOM.Attr.TextDecoration
  , module Deku.DOM.Attr.TextLength
  , module Deku.DOM.Attr.Title
  , module Deku.DOM.Attr.To
  , module Deku.DOM.Attr.Topmargin
  , module Deku.DOM.Attr.Transform
  , module Deku.DOM.Attr.TransformOrigin
  , module Deku.DOM.Attr.Truespeed
  , module Deku.DOM.Attr.Type
  , module Deku.DOM.Attr.Typemustmatch
  , module Deku.DOM.Attr.UnicodeBidi
  , module Deku.DOM.Attr.Urn
  , module Deku.DOM.Attr.Usemap
  , module Deku.DOM.Attr.Valign
  , module Deku.DOM.Attr.Value
  , module Deku.DOM.Attr.Values
  , module Deku.DOM.Attr.Version
  , module Deku.DOM.Attr.ViewBox
  , module Deku.DOM.Attr.Visibility
  , module Deku.DOM.Attr.Vlink
  , module Deku.DOM.Attr.Vspace
  , module Deku.DOM.Attr.Width
  , module Deku.DOM.Attr.WordSpacing
  , module Deku.DOM.Attr.Wrap
  , module Deku.DOM.Attr.WritingMode
  , module Deku.DOM.Attr.X
  , module Deku.DOM.Attr.X1
  , module Deku.DOM.Attr.X2
  , module Deku.DOM.Attr.XChannelSelector
  , module Deku.DOM.Attr.XlinkHref
  , module Deku.DOM.Attr.XlinkTitle
  , module Deku.DOM.Attr.Y
  , module Deku.DOM.Attr.Y1
  , module Deku.DOM.Attr.Y2
  , module Deku.DOM.Attr.YChannelSelector
  , module Deku.DOM.Attr.Z
  , module Deku.DOM.Attr.AriaValuetext
  , module Deku.DOM.Attr.AriaValuenow
  , module Deku.DOM.Attr.AriaValuemin
  , module Deku.DOM.Attr.AriaValuemax
  , module Deku.DOM.Attr.AriaSort
  , module Deku.DOM.Attr.AriaSetsize
  , module Deku.DOM.Attr.AriaSelected
  , module Deku.DOM.Attr.AriaRowspan
  , module Deku.DOM.Attr.AriaRowindextext
  , module Deku.DOM.Attr.AriaRowindex
  , module Deku.DOM.Attr.AriaRowcount
  , module Deku.DOM.Attr.AriaRoledescription
  , module Deku.DOM.Attr.AriaRequired
  , module Deku.DOM.Attr.AriaReadonly
  , module Deku.DOM.Attr.AriaPressed
  , module Deku.DOM.Attr.AriaPosinset
  , module Deku.DOM.Attr.AriaPlaceholder
  , module Deku.DOM.Attr.AriaOwns
  , module Deku.DOM.Attr.AriaOrientation
  , module Deku.DOM.Attr.AriaMultiselectable
  , module Deku.DOM.Attr.AriaMultiline
  , module Deku.DOM.Attr.AriaModal
  , module Deku.DOM.Attr.AriaLive
  , module Deku.DOM.Attr.AriaLevel
  , module Deku.DOM.Attr.AriaLabelledby
  , module Deku.DOM.Attr.AriaLabel
  , module Deku.DOM.Attr.AriaKeyshortcuts
  , module Deku.DOM.Attr.AriaInvalid
  , module Deku.DOM.Attr.AriaHidden
  , module Deku.DOM.Attr.AriaHaspopup
  , module Deku.DOM.Attr.AriaFlowto
  , module Deku.DOM.Attr.AriaExpanded
  , module Deku.DOM.Attr.AriaErrormessage
  , module Deku.DOM.Attr.AriaDisabled
  , module Deku.DOM.Attr.AriaDetails
  , module Deku.DOM.Attr.AriaDescription
  , module Deku.DOM.Attr.AriaDescribedby
  , module Deku.DOM.Attr.AriaCurrent
  , module Deku.DOM.Attr.AriaControls
  , module Deku.DOM.Attr.AriaColspan
  , module Deku.DOM.Attr.AriaColindextext
  , module Deku.DOM.Attr.AriaColindex
  , module Deku.DOM.Attr.AriaColcount
  , module Deku.DOM.Attr.AriaChecked
  , module Deku.DOM.Attr.AriaBusy
  , module Deku.DOM.Attr.AriaAutocomplete
  , module Deku.DOM.Attr.AriaAtomic
  , module Deku.DOM.Attr.AriaActivedescendant
  , module Deku.DOM.Attr.Role
  , module Deku.DOM.Attr.Slot
  , module Deku.DOM.Attr.Id
  , module Deku.DOM.Attr.Class
  , module Deku.DOM.Attr.OnAnimationcancel
  , module Deku.DOM.Attr.OnAnimationend
  , module Deku.DOM.Attr.OnAnimationiteration
  , module Deku.DOM.Attr.OnAnimationstart
  , module Deku.DOM.Attr.OnTransitioncancel
  , module Deku.DOM.Attr.OnTransitionend
  , module Deku.DOM.Attr.OnTransitionstart
  , module Deku.DOM.Attr.OnTransitionrun
  , module Deku.DOM.Attr.OnSelectionchange
  , module Deku.DOM.Attr.OnSelectstart
  , module Deku.DOM.Attr.OnTouchcancel
  , module Deku.DOM.Attr.OnTouchmove
  , module Deku.DOM.Attr.OnTouchend
  , module Deku.DOM.Attr.OnTouchstart
  , module Deku.DOM.Attr.OnLostpointercapture
  , module Deku.DOM.Attr.OnGotpointercapture
  , module Deku.DOM.Attr.OnPointerleave
  , module Deku.DOM.Attr.OnPointerout
  , module Deku.DOM.Attr.OnPointercancel
  , module Deku.DOM.Attr.OnPointerup
  , module Deku.DOM.Attr.OnPointerrawupdate
  , module Deku.DOM.Attr.OnPointermove
  , module Deku.DOM.Attr.OnPointerdown
  , module Deku.DOM.Attr.OnPointerenter
  , module Deku.DOM.Attr.OnPointerover
  , module Deku.DOM.Attr.OnScrollend
  , module Deku.DOM.Attr.OnScroll
  , module Deku.DOM.Attr.OnResize
  , module Deku.DOM.Attr.OnLoad
  , module Deku.DOM.Attr.OnFocus
  , module Deku.DOM.Attr.OnError
  , module Deku.DOM.Attr.OnBlur
  , module Deku.DOM.Attr.OnWheel
  , module Deku.DOM.Attr.OnWebkittransitionend
  , module Deku.DOM.Attr.OnWebkitanimationstart
  , module Deku.DOM.Attr.OnWebkitanimationiteration
  , module Deku.DOM.Attr.OnWebkitanimationend
  , module Deku.DOM.Attr.OnWaiting
  , module Deku.DOM.Attr.OnVolumechange
  , module Deku.DOM.Attr.OnToggle
  , module Deku.DOM.Attr.OnTimeupdate
  , module Deku.DOM.Attr.OnSuspend
  , module Deku.DOM.Attr.OnSubmit
  , module Deku.DOM.Attr.OnStalled
  , module Deku.DOM.Attr.OnSlotchange
  , module Deku.DOM.Attr.OnSelect
  , module Deku.DOM.Attr.OnSeeking
  , module Deku.DOM.Attr.OnSeeked
  , module Deku.DOM.Attr.OnSecuritypolicyviolation
  , module Deku.DOM.Attr.OnReset
  , module Deku.DOM.Attr.OnRatechange
  , module Deku.DOM.Attr.OnProgress
  , module Deku.DOM.Attr.OnPlaying
  , module Deku.DOM.Attr.OnPlay
  , module Deku.DOM.Attr.OnPause
  , module Deku.DOM.Attr.OnPaste
  , module Deku.DOM.Attr.OnMouseup
  , module Deku.DOM.Attr.OnMouseover
  , module Deku.DOM.Attr.OnMouseout
  , module Deku.DOM.Attr.OnMousemove
  , module Deku.DOM.Attr.OnMouseleave
  , module Deku.DOM.Attr.OnMouseenter
  , module Deku.DOM.Attr.OnMousedown
  , module Deku.DOM.Attr.OnLoadstart
  , module Deku.DOM.Attr.OnLoadedmetadata
  , module Deku.DOM.Attr.OnLoadeddata
  , module Deku.DOM.Attr.OnKeyup
  , module Deku.DOM.Attr.OnKeypress
  , module Deku.DOM.Attr.OnKeydown
  , module Deku.DOM.Attr.OnInvalid
  , module Deku.DOM.Attr.OnInput
  , module Deku.DOM.Attr.OnFormdata
  , module Deku.DOM.Attr.OnEnded
  , module Deku.DOM.Attr.OnEmptied
  , module Deku.DOM.Attr.OnDurationchange
  , module Deku.DOM.Attr.OnDrop
  , module Deku.DOM.Attr.OnDragstart
  , module Deku.DOM.Attr.OnDragover
  , module Deku.DOM.Attr.OnDragleave
  , module Deku.DOM.Attr.OnDragenter
  , module Deku.DOM.Attr.OnDragend
  , module Deku.DOM.Attr.OnDrag
  , module Deku.DOM.Attr.OnDblclick
  , module Deku.DOM.Attr.OnCut
  , module Deku.DOM.Attr.OnCuechange
  , module Deku.DOM.Attr.OnCopy
  , module Deku.DOM.Attr.OnContextrestored
  , module Deku.DOM.Attr.OnContextmenu
  , module Deku.DOM.Attr.OnContextlost
  , module Deku.DOM.Attr.OnClose
  , module Deku.DOM.Attr.OnClick
  , module Deku.DOM.Attr.OnChange
  , module Deku.DOM.Attr.OnCanplaythrough
  , module Deku.DOM.Attr.OnCanplay
  , module Deku.DOM.Attr.OnCancel
  , module Deku.DOM.Attr.OnBeforetoggle
  , module Deku.DOM.Attr.OnBeforematch
  , module Deku.DOM.Attr.OnBeforeinput
  , module Deku.DOM.Attr.OnAuxclick
  , module Deku.DOM.Attr.OnAbort
  , module Deku.DOM.Attr.Popovertargetaction
  , module Deku.DOM.Attr.Popovertarget
  , module Deku.DOM.Attr.Popover
  , module Deku.DOM.Attr.Draggable
  , module Deku.DOM.Attr.Enterkeyhint
  , module Deku.DOM.Attr.Inputmode
  , module Deku.DOM.Attr.Autocapitalize
  , module Deku.DOM.Attr.Spellcheck
  , module Deku.DOM.Attr.Contenteditable
  , module Deku.DOM.Attr.Accesskey
  , module Deku.DOM.Attr.Autofocus
  , module Deku.DOM.Attr.Hidden
  , module Deku.DOM.Attr.Itemprop
  , module Deku.DOM.Attr.Itemref
  , module Deku.DOM.Attr.Itemid
  , module Deku.DOM.Attr.Itemtype
  , module Deku.DOM.Attr.Itemscope
  , module Deku.DOM.Attr.Is
  , module Deku.DOM.Attr.Style
  , module Deku.DOM.Attr.Dir
  , module Deku.DOM.Attr.Translate
  , module Deku.DOM.Attr.Lang
  , module Deku.DOM.Attr.Tabindex
  , module Deku.DOM.Attr.Nonce
  , module Deku.DOM.Attr.LightingColor
  , module Deku.DOM.Attr.ColorInterpolationFilters
  , module Deku.DOM.Attr.FloodOpacity
  , module Deku.DOM.Attr.FloodColor
  , module Deku.DOM.Attr.Filter
  , module Deku.DOM.Attr.StrokeOpacity
  , module Deku.DOM.Attr.Stroke
  , module Deku.DOM.Attr.StrokeRepeat
  , module Deku.DOM.Attr.StrokeSize
  , module Deku.DOM.Attr.StrokePosition
  , module Deku.DOM.Attr.StrokeOrigin
  , module Deku.DOM.Attr.StrokeImage
  , module Deku.DOM.Attr.StrokeColor
  , module Deku.DOM.Attr.StrokeDashJustify
  , module Deku.DOM.Attr.StrokeDashCorner
  , module Deku.DOM.Attr.StrokeDashoffset
  , module Deku.DOM.Attr.StrokeDasharray
  , module Deku.DOM.Attr.StrokeBreak
  , module Deku.DOM.Attr.StrokeMiterlimit
  , module Deku.DOM.Attr.StrokeLinejoin
  , module Deku.DOM.Attr.StrokeLinecap
  , module Deku.DOM.Attr.StrokeAlign
  , module Deku.DOM.Attr.StrokeWidth
  , module Deku.DOM.Attr.FillOpacity
  , module Deku.DOM.Attr.FillRepeat
  , module Deku.DOM.Attr.FillSize
  , module Deku.DOM.Attr.FillPosition
  , module Deku.DOM.Attr.FillOrigin
  , module Deku.DOM.Attr.FillImage
  , module Deku.DOM.Attr.FillColor
  , module Deku.DOM.Attr.FillBreak
  , module Deku.DOM.Attr.FillRule
  , module Deku.DOM.Attr.PointerEvents
  , module Deku.DOM.Attr.ImageRendering
  , module Deku.DOM.Attr.TextRendering
  , module Deku.DOM.Attr.ShapeRendering
  , module Deku.DOM.Attr.ColorInterpolation
  , module Deku.DOM.Attr.PaintOrder
  , module Deku.DOM.Attr.Marker
  , module Deku.DOM.Attr.MarkerEnd
  , module Deku.DOM.Attr.MarkerMid
  , module Deku.DOM.Attr.MarkerStart
  , module Deku.DOM.Attr.TextAnchor
  , module Deku.DOM.Attr.ShapeMargin
  , module Deku.DOM.Attr.ShapeSubtract
  , module Deku.DOM.Attr.ShapeInside
  , module Deku.DOM.Attr.InlineSize
  , module Deku.DOM.Attr.D
  , module Deku.DOM.Attr.VectorEffect
  , module Deku.DOM.Attr.Ry
  , module Deku.DOM.Attr.Rx
  , Self(..)
  , SelfT(..)
  , class TagToDeku
  , unsafeCustomElement
  ) where

import Deku.DOM.Elt.Html (Html_, html, html_, html__)
import Deku.DOM.Elt.Head (Head_, head, head_, head__)
import Deku.DOM.Elt.Title (Title_, title, title_, title__)
import Deku.DOM.Elt.Base (Base_, base, base_, base__)
import Deku.DOM.Elt.Link (Link_, link, link_, link__)
import Deku.DOM.Elt.Meta (Meta_, meta, meta_, meta__)
import Deku.DOM.Elt.Style (Style_, style, style_, style__)
import Deku.DOM.Elt.Body (Body_, body, body_, body__)
import Deku.DOM.Elt.Article (Article_, article, article_, article__)
import Deku.DOM.Elt.Section (Section_, section, section_, section__)
import Deku.DOM.Elt.Nav (Nav_, nav, nav_, nav__)
import Deku.DOM.Elt.Aside (Aside_, aside, aside_, aside__)
import Deku.DOM.Elt.H1 (H1_, h1, h1_, h1__)
import Deku.DOM.Elt.H2 (H2_, h2, h2_, h2__)
import Deku.DOM.Elt.H3 (H3_, h3, h3_, h3__)
import Deku.DOM.Elt.H4 (H4_, h4, h4_, h4__)
import Deku.DOM.Elt.H5 (H5_, h5, h5_, h5__)
import Deku.DOM.Elt.H6 (H6_, h6, h6_, h6__)
import Deku.DOM.Elt.Hgroup (Hgroup_, hgroup, hgroup_, hgroup__)
import Deku.DOM.Elt.Header (Header_, header, header_, header__)
import Deku.DOM.Elt.Footer (Footer_, footer, footer_, footer__)
import Deku.DOM.Elt.Address (Address_, address, address_, address__)
import Deku.DOM.Elt.P (P_, p, p_, p__)
import Deku.DOM.Elt.Hr (Hr_, hr, hr_, hr__)
import Deku.DOM.Elt.Pre (Pre_, pre, pre_, pre__)
import Deku.DOM.Elt.Blockquote (Blockquote_, blockquote, blockquote_, blockquote__)
import Deku.DOM.Elt.Ol (Ol_, ol, ol_, ol__)
import Deku.DOM.Elt.Ul (Ul_, ul, ul_, ul__)
import Deku.DOM.Elt.Menu (Menu_, menu, menu_, menu__)
import Deku.DOM.Elt.Li (Li_, li, li_, li__)
import Deku.DOM.Elt.Dl (Dl_, dl, dl_, dl__)
import Deku.DOM.Elt.Dt (Dt_, dt, dt_, dt__)
import Deku.DOM.Elt.Dd (Dd_, dd, dd_, dd__)
import Deku.DOM.Elt.Figure (Figure_, figure, figure_, figure__)
import Deku.DOM.Elt.Figcaption (Figcaption_, figcaption, figcaption_, figcaption__)
import Deku.DOM.Elt.Main (Main_, main, main_, main__)
import Deku.DOM.Elt.Search (Search_, search, search_, search__)
import Deku.DOM.Elt.Div (Div_, div, div_, div__)
import Deku.DOM.Elt.A (A_, a, a_, a__)
import Deku.DOM.Elt.Em (Em_, em, em_, em__)
import Deku.DOM.Elt.Strong (Strong_, strong, strong_, strong__)
import Deku.DOM.Elt.Small (Small_, small, small_, small__)
import Deku.DOM.Elt.S (S_, s, s_, s__)
import Deku.DOM.Elt.Cite (Cite_, cite, cite_, cite__)
import Deku.DOM.Elt.Q (Q_, q, q_, q__)
import Deku.DOM.Elt.Dfn (Dfn_, dfn, dfn_, dfn__)
import Deku.DOM.Elt.Abbr (Abbr_, abbr, abbr_, abbr__)
import Deku.DOM.Elt.Ruby (Ruby_, ruby, ruby_, ruby__)
import Deku.DOM.Elt.Rt (Rt_, rt, rt_, rt__)
import Deku.DOM.Elt.Rp (Rp_, rp, rp_, rp__)
import Deku.DOM.Elt.Xdata (Xdata_, xdata, xdata_, xdata__)
import Deku.DOM.Elt.Time (Time_, time, time_, time__)
import Deku.DOM.Elt.Code (Code_, code, code_, code__)
import Deku.DOM.Elt.Var (Var_, var, var_, var__)
import Deku.DOM.Elt.Samp (Samp_, samp, samp_, samp__)
import Deku.DOM.Elt.Kbd (Kbd_, kbd, kbd_, kbd__)
import Deku.DOM.Elt.Sub (Sub_, sub, sub_, sub__)
import Deku.DOM.Elt.Sup (Sup_, sup, sup_, sup__)
import Deku.DOM.Elt.I (I_, i, i_, i__)
import Deku.DOM.Elt.B (B_, b, b_, b__)
import Deku.DOM.Elt.U (U_, u, u_, u__)
import Deku.DOM.Elt.Mark (Mark_, mark, mark_, mark__)
import Deku.DOM.Elt.Bdi (Bdi_, bdi, bdi_, bdi__)
import Deku.DOM.Elt.Bdo (Bdo_, bdo, bdo_, bdo__)
import Deku.DOM.Elt.Span (Span_, span, span_, span__)
import Deku.DOM.Elt.Br (Br_, br, br_, br__)
import Deku.DOM.Elt.Wbr (Wbr_, wbr, wbr_, wbr__)
import Deku.DOM.Elt.Ins (Ins_, ins, ins_, ins__)
import Deku.DOM.Elt.Del (Del_, del, del_, del__)
import Deku.DOM.Elt.Picture (Picture_, picture, picture_, picture__)
import Deku.DOM.Elt.Source (Source_, source, source_, source__)
import Deku.DOM.Elt.Img (Img_, img, img_, img__)
import Deku.DOM.Elt.Iframe (Iframe_, iframe, iframe_, iframe__)
import Deku.DOM.Elt.Embed (Embed_, embed, embed_, embed__)
import Deku.DOM.Elt.Object (Object_, object, object_, object__)
import Deku.DOM.Elt.Video (Video_, video, video_, video__)
import Deku.DOM.Elt.Audio (Audio_, audio, audio_, audio__)
import Deku.DOM.Elt.Track (Track_, track, track_, track__)
import Deku.DOM.Elt.Map (Map_, map, map_, map__)
import Deku.DOM.Elt.Area (Area_, area, area_, area__)
import Deku.DOM.Elt.Table (Table_, table, table_, table__)
import Deku.DOM.Elt.Caption (Caption_, caption, caption_, caption__)
import Deku.DOM.Elt.Colgroup (Colgroup_, colgroup, colgroup_, colgroup__)
import Deku.DOM.Elt.Col (Col_, col, col_, col__)
import Deku.DOM.Elt.Tbody (Tbody_, tbody, tbody_, tbody__)
import Deku.DOM.Elt.Thead (Thead_, thead, thead_, thead__)
import Deku.DOM.Elt.Tfoot (Tfoot_, tfoot, tfoot_, tfoot__)
import Deku.DOM.Elt.Tr (Tr_, tr, tr_, tr__)
import Deku.DOM.Elt.Td (Td_, td, td_, td__)
import Deku.DOM.Elt.Th (Th_, th, th_, th__)
import Deku.DOM.Elt.Form (Form_, form, form_, form__)
import Deku.DOM.Elt.Label (Label_, label, label_, label__)
import Deku.DOM.Elt.Input (Input_, input, input_, input__)
import Deku.DOM.Elt.Button (Button_, button, button_, button__)
import Deku.DOM.Elt.Select (Select_, select, select_, select__)
import Deku.DOM.Elt.Datalist (Datalist_, datalist, datalist_, datalist__)
import Deku.DOM.Elt.Optgroup (Optgroup_, optgroup, optgroup_, optgroup__)
import Deku.DOM.Elt.Option (Option_, option, option_, option__)
import Deku.DOM.Elt.Textarea (Textarea_, textarea, textarea_, textarea__)
import Deku.DOM.Elt.Output (Output_, output, output_, output__)
import Deku.DOM.Elt.Progress (Progress_, progress, progress_, progress__)
import Deku.DOM.Elt.Meter (Meter_, meter, meter_, meter__)
import Deku.DOM.Elt.Fieldset (Fieldset_, fieldset, fieldset_, fieldset__)
import Deku.DOM.Elt.Legend (Legend_, legend, legend_, legend__)
import Deku.DOM.Elt.Details (Details_, details, details_, details__)
import Deku.DOM.Elt.Summary (Summary_, summary, summary_, summary__)
import Deku.DOM.Elt.Dialog (Dialog_, dialog, dialog_, dialog__)
import Deku.DOM.Elt.Script (Script_, script, script_, script__)
import Deku.DOM.Elt.Noscript (Noscript_, noscript, noscript_, noscript__)
import Deku.DOM.Elt.Template (Template_, template, template_, template__)
import Deku.DOM.Elt.Slot (Slot_, slot, slot_, slot__)
import Deku.DOM.Elt.Canvas (Canvas_, canvas, canvas_, canvas__)
import Deku.DOM.Elt.Applet (Applet_, applet, applet_, applet__)
import Deku.DOM.Elt.Acronym (Acronym_, acronym, acronym_, acronym__)
import Deku.DOM.Elt.Bgsound (Bgsound_, bgsound, bgsound_, bgsound__)
import Deku.DOM.Elt.Dir (Dir_, dir, dir_, dir__)
import Deku.DOM.Elt.Noframes (Noframes_, noframes, noframes_, noframes__)
import Deku.DOM.Elt.Isindex (Isindex_, isindex, isindex_, isindex__)
import Deku.DOM.Elt.Keygen (Keygen_, keygen, keygen_, keygen__)
import Deku.DOM.Elt.Listing (Listing_, listing, listing_, listing__)
import Deku.DOM.Elt.Menuitem (Menuitem_, menuitem, menuitem_, menuitem__)
import Deku.DOM.Elt.Nextid (Nextid_, nextid, nextid_, nextid__)
import Deku.DOM.Elt.Noembed (Noembed_, noembed, noembed_, noembed__)
import Deku.DOM.Elt.Param (Param_, param, param_, param__)
import Deku.DOM.Elt.Plaintext (Plaintext_, plaintext, plaintext_, plaintext__)
import Deku.DOM.Elt.Rb (Rb_, rb, rb_, rb__)
import Deku.DOM.Elt.Rtc (Rtc_, rtc, rtc_, rtc__)
import Deku.DOM.Elt.Strike (Strike_, strike, strike_, strike__)
import Deku.DOM.Elt.Xmp (Xmp_, xmp, xmp_, xmp__)
import Deku.DOM.Elt.Basefont (Basefont_, basefont, basefont_, basefont__)
import Deku.DOM.Elt.Big (Big_, big, big_, big__)
import Deku.DOM.Elt.Blink (Blink_, blink, blink_, blink__)
import Deku.DOM.Elt.Center (Center_, center, center_, center__)
import Deku.DOM.Elt.Font (Font_, font, font_, font__)
import Deku.DOM.Elt.Multicol (Multicol_, multicol, multicol_, multicol__)
import Deku.DOM.Elt.Nobr (Nobr_, nobr, nobr_, nobr__)
import Deku.DOM.Elt.Spacer (Spacer_, spacer, spacer_, spacer__)
import Deku.DOM.Elt.Tt (Tt_, tt, tt_, tt__)
import Deku.DOM.Elt.Marquee (Marquee_, marquee, marquee_, marquee__)
import Deku.DOM.Elt.Frameset (Frameset_, frameset, frameset_, frameset__)
import Deku.DOM.Elt.Frame (Frame_, frame, frame_, frame__)
import Deku.DOM.Elt.Svg (Svg_, svg, svg_, svg__)
import Deku.DOM.Elt.G (G_, g, g_, g__)
import Deku.DOM.Elt.Defs (Defs_, defs, defs_, defs__)
import Deku.DOM.Elt.Symbol (Symbol_, symbol, symbol_, symbol__)
import Deku.DOM.Elt.Use (Use_, use, use_, use__)
import Deku.DOM.Elt.Switch (Switch_, switch, switch_, switch__)
import Deku.DOM.Elt.Desc (Desc_, desc, desc_, desc__)
import Deku.DOM.Elt.Metadata (Metadata_, metadata, metadata_, metadata__)
import Deku.DOM.Elt.Path (Path_, path, path_, path__)
import Deku.DOM.Elt.Rect (Rect_, rect, rect_, rect__)
import Deku.DOM.Elt.Circle (Circle_, circle, circle_, circle__)
import Deku.DOM.Elt.Ellipse (Ellipse_, ellipse, ellipse_, ellipse__)
import Deku.DOM.Elt.Line (Line_, line, line_, line__)
import Deku.DOM.Elt.Polyline (Polyline_, polyline, polyline_, polyline__)
import Deku.DOM.Elt.Polygon (Polygon_, polygon, polygon_, polygon__)
import Deku.DOM.Elt.Text (Text_, text, text_, text__)
import Deku.DOM.Elt.Tspan (Tspan_, tspan, tspan_, tspan__)
import Deku.DOM.Elt.TextPath (TextPath_, textPath, textPath_, textPath__)
import Deku.DOM.Elt.Image (Image_, image, image_, image__)
import Deku.DOM.Elt.ForeignObject (ForeignObject_, foreignObject, foreignObject_, foreignObject__)
import Deku.DOM.Elt.Marker (Marker_, marker, marker_, marker__)
import Deku.DOM.Elt.LinearGradient (LinearGradient_, linearGradient, linearGradient_, linearGradient__)
import Deku.DOM.Elt.RadialGradient (RadialGradient_, radialGradient, radialGradient_, radialGradient__)
import Deku.DOM.Elt.Stop (Stop_, stop, stop_, stop__)
import Deku.DOM.Elt.Pattern (Pattern_, pattern, pattern_, pattern__)
import Deku.DOM.Elt.View (View_, view, view_, view__)
import Deku.DOM.Elt.FilterPrimitive (FilterPrimitive_, filterPrimitive, filterPrimitive_, filterPrimitive__)
import Deku.DOM.Elt.Filter (Filter_, filter, filter_, filter__)
import Deku.DOM.Elt.FeBlend (FeBlend_, feBlend, feBlend_, feBlend__)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_, feColorMatrix, feColorMatrix_, feColorMatrix__)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_, feComponentTransfer, feComponentTransfer_, feComponentTransfer__)
import Deku.DOM.Elt.FeFuncR (FeFuncR_, feFuncR, feFuncR_, feFuncR__)
import Deku.DOM.Elt.FeFuncG (FeFuncG_, feFuncG, feFuncG_, feFuncG__)
import Deku.DOM.Elt.FeFuncB (FeFuncB_, feFuncB, feFuncB_, feFuncB__)
import Deku.DOM.Elt.FeFuncA (FeFuncA_, feFuncA, feFuncA_, feFuncA__)
import Deku.DOM.Elt.FeComposite (FeComposite_, feComposite, feComposite_, feComposite__)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_, feConvolveMatrix, feConvolveMatrix_, feConvolveMatrix__)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_, feDiffuseLighting, feDiffuseLighting_, feDiffuseLighting__)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_, feDisplacementMap, feDisplacementMap_, feDisplacementMap__)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_, feDropShadow, feDropShadow_, feDropShadow__)
import Deku.DOM.Elt.FeFlood (FeFlood_, feFlood, feFlood_, feFlood__)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_, feGaussianBlur, feGaussianBlur_, feGaussianBlur__)
import Deku.DOM.Elt.FeImage (FeImage_, feImage, feImage_, feImage__)
import Deku.DOM.Elt.FeMerge (FeMerge_, feMerge, feMerge_, feMerge__)
import Deku.DOM.Elt.FeMergeNode (FeMergeNode_, feMergeNode, feMergeNode_, feMergeNode__)
import Deku.DOM.Elt.FeMorphology (FeMorphology_, feMorphology, feMorphology_, feMorphology__)
import Deku.DOM.Elt.FeOffset (FeOffset_, feOffset, feOffset_, feOffset__)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_, feSpecularLighting, feSpecularLighting_, feSpecularLighting__)
import Deku.DOM.Elt.FeTile (FeTile_, feTile, feTile_, feTile__)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_, feTurbulence, feTurbulence_, feTurbulence__)
import Deku.DOM.Elt.FeDistantLight (FeDistantLight_, feDistantLight, feDistantLight_, feDistantLight__)
import Deku.DOM.Elt.FePointLight (FePointLight_, fePointLight, fePointLight_, fePointLight__)
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_, feSpotLight, feSpotLight_, feSpotLight__)
import Deku.DOM.Elt.Animate (Animate_, animate, animate_, animate__)
import Deku.DOM.Elt.Set (Set_, set, set_, set__)
import Deku.DOM.Elt.Discard (Discard_, discard, discard_, discard__)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_, animateMotion, animateMotion_, animateMotion__)
import Deku.DOM.Elt.Mpath (Mpath_, mpath, mpath_, mpath__)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_, animateTransform, animateTransform_, animateTransform__)
import Deku.DOM.Attr.Abbr (Abbr(..))
import Deku.DOM.Attr.Accept (Accept(..))
import Deku.DOM.Attr.AcceptCharset (AcceptCharset(..))
import Deku.DOM.Attr.Accumulate (Accumulate(..))
import Deku.DOM.Attr.Action (Action(..))
import Deku.DOM.Attr.Additive (Additive(..))
import Deku.DOM.Attr.Align (Align(..))
import Deku.DOM.Attr.AlignmentBaseline (AlignmentBaseline(..))
import Deku.DOM.Attr.Alink (Alink(..))
import Deku.DOM.Attr.Allow (Allow(..))
import Deku.DOM.Attr.Allowfullscreen (Allowfullscreen(..))
import Deku.DOM.Attr.Allowtransparency (Allowtransparency(..))
import Deku.DOM.Attr.Alt (Alt(..))
import Deku.DOM.Attr.Amplitude (Amplitude(..))
import Deku.DOM.Attr.Archive (Archive(..))
import Deku.DOM.Attr.As (As(..))
import Deku.DOM.Attr.Async (Async(..))
import Deku.DOM.Attr.AttributeName (AttributeName(..))
import Deku.DOM.Attr.Autocomplete (Autocomplete(..))
import Deku.DOM.Attr.Autoplay (Autoplay(..))
import Deku.DOM.Attr.Axis (Axis(..))
import Deku.DOM.Attr.Azimuth (Azimuth(..))
import Deku.DOM.Attr.BaseFrequency (BaseFrequency(..))
import Deku.DOM.Attr.BaselineShift (BaselineShift(..))
import Deku.DOM.Attr.Begin (Begin(..))
import Deku.DOM.Attr.Behavior (Behavior(..))
import Deku.DOM.Attr.Bgcolor (Bgcolor(..))
import Deku.DOM.Attr.Bias (Bias(..))
import Deku.DOM.Attr.Blocking (Blocking(..))
import Deku.DOM.Attr.Border (Border(..))
import Deku.DOM.Attr.Bordercolor (Bordercolor(..))
import Deku.DOM.Attr.Bottommargin (Bottommargin(..))
import Deku.DOM.Attr.By (By(..))
import Deku.DOM.Attr.CalcMode (CalcMode(..))
import Deku.DOM.Attr.Capture (Capture(..))
import Deku.DOM.Attr.Cellpadding (Cellpadding(..))
import Deku.DOM.Attr.Cellspacing (Cellspacing(..))
import Deku.DOM.Attr.Char (Char(..))
import Deku.DOM.Attr.Charoff (Charoff(..))
import Deku.DOM.Attr.Charset (Charset(..))
import Deku.DOM.Attr.Checked (Checked(..))
import Deku.DOM.Attr.Cite (Cite(..))
import Deku.DOM.Attr.Classid (Classid(..))
import Deku.DOM.Attr.Clear (Clear(..))
import Deku.DOM.Attr.ClipPath (ClipPath(..))
import Deku.DOM.Attr.ClipRule (ClipRule(..))
import Deku.DOM.Attr.Code (Code(..))
import Deku.DOM.Attr.Codebase (Codebase(..))
import Deku.DOM.Attr.Codetype (Codetype(..))
import Deku.DOM.Attr.Color (Color(..))
import Deku.DOM.Attr.Cols (Cols(..))
import Deku.DOM.Attr.Colspan (Colspan(..))
import Deku.DOM.Attr.Compact (Compact(..))
import Deku.DOM.Attr.Content (Content(..))
import Deku.DOM.Attr.Controls (Controls(..))
import Deku.DOM.Attr.Coords (Coords(..))
import Deku.DOM.Attr.Crossorigin (Crossorigin(..))
import Deku.DOM.Attr.Cursor (Cursor(..))
import Deku.DOM.Attr.Cx (Cx(..))
import Deku.DOM.Attr.Cy (Cy(..))
import Deku.DOM.Attr.Data (Data(..))
import Deku.DOM.Attr.Datapagesize (Datapagesize(..))
import Deku.DOM.Attr.Datetime (Datetime(..))
import Deku.DOM.Attr.Declare (Declare(..))
import Deku.DOM.Attr.Decoding (Decoding(..))
import Deku.DOM.Attr.Default (Default(..))
import Deku.DOM.Attr.Defer (Defer(..))
import Deku.DOM.Attr.DiffuseConstant (DiffuseConstant(..))
import Deku.DOM.Attr.Direction (Direction(..))
import Deku.DOM.Attr.Dirname (Dirname(..))
import Deku.DOM.Attr.Disabled (Disabled(..))
import Deku.DOM.Attr.Display (Display(..))
import Deku.DOM.Attr.Divisor (Divisor(..))
import Deku.DOM.Attr.DominantBaseline (DominantBaseline(..))
import Deku.DOM.Attr.Download (Download(..))
import Deku.DOM.Attr.Dur (Dur(..))
import Deku.DOM.Attr.Dx (Dx(..))
import Deku.DOM.Attr.Dy (Dy(..))
import Deku.DOM.Attr.EdgeMode (EdgeMode(..))
import Deku.DOM.Attr.Elevation (Elevation(..))
import Deku.DOM.Attr.Enctype (Enctype(..))
import Deku.DOM.Attr.End (End(..))
import Deku.DOM.Attr.Event (Event(..))
import Deku.DOM.Attr.Exponent (Exponent(..))
import Deku.DOM.Attr.Fetchpriority (Fetchpriority(..))
import Deku.DOM.Attr.Fill (Fill(..))
import Deku.DOM.Attr.FilterRes (FilterRes(..))
import Deku.DOM.Attr.FilterUnits (FilterUnits(..))
import Deku.DOM.Attr.FontFamily (FontFamily(..))
import Deku.DOM.Attr.FontSize (FontSize(..))
import Deku.DOM.Attr.FontSizeAdjust (FontSizeAdjust(..))
import Deku.DOM.Attr.FontStretch (FontStretch(..))
import Deku.DOM.Attr.FontStyle (FontStyle(..))
import Deku.DOM.Attr.FontVariant (FontVariant(..))
import Deku.DOM.Attr.FontWeight (FontWeight(..))
import Deku.DOM.Attr.For (For(..))
import Deku.DOM.Attr.Form (Form(..))
import Deku.DOM.Attr.Formaction (Formaction(..))
import Deku.DOM.Attr.Formenctype (Formenctype(..))
import Deku.DOM.Attr.Formmethod (Formmethod(..))
import Deku.DOM.Attr.Formnovalidate (Formnovalidate(..))
import Deku.DOM.Attr.Formtarget (Formtarget(..))
import Deku.DOM.Attr.Fr (Fr(..))
import Deku.DOM.Attr.Frame (Frame(..))
import Deku.DOM.Attr.Frameborder (Frameborder(..))
import Deku.DOM.Attr.Framespacing (Framespacing(..))
import Deku.DOM.Attr.From (From(..))
import Deku.DOM.Attr.Fx (Fx(..))
import Deku.DOM.Attr.Fy (Fy(..))
import Deku.DOM.Attr.GradientTransform (GradientTransform(..))
import Deku.DOM.Attr.GradientUnits (GradientUnits(..))
import Deku.DOM.Attr.Headers (Headers(..))
import Deku.DOM.Attr.Height (Height(..))
import Deku.DOM.Attr.High (High(..))
import Deku.DOM.Attr.Href (Href(..))
import Deku.DOM.Attr.Hreflang (Hreflang(..))
import Deku.DOM.Attr.Hspace (Hspace(..))
import Deku.DOM.Attr.HttpEquiv (HttpEquiv(..))
import Deku.DOM.Attr.Imagesizes (Imagesizes(..))
import Deku.DOM.Attr.Imagesrcset (Imagesrcset(..))
import Deku.DOM.Attr.In (In(..))
import Deku.DOM.Attr.In2 (In2(..))
import Deku.DOM.Attr.Integrity (Integrity(..))
import Deku.DOM.Attr.Intercept (Intercept(..))
import Deku.DOM.Attr.Ismap (Ismap(..))
import Deku.DOM.Attr.K1 (K1(..))
import Deku.DOM.Attr.K2 (K2(..))
import Deku.DOM.Attr.K3 (K3(..))
import Deku.DOM.Attr.K4 (K4(..))
import Deku.DOM.Attr.KernelMatrix (KernelMatrix(..))
import Deku.DOM.Attr.KernelUnitLength (KernelUnitLength(..))
import Deku.DOM.Attr.KeyPoints (KeyPoints(..))
import Deku.DOM.Attr.KeySplines (KeySplines(..))
import Deku.DOM.Attr.KeyTimes (KeyTimes(..))
import Deku.DOM.Attr.Kind (Kind(..))
import Deku.DOM.Attr.Label (Label(..))
import Deku.DOM.Attr.Language (Language(..))
import Deku.DOM.Attr.Leftmargin (Leftmargin(..))
import Deku.DOM.Attr.LengthAdjust (LengthAdjust(..))
import Deku.DOM.Attr.LetterSpacing (LetterSpacing(..))
import Deku.DOM.Attr.LimitingConeAngle (LimitingConeAngle(..))
import Deku.DOM.Attr.Link (Link(..))
import Deku.DOM.Attr.List (List(..))
import Deku.DOM.Attr.Loading (Loading(..))
import Deku.DOM.Attr.Longdesc (Longdesc(..))
import Deku.DOM.Attr.Loop (Loop(..))
import Deku.DOM.Attr.Low (Low(..))
import Deku.DOM.Attr.Lowsrc (Lowsrc(..))
import Deku.DOM.Attr.Manifest (Manifest(..))
import Deku.DOM.Attr.Marginheight (Marginheight(..))
import Deku.DOM.Attr.Marginwidth (Marginwidth(..))
import Deku.DOM.Attr.MarkerHeight (MarkerHeight(..))
import Deku.DOM.Attr.MarkerUnits (MarkerUnits(..))
import Deku.DOM.Attr.MarkerWidth (MarkerWidth(..))
import Deku.DOM.Attr.Mask (Mask(..))
import Deku.DOM.Attr.Max (Max(..))
import Deku.DOM.Attr.Maxlength (Maxlength(..))
import Deku.DOM.Attr.Media (Media(..))
import Deku.DOM.Attr.Method (Method(..))
import Deku.DOM.Attr.Methods (Methods(..))
import Deku.DOM.Attr.Min (Min(..))
import Deku.DOM.Attr.Minlength (Minlength(..))
import Deku.DOM.Attr.Mode (Mode(..))
import Deku.DOM.Attr.Multiple (Multiple(..))
import Deku.DOM.Attr.Muted (Muted(..))
import Deku.DOM.Attr.Name (Name(..))
import Deku.DOM.Attr.NoComposite (NoComposite(..))
import Deku.DOM.Attr.Nohref (Nohref(..))
import Deku.DOM.Attr.Nomodule (Nomodule(..))
import Deku.DOM.Attr.Noshade (Noshade(..))
import Deku.DOM.Attr.Novalidate (Novalidate(..))
import Deku.DOM.Attr.Nowrap (Nowrap(..))
import Deku.DOM.Attr.NumOctaves (NumOctaves(..))
import Deku.DOM.Attr.Offset (Offset(..))
import Deku.DOM.Attr.Onbegin (Onbegin(..))
import Deku.DOM.Attr.Onend (Onend(..))
import Deku.DOM.Attr.Onrepeat (Onrepeat(..))
import Deku.DOM.Attr.Opacity (Opacity(..))
import Deku.DOM.Attr.Open (Open(..))
import Deku.DOM.Attr.Operator (Operator(..))
import Deku.DOM.Attr.Optimum (Optimum(..))
import Deku.DOM.Attr.Order (Order(..))
import Deku.DOM.Attr.Orient (Orient(..))
import Deku.DOM.Attr.Origin (Origin(..))
import Deku.DOM.Attr.Overflow (Overflow(..))
import Deku.DOM.Attr.Path (Path(..))
import Deku.DOM.Attr.PathLength (PathLength(..))
import Deku.DOM.Attr.Pattern (Pattern(..))
import Deku.DOM.Attr.PatternContentUnits (PatternContentUnits(..))
import Deku.DOM.Attr.PatternTransform (PatternTransform(..))
import Deku.DOM.Attr.PatternUnits (PatternUnits(..))
import Deku.DOM.Attr.Ping (Ping(..))
import Deku.DOM.Attr.Placeholder (Placeholder(..))
import Deku.DOM.Attr.Playsinline (Playsinline(..))
import Deku.DOM.Attr.Points (Points(..))
import Deku.DOM.Attr.PointsAtX (PointsAtX(..))
import Deku.DOM.Attr.PointsAtY (PointsAtY(..))
import Deku.DOM.Attr.PointsAtZ (PointsAtZ(..))
import Deku.DOM.Attr.Poster (Poster(..))
import Deku.DOM.Attr.Preload (Preload(..))
import Deku.DOM.Attr.PreserveAlpha (PreserveAlpha(..))
import Deku.DOM.Attr.PreserveAspectRatio (PreserveAspectRatio(..))
import Deku.DOM.Attr.PrimitiveUnits (PrimitiveUnits(..))
import Deku.DOM.Attr.Profile (Profile(..))
import Deku.DOM.Attr.R (R(..))
import Deku.DOM.Attr.Radius (Radius(..))
import Deku.DOM.Attr.Readonly (Readonly(..))
import Deku.DOM.Attr.RefX (RefX(..))
import Deku.DOM.Attr.RefY (RefY(..))
import Deku.DOM.Attr.Referrerpolicy (Referrerpolicy(..))
import Deku.DOM.Attr.Rel (Rel(..))
import Deku.DOM.Attr.RepeatCount (RepeatCount(..))
import Deku.DOM.Attr.RepeatDur (RepeatDur(..))
import Deku.DOM.Attr.Required (Required(..))
import Deku.DOM.Attr.RequiredExtensions (RequiredExtensions(..))
import Deku.DOM.Attr.Restart (Restart(..))
import Deku.DOM.Attr.Result (Result(..))
import Deku.DOM.Attr.Rev (Rev(..))
import Deku.DOM.Attr.Reversed (Reversed(..))
import Deku.DOM.Attr.Rightmargin (Rightmargin(..))
import Deku.DOM.Attr.Rotate (Rotate(..))
import Deku.DOM.Attr.Rows (Rows(..))
import Deku.DOM.Attr.Rowspan (Rowspan(..))
import Deku.DOM.Attr.Rules (Rules(..))
import Deku.DOM.Attr.Sandbox (Sandbox(..))
import Deku.DOM.Attr.Scale (Scale(..))
import Deku.DOM.Attr.Scheme (Scheme(..))
import Deku.DOM.Attr.Scope (Scope(..))
import Deku.DOM.Attr.Scrolling (Scrolling(..))
import Deku.DOM.Attr.Seed (Seed(..))
import Deku.DOM.Attr.Selected (Selected(..))
import Deku.DOM.Attr.Shape (Shape(..))
import Deku.DOM.Attr.Side (Side(..))
import Deku.DOM.Attr.Size (Size(..))
import Deku.DOM.Attr.Sizes (Sizes(..))
import Deku.DOM.Attr.Slope (Slope(..))
import Deku.DOM.Attr.Spacing (Spacing(..))
import Deku.DOM.Attr.Span (Span(..))
import Deku.DOM.Attr.SpecularConstant (SpecularConstant(..))
import Deku.DOM.Attr.SpecularExponent (SpecularExponent(..))
import Deku.DOM.Attr.SpreadMethod (SpreadMethod(..))
import Deku.DOM.Attr.Src (Src(..))
import Deku.DOM.Attr.Srcdoc (Srcdoc(..))
import Deku.DOM.Attr.Srclang (Srclang(..))
import Deku.DOM.Attr.Srcset (Srcset(..))
import Deku.DOM.Attr.Standby (Standby(..))
import Deku.DOM.Attr.Start (Start(..))
import Deku.DOM.Attr.StartOffset (StartOffset(..))
import Deku.DOM.Attr.StdDeviation (StdDeviation(..))
import Deku.DOM.Attr.Step (Step(..))
import Deku.DOM.Attr.StitchTiles (StitchTiles(..))
import Deku.DOM.Attr.StopColor (StopColor(..))
import Deku.DOM.Attr.StopOpacity (StopOpacity(..))
import Deku.DOM.Attr.Summary (Summary(..))
import Deku.DOM.Attr.SurfaceScale (SurfaceScale(..))
import Deku.DOM.Attr.SystemLanguage (SystemLanguage(..))
import Deku.DOM.Attr.TableValues (TableValues(..))
import Deku.DOM.Attr.Target (Target(..))
import Deku.DOM.Attr.TargetX (TargetX(..))
import Deku.DOM.Attr.TargetY (TargetY(..))
import Deku.DOM.Attr.Text (Text(..))
import Deku.DOM.Attr.TextDecoration (TextDecoration(..))
import Deku.DOM.Attr.TextLength (TextLength(..))
import Deku.DOM.Attr.Title (Title(..))
import Deku.DOM.Attr.To (To(..))
import Deku.DOM.Attr.Topmargin (Topmargin(..))
import Deku.DOM.Attr.Transform (Transform(..))
import Deku.DOM.Attr.TransformOrigin (TransformOrigin(..))
import Deku.DOM.Attr.Truespeed (Truespeed(..))
import Deku.DOM.Attr.Type (Type(..))
import Deku.DOM.Attr.Typemustmatch (Typemustmatch(..))
import Deku.DOM.Attr.UnicodeBidi (UnicodeBidi(..))
import Deku.DOM.Attr.Urn (Urn(..))
import Deku.DOM.Attr.Usemap (Usemap(..))
import Deku.DOM.Attr.Valign (Valign(..))
import Deku.DOM.Attr.Value (Value(..))
import Deku.DOM.Attr.Values (Values(..))
import Deku.DOM.Attr.Version (Version(..))
import Deku.DOM.Attr.ViewBox (ViewBox(..))
import Deku.DOM.Attr.Visibility (Visibility(..))
import Deku.DOM.Attr.Vlink (Vlink(..))
import Deku.DOM.Attr.Vspace (Vspace(..))
import Deku.DOM.Attr.Width (Width(..))
import Deku.DOM.Attr.WordSpacing (WordSpacing(..))
import Deku.DOM.Attr.Wrap (Wrap(..))
import Deku.DOM.Attr.WritingMode (WritingMode(..))
import Deku.DOM.Attr.X (X(..))
import Deku.DOM.Attr.X1 (X1(..))
import Deku.DOM.Attr.X2 (X2(..))
import Deku.DOM.Attr.XChannelSelector (XChannelSelector(..))
import Deku.DOM.Attr.XlinkHref (XlinkHref(..))
import Deku.DOM.Attr.XlinkTitle (XlinkTitle(..))
import Deku.DOM.Attr.Y (Y(..))
import Deku.DOM.Attr.Y1 (Y1(..))
import Deku.DOM.Attr.Y2 (Y2(..))
import Deku.DOM.Attr.YChannelSelector (YChannelSelector(..))
import Deku.DOM.Attr.Z (Z(..))
import Deku.DOM.Attr.AriaValuetext (AriaValuetext(..))
import Deku.DOM.Attr.AriaValuenow (AriaValuenow(..))
import Deku.DOM.Attr.AriaValuemin (AriaValuemin(..))
import Deku.DOM.Attr.AriaValuemax (AriaValuemax(..))
import Deku.DOM.Attr.AriaSort (AriaSort(..))
import Deku.DOM.Attr.AriaSetsize (AriaSetsize(..))
import Deku.DOM.Attr.AriaSelected (AriaSelected(..))
import Deku.DOM.Attr.AriaRowspan (AriaRowspan(..))
import Deku.DOM.Attr.AriaRowindextext (AriaRowindextext(..))
import Deku.DOM.Attr.AriaRowindex (AriaRowindex(..))
import Deku.DOM.Attr.AriaRowcount (AriaRowcount(..))
import Deku.DOM.Attr.AriaRoledescription (AriaRoledescription(..))
import Deku.DOM.Attr.AriaRequired (AriaRequired(..))
import Deku.DOM.Attr.AriaReadonly (AriaReadonly(..))
import Deku.DOM.Attr.AriaPressed (AriaPressed(..))
import Deku.DOM.Attr.AriaPosinset (AriaPosinset(..))
import Deku.DOM.Attr.AriaPlaceholder (AriaPlaceholder(..))
import Deku.DOM.Attr.AriaOwns (AriaOwns(..))
import Deku.DOM.Attr.AriaOrientation (AriaOrientation(..))
import Deku.DOM.Attr.AriaMultiselectable (AriaMultiselectable(..))
import Deku.DOM.Attr.AriaMultiline (AriaMultiline(..))
import Deku.DOM.Attr.AriaModal (AriaModal(..))
import Deku.DOM.Attr.AriaLive (AriaLive(..))
import Deku.DOM.Attr.AriaLevel (AriaLevel(..))
import Deku.DOM.Attr.AriaLabelledby (AriaLabelledby(..))
import Deku.DOM.Attr.AriaLabel (AriaLabel(..))
import Deku.DOM.Attr.AriaKeyshortcuts (AriaKeyshortcuts(..))
import Deku.DOM.Attr.AriaInvalid (AriaInvalid(..))
import Deku.DOM.Attr.AriaHidden (AriaHidden(..))
import Deku.DOM.Attr.AriaHaspopup (AriaHaspopup(..))
import Deku.DOM.Attr.AriaFlowto (AriaFlowto(..))
import Deku.DOM.Attr.AriaExpanded (AriaExpanded(..))
import Deku.DOM.Attr.AriaErrormessage (AriaErrormessage(..))
import Deku.DOM.Attr.AriaDisabled (AriaDisabled(..))
import Deku.DOM.Attr.AriaDetails (AriaDetails(..))
import Deku.DOM.Attr.AriaDescription (AriaDescription(..))
import Deku.DOM.Attr.AriaDescribedby (AriaDescribedby(..))
import Deku.DOM.Attr.AriaCurrent (AriaCurrent(..))
import Deku.DOM.Attr.AriaControls (AriaControls(..))
import Deku.DOM.Attr.AriaColspan (AriaColspan(..))
import Deku.DOM.Attr.AriaColindextext (AriaColindextext(..))
import Deku.DOM.Attr.AriaColindex (AriaColindex(..))
import Deku.DOM.Attr.AriaColcount (AriaColcount(..))
import Deku.DOM.Attr.AriaChecked (AriaChecked(..))
import Deku.DOM.Attr.AriaBusy (AriaBusy(..))
import Deku.DOM.Attr.AriaAutocomplete (AriaAutocomplete(..))
import Deku.DOM.Attr.AriaAtomic (AriaAtomic(..))
import Deku.DOM.Attr.AriaActivedescendant (AriaActivedescendant(..))
import Deku.DOM.Attr.Role (Role(..))
import Deku.DOM.Attr.Slot (Slot(..))
import Deku.DOM.Attr.Id (Id(..))
import Deku.DOM.Attr.Class (Class(..))
import Deku.DOM.Attr.OnAnimationcancel (OnAnimationcancel(..))
import Deku.DOM.Attr.OnAnimationend (OnAnimationend(..))
import Deku.DOM.Attr.OnAnimationiteration (OnAnimationiteration(..))
import Deku.DOM.Attr.OnAnimationstart (OnAnimationstart(..))
import Deku.DOM.Attr.OnTransitioncancel (OnTransitioncancel(..))
import Deku.DOM.Attr.OnTransitionend (OnTransitionend(..))
import Deku.DOM.Attr.OnTransitionstart (OnTransitionstart(..))
import Deku.DOM.Attr.OnTransitionrun (OnTransitionrun(..))
import Deku.DOM.Attr.OnSelectionchange (OnSelectionchange(..))
import Deku.DOM.Attr.OnSelectstart (OnSelectstart(..))
import Deku.DOM.Attr.OnTouchcancel (OnTouchcancel(..))
import Deku.DOM.Attr.OnTouchmove (OnTouchmove(..))
import Deku.DOM.Attr.OnTouchend (OnTouchend(..))
import Deku.DOM.Attr.OnTouchstart (OnTouchstart(..))
import Deku.DOM.Attr.OnLostpointercapture (OnLostpointercapture(..))
import Deku.DOM.Attr.OnGotpointercapture (OnGotpointercapture(..))
import Deku.DOM.Attr.OnPointerleave (OnPointerleave(..))
import Deku.DOM.Attr.OnPointerout (OnPointerout(..))
import Deku.DOM.Attr.OnPointercancel (OnPointercancel(..))
import Deku.DOM.Attr.OnPointerup (OnPointerup(..))
import Deku.DOM.Attr.OnPointerrawupdate (OnPointerrawupdate(..))
import Deku.DOM.Attr.OnPointermove (OnPointermove(..))
import Deku.DOM.Attr.OnPointerdown (OnPointerdown(..))
import Deku.DOM.Attr.OnPointerenter (OnPointerenter(..))
import Deku.DOM.Attr.OnPointerover (OnPointerover(..))
import Deku.DOM.Attr.OnScrollend (OnScrollend(..))
import Deku.DOM.Attr.OnScroll (OnScroll(..))
import Deku.DOM.Attr.OnResize (OnResize(..))
import Deku.DOM.Attr.OnLoad (OnLoad(..))
import Deku.DOM.Attr.OnFocus (OnFocus(..))
import Deku.DOM.Attr.OnError (OnError(..))
import Deku.DOM.Attr.OnBlur (OnBlur(..))
import Deku.DOM.Attr.OnWheel (OnWheel(..))
import Deku.DOM.Attr.OnWebkittransitionend (OnWebkittransitionend(..))
import Deku.DOM.Attr.OnWebkitanimationstart (OnWebkitanimationstart(..))
import Deku.DOM.Attr.OnWebkitanimationiteration (OnWebkitanimationiteration(..))
import Deku.DOM.Attr.OnWebkitanimationend (OnWebkitanimationend(..))
import Deku.DOM.Attr.OnWaiting (OnWaiting(..))
import Deku.DOM.Attr.OnVolumechange (OnVolumechange(..))
import Deku.DOM.Attr.OnToggle (OnToggle(..))
import Deku.DOM.Attr.OnTimeupdate (OnTimeupdate(..))
import Deku.DOM.Attr.OnSuspend (OnSuspend(..))
import Deku.DOM.Attr.OnSubmit (OnSubmit(..))
import Deku.DOM.Attr.OnStalled (OnStalled(..))
import Deku.DOM.Attr.OnSlotchange (OnSlotchange(..))
import Deku.DOM.Attr.OnSelect (OnSelect(..))
import Deku.DOM.Attr.OnSeeking (OnSeeking(..))
import Deku.DOM.Attr.OnSeeked (OnSeeked(..))
import Deku.DOM.Attr.OnSecuritypolicyviolation (OnSecuritypolicyviolation(..))
import Deku.DOM.Attr.OnReset (OnReset(..))
import Deku.DOM.Attr.OnRatechange (OnRatechange(..))
import Deku.DOM.Attr.OnProgress (OnProgress(..))
import Deku.DOM.Attr.OnPlaying (OnPlaying(..))
import Deku.DOM.Attr.OnPlay (OnPlay(..))
import Deku.DOM.Attr.OnPause (OnPause(..))
import Deku.DOM.Attr.OnPaste (OnPaste(..))
import Deku.DOM.Attr.OnMouseup (OnMouseup(..))
import Deku.DOM.Attr.OnMouseover (OnMouseover(..))
import Deku.DOM.Attr.OnMouseout (OnMouseout(..))
import Deku.DOM.Attr.OnMousemove (OnMousemove(..))
import Deku.DOM.Attr.OnMouseleave (OnMouseleave(..))
import Deku.DOM.Attr.OnMouseenter (OnMouseenter(..))
import Deku.DOM.Attr.OnMousedown (OnMousedown(..))
import Deku.DOM.Attr.OnLoadstart (OnLoadstart(..))
import Deku.DOM.Attr.OnLoadedmetadata (OnLoadedmetadata(..))
import Deku.DOM.Attr.OnLoadeddata (OnLoadeddata(..))
import Deku.DOM.Attr.OnKeyup (OnKeyup(..))
import Deku.DOM.Attr.OnKeypress (OnKeypress(..))
import Deku.DOM.Attr.OnKeydown (OnKeydown(..))
import Deku.DOM.Attr.OnInvalid (OnInvalid(..))
import Deku.DOM.Attr.OnInput (OnInput(..))
import Deku.DOM.Attr.OnFormdata (OnFormdata(..))
import Deku.DOM.Attr.OnEnded (OnEnded(..))
import Deku.DOM.Attr.OnEmptied (OnEmptied(..))
import Deku.DOM.Attr.OnDurationchange (OnDurationchange(..))
import Deku.DOM.Attr.OnDrop (OnDrop(..))
import Deku.DOM.Attr.OnDragstart (OnDragstart(..))
import Deku.DOM.Attr.OnDragover (OnDragover(..))
import Deku.DOM.Attr.OnDragleave (OnDragleave(..))
import Deku.DOM.Attr.OnDragenter (OnDragenter(..))
import Deku.DOM.Attr.OnDragend (OnDragend(..))
import Deku.DOM.Attr.OnDrag (OnDrag(..))
import Deku.DOM.Attr.OnDblclick (OnDblclick(..))
import Deku.DOM.Attr.OnCut (OnCut(..))
import Deku.DOM.Attr.OnCuechange (OnCuechange(..))
import Deku.DOM.Attr.OnCopy (OnCopy(..))
import Deku.DOM.Attr.OnContextrestored (OnContextrestored(..))
import Deku.DOM.Attr.OnContextmenu (OnContextmenu(..))
import Deku.DOM.Attr.OnContextlost (OnContextlost(..))
import Deku.DOM.Attr.OnClose (OnClose(..))
import Deku.DOM.Attr.OnClick (OnClick(..))
import Deku.DOM.Attr.OnChange (OnChange(..))
import Deku.DOM.Attr.OnCanplaythrough (OnCanplaythrough(..))
import Deku.DOM.Attr.OnCanplay (OnCanplay(..))
import Deku.DOM.Attr.OnCancel (OnCancel(..))
import Deku.DOM.Attr.OnBeforetoggle (OnBeforetoggle(..))
import Deku.DOM.Attr.OnBeforematch (OnBeforematch(..))
import Deku.DOM.Attr.OnBeforeinput (OnBeforeinput(..))
import Deku.DOM.Attr.OnAuxclick (OnAuxclick(..))
import Deku.DOM.Attr.OnAbort (OnAbort(..))
import Deku.DOM.Attr.Popovertargetaction (Popovertargetaction(..))
import Deku.DOM.Attr.Popovertarget (Popovertarget(..))
import Deku.DOM.Attr.Popover (Popover(..))
import Deku.DOM.Attr.Draggable (Draggable(..))
import Deku.DOM.Attr.Enterkeyhint (Enterkeyhint(..))
import Deku.DOM.Attr.Inputmode (Inputmode(..))
import Deku.DOM.Attr.Autocapitalize (Autocapitalize(..))
import Deku.DOM.Attr.Spellcheck (Spellcheck(..))
import Deku.DOM.Attr.Contenteditable (Contenteditable(..))
import Deku.DOM.Attr.Accesskey (Accesskey(..))
import Deku.DOM.Attr.Autofocus (Autofocus(..))
import Deku.DOM.Attr.Hidden (Hidden(..))
import Deku.DOM.Attr.Itemprop (Itemprop(..))
import Deku.DOM.Attr.Itemref (Itemref(..))
import Deku.DOM.Attr.Itemid (Itemid(..))
import Deku.DOM.Attr.Itemtype (Itemtype(..))
import Deku.DOM.Attr.Itemscope (Itemscope(..))
import Deku.DOM.Attr.Is (Is(..))
import Deku.DOM.Attr.Style (Style(..))
import Deku.DOM.Attr.Dir (Dir(..))
import Deku.DOM.Attr.Translate (Translate(..))
import Deku.DOM.Attr.Lang (Lang(..))
import Deku.DOM.Attr.Tabindex (Tabindex(..))
import Deku.DOM.Attr.Nonce (Nonce(..))
import Deku.DOM.Attr.LightingColor (LightingColor(..))
import Deku.DOM.Attr.ColorInterpolationFilters (ColorInterpolationFilters(..))
import Deku.DOM.Attr.FloodOpacity (FloodOpacity(..))
import Deku.DOM.Attr.FloodColor (FloodColor(..))
import Deku.DOM.Attr.Filter (Filter(..))
import Deku.DOM.Attr.StrokeOpacity (StrokeOpacity(..))
import Deku.DOM.Attr.Stroke (Stroke(..))
import Deku.DOM.Attr.StrokeRepeat (StrokeRepeat(..))
import Deku.DOM.Attr.StrokeSize (StrokeSize(..))
import Deku.DOM.Attr.StrokePosition (StrokePosition(..))
import Deku.DOM.Attr.StrokeOrigin (StrokeOrigin(..))
import Deku.DOM.Attr.StrokeImage (StrokeImage(..))
import Deku.DOM.Attr.StrokeColor (StrokeColor(..))
import Deku.DOM.Attr.StrokeDashJustify (StrokeDashJustify(..))
import Deku.DOM.Attr.StrokeDashCorner (StrokeDashCorner(..))
import Deku.DOM.Attr.StrokeDashoffset (StrokeDashoffset(..))
import Deku.DOM.Attr.StrokeDasharray (StrokeDasharray(..))
import Deku.DOM.Attr.StrokeBreak (StrokeBreak(..))
import Deku.DOM.Attr.StrokeMiterlimit (StrokeMiterlimit(..))
import Deku.DOM.Attr.StrokeLinejoin (StrokeLinejoin(..))
import Deku.DOM.Attr.StrokeLinecap (StrokeLinecap(..))
import Deku.DOM.Attr.StrokeAlign (StrokeAlign(..))
import Deku.DOM.Attr.StrokeWidth (StrokeWidth(..))
import Deku.DOM.Attr.FillOpacity (FillOpacity(..))
import Deku.DOM.Attr.FillRepeat (FillRepeat(..))
import Deku.DOM.Attr.FillSize (FillSize(..))
import Deku.DOM.Attr.FillPosition (FillPosition(..))
import Deku.DOM.Attr.FillOrigin (FillOrigin(..))
import Deku.DOM.Attr.FillImage (FillImage(..))
import Deku.DOM.Attr.FillColor (FillColor(..))
import Deku.DOM.Attr.FillBreak (FillBreak(..))
import Deku.DOM.Attr.FillRule (FillRule(..))
import Deku.DOM.Attr.PointerEvents (PointerEvents(..))
import Deku.DOM.Attr.ImageRendering (ImageRendering(..))
import Deku.DOM.Attr.TextRendering (TextRendering(..))
import Deku.DOM.Attr.ShapeRendering (ShapeRendering(..))
import Deku.DOM.Attr.ColorInterpolation (ColorInterpolation(..))
import Deku.DOM.Attr.PaintOrder (PaintOrder(..))
import Deku.DOM.Attr.Marker (Marker(..))
import Deku.DOM.Attr.MarkerEnd (MarkerEnd(..))
import Deku.DOM.Attr.MarkerMid (MarkerMid(..))
import Deku.DOM.Attr.MarkerStart (MarkerStart(..))
import Deku.DOM.Attr.TextAnchor (TextAnchor(..))
import Deku.DOM.Attr.ShapeMargin (ShapeMargin(..))
import Deku.DOM.Attr.ShapeSubtract (ShapeSubtract(..))
import Deku.DOM.Attr.ShapeInside (ShapeInside(..))
import Deku.DOM.Attr.InlineSize (InlineSize(..))
import Deku.DOM.Attr.D (D(..))
import Deku.DOM.Attr.VectorEffect (VectorEffect(..))
import Deku.DOM.Attr.Ry (Ry(..))
import Deku.DOM.Attr.Rx (Rx(..))
import Effect as Effect
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import Unsafe.Coerce as Unsafe.Coerce
import Web.HTML.HTMLAnchorElement (HTMLAnchorElement) as Web
import Web.HTML.HTMLAreaElement (HTMLAreaElement) as Web
import Web.HTML.HTMLAudioElement (HTMLAudioElement) as Web
import Web.HTML.HTMLBaseElement (HTMLBaseElement) as Web
import Web.HTML.HTMLBodyElement (HTMLBodyElement) as Web
import Web.HTML.HTMLBRElement (HTMLBRElement) as Web
import Web.HTML.HTMLButtonElement (HTMLButtonElement) as Web
import Web.HTML.HTMLCanvasElement (HTMLCanvasElement) as Web
import Web.HTML.HTMLDivElement (HTMLDivElement) as Web
import Web.HTML.HTMLEmbedElement (HTMLEmbedElement) as Web
import Web.HTML.HTMLFormElement (HTMLFormElement) as Web
import Web.HTML.HTMLHeadElement (HTMLHeadElement) as Web
import Web.HTML.HTMLHRElement (HTMLHRElement) as Web
import Web.HTML.HTMLHtmlElement (HTMLHtmlElement) as Web
import Web.HTML.HTMLInputElement (HTMLInputElement) as Web
import Web.HTML.HTMLLabelElement (HTMLLabelElement) as Web
import Web.HTML.HTMLLegendElement (HTMLLegendElement) as Web
import Web.HTML.HTMLLinkElement (HTMLLinkElement) as Web
import Web.HTML.HTMLMapElement (HTMLMapElement) as Web
import Web.HTML.HTMLMetaElement (HTMLMetaElement) as Web
import Web.HTML.HTMLMeterElement (HTMLMeterElement) as Web
import Web.HTML.HTMLObjectElement (HTMLObjectElement) as Web
import Web.HTML.HTMLOptionElement (HTMLOptionElement) as Web
import Web.HTML.HTMLOutputElement (HTMLOutputElement) as Web
import Web.HTML.HTMLParagraphElement (HTMLParagraphElement) as Web
import Web.HTML.HTMLParamElement (HTMLParamElement) as Web
import Web.HTML.HTMLPreElement (HTMLPreElement) as Web
import Web.HTML.HTMLProgressElement (HTMLProgressElement) as Web
import Web.HTML.HTMLScriptElement (HTMLScriptElement) as Web
import Web.HTML.HTMLSelectElement (HTMLSelectElement) as Web
import Web.HTML.HTMLSourceElement (HTMLSourceElement) as Web
import Web.HTML.HTMLSpanElement (HTMLSpanElement) as Web
import Web.HTML.HTMLStyleElement (HTMLStyleElement) as Web
import Web.HTML.HTMLTableElement (HTMLTableElement) as Web
import Web.HTML.HTMLTableDataCellElement (HTMLTableDataCellElement) as Web
import Web.HTML.HTMLTemplateElement (HTMLTemplateElement) as Web
import Web.HTML.HTMLTextAreaElement (HTMLTextAreaElement) as Web
import Web.HTML.HTMLTimeElement (HTMLTimeElement) as Web
import Web.HTML.HTMLTitleElement (HTMLTitleElement) as Web
import Web.HTML.HTMLTrackElement (HTMLTrackElement) as Web
import Web.HTML.HTMLVideoElement (HTMLVideoElement) as Web
import Web.DOM.Element (Element) as Web
import Type.Proxy (Proxy)
import Deku.Control as DC
import FRP.Event as FRP.Event
import Deku.Core (Nut)
import Control.Category ((<<<))
import Prim hiding (Type, Char)

-- | Creates a special event where an Deku element can have its raw DOM element
-- | injected into a closure. All bets are off type-safety wise. This is useful
-- | when you need to manipualte the element itself, like for example attaching
-- | properties to it, etc.
data Self = Self

instance Deku.Attribute.Attr anything Self (Web.Element -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

-- | A slightly less permissive version of `Self` that associates Deku Elements to
-- | the primitive element definitions form `purescript-web`. For example, `A_` from `deku`
-- | gets translated to `HTMLAnchorElement` from `purescript-web`, etc.
data SelfT = SelfT

-- | Unsafely create a custom element. This is useful when using Stencil-based
-- | frameworks like Ionic in Deku.
unsafeCustomElement
  :: forall element
   . String
  -> Proxy element
  -> Array (FRP.Event.Event (Deku.Attribute.Attribute element))
  -> Array Nut
  -> Nut
unsafeCustomElement name _ = DC.elementify2 name

class TagToDeku (tag :: Symbol) (deku :: Prim.Type) | tag -> deku

instance TagToDeku "html" Html_
instance TagToDeku "head" Head_
instance TagToDeku "title" Title_
instance TagToDeku "base" Base_
instance TagToDeku "link" Link_
instance TagToDeku "meta" Meta_
instance TagToDeku "style" Style_
instance TagToDeku "body" Body_
instance TagToDeku "article" Article_
instance TagToDeku "section" Section_
instance TagToDeku "nav" Nav_
instance TagToDeku "aside" Aside_
instance TagToDeku "h1" H1_
instance TagToDeku "h2" H2_
instance TagToDeku "h3" H3_
instance TagToDeku "h4" H4_
instance TagToDeku "h5" H5_
instance TagToDeku "h6" H6_
instance TagToDeku "hgroup" Hgroup_
instance TagToDeku "header" Header_
instance TagToDeku "footer" Footer_
instance TagToDeku "address" Address_
instance TagToDeku "p" P_
instance TagToDeku "hr" Hr_
instance TagToDeku "pre" Pre_
instance TagToDeku "blockquote" Blockquote_
instance TagToDeku "ol" Ol_
instance TagToDeku "ul" Ul_
instance TagToDeku "menu" Menu_
instance TagToDeku "li" Li_
instance TagToDeku "dl" Dl_
instance TagToDeku "dt" Dt_
instance TagToDeku "dd" Dd_
instance TagToDeku "figure" Figure_
instance TagToDeku "figcaption" Figcaption_
instance TagToDeku "main" Main_
instance TagToDeku "search" Search_
instance TagToDeku "div" Div_
instance TagToDeku "a" A_
instance TagToDeku "em" Em_
instance TagToDeku "strong" Strong_
instance TagToDeku "small" Small_
instance TagToDeku "s" S_
instance TagToDeku "cite" Cite_
instance TagToDeku "q" Q_
instance TagToDeku "dfn" Dfn_
instance TagToDeku "abbr" Abbr_
instance TagToDeku "ruby" Ruby_
instance TagToDeku "rt" Rt_
instance TagToDeku "rp" Rp_
instance TagToDeku "data" Xdata_
instance TagToDeku "time" Time_
instance TagToDeku "code" Code_
instance TagToDeku "var" Var_
instance TagToDeku "samp" Samp_
instance TagToDeku "kbd" Kbd_
instance TagToDeku "sub" Sub_
instance TagToDeku "sup" Sup_
instance TagToDeku "i" I_
instance TagToDeku "b" B_
instance TagToDeku "u" U_
instance TagToDeku "mark" Mark_
instance TagToDeku "bdi" Bdi_
instance TagToDeku "bdo" Bdo_
instance TagToDeku "span" Span_
instance TagToDeku "br" Br_
instance TagToDeku "wbr" Wbr_
instance TagToDeku "ins" Ins_
instance TagToDeku "del" Del_
instance TagToDeku "picture" Picture_
instance TagToDeku "source" Source_
instance TagToDeku "img" Img_
instance TagToDeku "iframe" Iframe_
instance TagToDeku "embed" Embed_
instance TagToDeku "object" Object_
instance TagToDeku "video" Video_
instance TagToDeku "audio" Audio_
instance TagToDeku "track" Track_
instance TagToDeku "map" Map_
instance TagToDeku "area" Area_
instance TagToDeku "table" Table_
instance TagToDeku "caption" Caption_
instance TagToDeku "colgroup" Colgroup_
instance TagToDeku "col" Col_
instance TagToDeku "tbody" Tbody_
instance TagToDeku "thead" Thead_
instance TagToDeku "tfoot" Tfoot_
instance TagToDeku "tr" Tr_
instance TagToDeku "td" Td_
instance TagToDeku "th" Th_
instance TagToDeku "form" Form_
instance TagToDeku "label" Label_
instance TagToDeku "input" Input_
instance TagToDeku "button" Button_
instance TagToDeku "select" Select_
instance TagToDeku "datalist" Datalist_
instance TagToDeku "optgroup" Optgroup_
instance TagToDeku "option" Option_
instance TagToDeku "textarea" Textarea_
instance TagToDeku "output" Output_
instance TagToDeku "progress" Progress_
instance TagToDeku "meter" Meter_
instance TagToDeku "fieldset" Fieldset_
instance TagToDeku "legend" Legend_
instance TagToDeku "details" Details_
instance TagToDeku "summary" Summary_
instance TagToDeku "dialog" Dialog_
instance TagToDeku "script" Script_
instance TagToDeku "noscript" Noscript_
instance TagToDeku "template" Template_
instance TagToDeku "slot" Slot_
instance TagToDeku "canvas" Canvas_
instance TagToDeku "applet" Applet_
instance TagToDeku "acronym" Acronym_
instance TagToDeku "bgsound" Bgsound_
instance TagToDeku "dir" Dir_
instance TagToDeku "noframes" Noframes_
instance TagToDeku "isindex" Isindex_
instance TagToDeku "keygen" Keygen_
instance TagToDeku "listing" Listing_
instance TagToDeku "menuitem" Menuitem_
instance TagToDeku "nextid" Nextid_
instance TagToDeku "noembed" Noembed_
instance TagToDeku "param" Param_
instance TagToDeku "plaintext" Plaintext_
instance TagToDeku "rb" Rb_
instance TagToDeku "rtc" Rtc_
instance TagToDeku "strike" Strike_
instance TagToDeku "xmp" Xmp_
instance TagToDeku "basefont" Basefont_
instance TagToDeku "big" Big_
instance TagToDeku "blink" Blink_
instance TagToDeku "center" Center_
instance TagToDeku "font" Font_
instance TagToDeku "multicol" Multicol_
instance TagToDeku "nobr" Nobr_
instance TagToDeku "spacer" Spacer_
instance TagToDeku "tt" Tt_
instance TagToDeku "marquee" Marquee_
instance TagToDeku "frameset" Frameset_
instance TagToDeku "frame" Frame_
instance TagToDeku "svg" Svg_
instance TagToDeku "g" G_
instance TagToDeku "defs" Defs_
instance TagToDeku "symbol" Symbol_
instance TagToDeku "use" Use_
instance TagToDeku "switch" Switch_
instance TagToDeku "desc" Desc_
instance TagToDeku "metadata" Metadata_
instance TagToDeku "path" Path_
instance TagToDeku "rect" Rect_
instance TagToDeku "circle" Circle_
instance TagToDeku "ellipse" Ellipse_
instance TagToDeku "line" Line_
instance TagToDeku "polyline" Polyline_
instance TagToDeku "polygon" Polygon_
instance TagToDeku "text" Text_
instance TagToDeku "tspan" Tspan_
instance TagToDeku "textPath" TextPath_
instance TagToDeku "image" Image_
instance TagToDeku "foreignObject" ForeignObject_
instance TagToDeku "marker" Marker_
instance TagToDeku "linearGradient" LinearGradient_
instance TagToDeku "radialGradient" RadialGradient_
instance TagToDeku "stop" Stop_
instance TagToDeku "pattern" Pattern_
instance TagToDeku "view" View_
instance TagToDeku "filter-primitive" FilterPrimitive_
instance TagToDeku "filter" Filter_
instance TagToDeku "feBlend" FeBlend_
instance TagToDeku "feColorMatrix" FeColorMatrix_
instance TagToDeku "feComponentTransfer" FeComponentTransfer_
instance TagToDeku "feFuncR" FeFuncR_
instance TagToDeku "feFuncG" FeFuncG_
instance TagToDeku "feFuncB" FeFuncB_
instance TagToDeku "feFuncA" FeFuncA_
instance TagToDeku "feComposite" FeComposite_
instance TagToDeku "feConvolveMatrix" FeConvolveMatrix_
instance TagToDeku "feDiffuseLighting" FeDiffuseLighting_
instance TagToDeku "feDisplacementMap" FeDisplacementMap_
instance TagToDeku "feDropShadow" FeDropShadow_
instance TagToDeku "feFlood" FeFlood_
instance TagToDeku "feGaussianBlur" FeGaussianBlur_
instance TagToDeku "feImage" FeImage_
instance TagToDeku "feMerge" FeMerge_
instance TagToDeku "feMergeNode" FeMergeNode_
instance TagToDeku "feMorphology" FeMorphology_
instance TagToDeku "feOffset" FeOffset_
instance TagToDeku "feSpecularLighting" FeSpecularLighting_
instance TagToDeku "feTile" FeTile_
instance TagToDeku "feTurbulence" FeTurbulence_
instance TagToDeku "feDistantLight" FeDistantLight_
instance TagToDeku "fePointLight" FePointLight_
instance TagToDeku "feSpotLight" FeSpotLight_
instance TagToDeku "animate" Animate_
instance TagToDeku "set" Set_
instance TagToDeku "discard" Discard_
instance TagToDeku "animateMotion" AnimateMotion_
instance TagToDeku "mpath" Mpath_
instance TagToDeku "animateTransform" AnimateTransform_
instance Deku.Attribute.Attr Html_ SelfT (Web.HTMLHtmlElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Head_ SelfT (Web.HTMLHeadElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Title_ SelfT (Web.HTMLTitleElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Base_ SelfT (Web.HTMLBaseElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Link_ SelfT (Web.HTMLLinkElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Meta_ SelfT (Web.HTMLMetaElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Style_ SelfT (Web.HTMLStyleElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Body_ SelfT (Web.HTMLBodyElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr P_ SelfT (Web.HTMLParagraphElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Hr_ SelfT (Web.HTMLHRElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Pre_ SelfT (Web.HTMLPreElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Div_ SelfT (Web.HTMLDivElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr A_ SelfT (Web.HTMLAnchorElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Time_ SelfT (Web.HTMLTimeElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Span_ SelfT (Web.HTMLSpanElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Br_ SelfT (Web.HTMLBRElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Source_ SelfT (Web.HTMLSourceElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Embed_ SelfT (Web.HTMLEmbedElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Object_ SelfT (Web.HTMLObjectElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Video_ SelfT (Web.HTMLVideoElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Audio_ SelfT (Web.HTMLAudioElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Track_ SelfT (Web.HTMLTrackElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Map_ SelfT (Web.HTMLMapElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Area_ SelfT (Web.HTMLAreaElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Table_ SelfT (Web.HTMLTableElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance
  Deku.Attribute.Attr Td_ SelfT (Web.HTMLTableDataCellElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Form_ SelfT (Web.HTMLFormElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Label_ SelfT (Web.HTMLLabelElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Input_ SelfT (Web.HTMLInputElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Button_ SelfT (Web.HTMLButtonElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Select_ SelfT (Web.HTMLSelectElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Option_ SelfT (Web.HTMLOptionElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance
  Deku.Attribute.Attr Textarea_ SelfT (Web.HTMLTextAreaElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Output_ SelfT (Web.HTMLOutputElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance
  Deku.Attribute.Attr Progress_ SelfT (Web.HTMLProgressElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Meter_ SelfT (Web.HTMLMeterElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Legend_ SelfT (Web.HTMLLegendElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Script_ SelfT (Web.HTMLScriptElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance
  Deku.Attribute.Attr Template_ SelfT (Web.HTMLTemplateElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Canvas_ SelfT (Web.HTMLCanvasElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce

instance Deku.Attribute.Attr Param_ SelfT (Web.HTMLParamElement -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "@self@", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.Cb
    <<< Unsafe.Coerce.unsafeCoerce
