module Deku.Graph.DOM
  ( Element
  , unsafeUnElement
  , class TypeToSym
  , AsSubgraph(..)
  , unAsSubGraph
  , (:=)
  , class Attr
  , attr
  , Text
  , TText
  , text
  , unsafeUnText
  , Root
  , TRoot
  , root
  , unsafeUnRoot
  , Subgraph
  , TSubgraph
  , subgraph
  , subgraph1
  , unsafeUnSubgraph
  , XSubgraph'
  , XSubgraph(..)
  , X1Subgraph'
  , X1Subgraph(..)
  , Tumult
  , TTumult
  , tumult
  , unsafeUnTumult
  -- codegen 7
    , Accept_(..)
  , AcceptCharset_(..)
  , Accesskey_(..)
  , Action_(..)
  , Align_(..)
  , Allow_(..)
  , Alt_(..)
  , Async_(..)
  , Autocapitalize_(..)
  , Autocomplete_(..)
  , Autofocus_(..)
  , Autoplay_(..)
  , Background_(..)
  , Bgcolor_(..)
  , Border_(..)
  , Buffered_(..)
  , Capture_(..)
  , Challenge_(..)
  , Charset_(..)
  , Checked_(..)
  , Cite_(..)
  , Class_(..)
  , Code_(..)
  , Codebase_(..)
  , Color_(..)
  , Cols_(..)
  , Colspan_(..)
  , Content_(..)
  , Contenteditable_(..)
  , Contextmenu_(..)
  , Controls_(..)
  , Coords_(..)
  , Crossorigin_(..)
  , Csp_(..)
  , Data_(..)
  , Datetime_(..)
  , Decoding_(..)
  , Default_(..)
  , Defer_(..)
  , Dir_(..)
  , Dirname_(..)
  , Disabled_(..)
  , Download_(..)
  , Draggable_(..)
  , Enctype_(..)
  , Enterkeyhint_(..)
  , For_(..)
  , Form_(..)
  , Formaction_(..)
  , Formenctype_(..)
  , Formmethod_(..)
  , Formnovalidate_(..)
  , Formtarget_(..)
  , Headers_(..)
  , Height_(..)
  , Hidden_(..)
  , High_(..)
  , Href_(..)
  , Hreflang_(..)
  , HttpEquiv_(..)
  , Icon_(..)
  , Id_(..)
  , Importance_(..)
  , Integrity_(..)
  , Intrinsicsize_(..)
  , Inputmode_(..)
  , Ismap_(..)
  , Itemprop_(..)
  , Keytype_(..)
  , Kind_(..)
  , Label_(..)
  , Lang_(..)
  , Language_(..)
  , Loading_(..)
  , List_(..)
  , Loop_(..)
  , Low_(..)
  , Manifest_(..)
  , Max_(..)
  , Maxlength_(..)
  , Minlength_(..)
  , Media_(..)
  , Method_(..)
  , Min_(..)
  , Multiple_(..)
  , Muted_(..)
  , Name_(..)
  , Novalidate_(..)
  , Open_(..)
  , Optimum_(..)
  , Pattern_(..)
  , Ping_(..)
  , Placeholder_(..)
  , Poster_(..)
  , Preload_(..)
  , Radiogroup_(..)
  , Readonly_(..)
  , Referrerpolicy_(..)
  , Rel_(..)
  , Required_(..)
  , Reversed_(..)
  , Rows_(..)
  , Rowspan_(..)
  , Sandbox_(..)
  , Scope_(..)
  , Scoped_(..)
  , Selected_(..)
  , Shape_(..)
  , Size_(..)
  , Sizes_(..)
  , Slot_(..)
  , Span_(..)
  , Spellcheck_(..)
  , Src_(..)
  , Srcdoc_(..)
  , Srclang_(..)
  , Srcset_(..)
  , Start_(..)
  , Step_(..)
  , Style_(..)
  , Summary_(..)
  , Tabindex_(..)
  , Target_(..)
  , Title_(..)
  , Translate_(..)
  , Type_(..)
  , Usemap_(..)
  , Value_(..)
  , Width_(..)
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
  , A
  , TA
  , a
  , a'attr
  , unsafeUnA
  , Abbr
  , TAbbr
  , abbr
  , abbr'attr
  , unsafeUnAbbr
  , Acronym
  , TAcronym
  , acronym
  , acronym'attr
  , unsafeUnAcronym
  , Address
  , TAddress
  , address
  , address'attr
  , unsafeUnAddress
  , Applet
  , TApplet
  , applet
  , applet'attr
  , unsafeUnApplet
  , Area
  , TArea
  , area
  , area'attr
  , unsafeUnArea
  , Article
  , TArticle
  , article
  , article'attr
  , unsafeUnArticle
  , Aside
  , TAside
  , aside
  , aside'attr
  , unsafeUnAside
  , Audio
  , TAudio
  , audio
  , audio'attr
  , unsafeUnAudio
  , B
  , TB
  , b
  , b'attr
  , unsafeUnB
  , Base
  , TBase
  , base
  , base'attr
  , unsafeUnBase
  , Basefont
  , TBasefont
  , basefont
  , basefont'attr
  , unsafeUnBasefont
  , Bdi
  , TBdi
  , bdi
  , bdi'attr
  , unsafeUnBdi
  , Bdo
  , TBdo
  , bdo
  , bdo'attr
  , unsafeUnBdo
  , Big
  , TBig
  , big
  , big'attr
  , unsafeUnBig
  , Blockquote
  , TBlockquote
  , blockquote
  , blockquote'attr
  , unsafeUnBlockquote
  , Body
  , TBody
  , body
  , body'attr
  , unsafeUnBody
  , Br
  , TBr
  , br
  , br'attr
  , unsafeUnBr
  , Button
  , TButton
  , button
  , button'attr
  , unsafeUnButton
  , Canvas
  , TCanvas
  , canvas
  , canvas'attr
  , unsafeUnCanvas
  , Caption
  , TCaption
  , caption
  , caption'attr
  , unsafeUnCaption
  , Center
  , TCenter
  , center
  , center'attr
  , unsafeUnCenter
  , Cite
  , TCite
  , cite
  , cite'attr
  , unsafeUnCite
  , Code
  , TCode
  , code
  , code'attr
  , unsafeUnCode
  , Col
  , TCol
  , col
  , col'attr
  , unsafeUnCol
  , Colgroup
  , TColgroup
  , colgroup
  , colgroup'attr
  , unsafeUnColgroup
  , Data
  , TData
  , xdata
  , xdata'attr
  , unsafeUnData
  , Datalist
  , TDatalist
  , datalist
  , datalist'attr
  , unsafeUnDatalist
  , Dd
  , TDd
  , dd
  , dd'attr
  , unsafeUnDd
  , Del
  , TDel
  , del
  , del'attr
  , unsafeUnDel
  , Details
  , TDetails
  , details
  , details'attr
  , unsafeUnDetails
  , Dfn
  , TDfn
  , dfn
  , dfn'attr
  , unsafeUnDfn
  , Dialog
  , TDialog
  , dialog
  , dialog'attr
  , unsafeUnDialog
  , Dir
  , TDir
  , dir
  , dir'attr
  , unsafeUnDir
  , Div
  , TDiv
  , div
  , div'attr
  , unsafeUnDiv
  , Dl
  , TDl
  , dl
  , dl'attr
  , unsafeUnDl
  , Dt
  , TDt
  , dt
  , dt'attr
  , unsafeUnDt
  , Em
  , TEm
  , em
  , em'attr
  , unsafeUnEm
  , Embed
  , TEmbed
  , embed
  , embed'attr
  , unsafeUnEmbed
  , Fieldset
  , TFieldset
  , fieldset
  , fieldset'attr
  , unsafeUnFieldset
  , Figcaption
  , TFigcaption
  , figcaption
  , figcaption'attr
  , unsafeUnFigcaption
  , Figure
  , TFigure
  , figure
  , figure'attr
  , unsafeUnFigure
  , Font
  , TFont
  , font
  , font'attr
  , unsafeUnFont
  , Footer
  , TFooter
  , footer
  , footer'attr
  , unsafeUnFooter
  , Form
  , TForm
  , form
  , form'attr
  , unsafeUnForm
  , Frame
  , TFrame
  , frame
  , frame'attr
  , unsafeUnFrame
  , Frameset
  , TFrameset
  , frameset
  , frameset'attr
  , unsafeUnFrameset
  , H1
  , TH1
  , h1
  , h1'attr
  , unsafeUnH1
  , H2
  , TH2
  , h2
  , h2'attr
  , unsafeUnH2
  , H3
  , TH3
  , h3
  , h3'attr
  , unsafeUnH3
  , H4
  , TH4
  , h4
  , h4'attr
  , unsafeUnH4
  , H5
  , TH5
  , h5
  , h5'attr
  , unsafeUnH5
  , H6
  , TH6
  , h6
  , h6'attr
  , unsafeUnH6
  , Head
  , THead
  , head
  , head'attr
  , unsafeUnHead
  , Header
  , THeader
  , header
  , header'attr
  , unsafeUnHeader
  , Hr
  , THr
  , hr
  , hr'attr
  , unsafeUnHr
  , Html
  , THtml
  , html
  , html'attr
  , unsafeUnHtml
  , I
  , TI
  , i
  , i'attr
  , unsafeUnI
  , Iframe
  , TIframe
  , iframe
  , iframe'attr
  , unsafeUnIframe
  , Img
  , TImg
  , img
  , img'attr
  , unsafeUnImg
  , Input
  , TInput
  , input
  , input'attr
  , unsafeUnInput
  , Ins
  , TIns
  , ins
  , ins'attr
  , unsafeUnIns
  , Kbd
  , TKbd
  , kbd
  , kbd'attr
  , unsafeUnKbd
  , Label
  , TLabel
  , label
  , label'attr
  , unsafeUnLabel
  , Legend
  , TLegend
  , legend
  , legend'attr
  , unsafeUnLegend
  , Li
  , TLi
  , li
  , li'attr
  , unsafeUnLi
  , Link
  , TLink
  , link
  , link'attr
  , unsafeUnLink
  , Main
  , TMain
  , main
  , main'attr
  , unsafeUnMain
  , Map
  , TMap
  , map
  , map'attr
  , unsafeUnMap
  , Mark
  , TMark
  , mark
  , mark'attr
  , unsafeUnMark
  , Meta
  , TMeta
  , meta
  , meta'attr
  , unsafeUnMeta
  , Meter
  , TMeter
  , meter
  , meter'attr
  , unsafeUnMeter
  , Nav
  , TNav
  , nav
  , nav'attr
  , unsafeUnNav
  , Noframes
  , TNoframes
  , noframes
  , noframes'attr
  , unsafeUnNoframes
  , Noscript
  , TNoscript
  , noscript
  , noscript'attr
  , unsafeUnNoscript
  , Object
  , TObject
  , object
  , object'attr
  , unsafeUnObject
  , Ol
  , TOl
  , ol
  , ol'attr
  , unsafeUnOl
  , Optgroup
  , TOptgroup
  , optgroup
  , optgroup'attr
  , unsafeUnOptgroup
  , Option
  , TOption
  , option
  , option'attr
  , unsafeUnOption
  , Output
  , TOutput
  , output
  , output'attr
  , unsafeUnOutput
  , P
  , TP
  , p
  , p'attr
  , unsafeUnP
  , Param
  , TParam
  , param
  , param'attr
  , unsafeUnParam
  , Picture
  , TPicture
  , picture
  , picture'attr
  , unsafeUnPicture
  , Pre
  , TPre
  , pre
  , pre'attr
  , unsafeUnPre
  , Progress
  , TProgress
  , progress
  , progress'attr
  , unsafeUnProgress
  , Q
  , TQ
  , q
  , q'attr
  , unsafeUnQ
  , Rp
  , TRp
  , rp
  , rp'attr
  , unsafeUnRp
  , Rt
  , TRt
  , rt
  , rt'attr
  , unsafeUnRt
  , Ruby
  , TRuby
  , ruby
  , ruby'attr
  , unsafeUnRuby
  , S
  , TS
  , s
  , s'attr
  , unsafeUnS
  , Samp
  , TSamp
  , samp
  , samp'attr
  , unsafeUnSamp
  , Script
  , TScript
  , script
  , script'attr
  , unsafeUnScript
  , Section
  , TSection
  , section
  , section'attr
  , unsafeUnSection
  , Select
  , TSelect
  , select
  , select'attr
  , unsafeUnSelect
  , Small
  , TSmall
  , small
  , small'attr
  , unsafeUnSmall
  , Source
  , TSource
  , source
  , source'attr
  , unsafeUnSource
  , Span
  , TSpan
  , span
  , span'attr
  , unsafeUnSpan
  , Strike
  , TStrike
  , strike
  , strike'attr
  , unsafeUnStrike
  , Strong
  , TStrong
  , strong
  , strong'attr
  , unsafeUnStrong
  , Style
  , TStyle
  , style
  , style'attr
  , unsafeUnStyle
  , Sub
  , TSub
  , sub
  , sub'attr
  , unsafeUnSub
  , Summary
  , TSummary
  , summary
  , summary'attr
  , unsafeUnSummary
  , Sup
  , TSup
  , sup
  , sup'attr
  , unsafeUnSup
  , Svg
  , TSvg
  , svg
  , svg'attr
  , unsafeUnSvg
  , Table
  , TTable
  , table
  , table'attr
  , unsafeUnTable
  , Tbody
  , TTbody
  , tbody
  , tbody'attr
  , unsafeUnTbody
  , Td
  , TTd
  , td
  , td'attr
  , unsafeUnTd
  , Template
  , TTemplate
  , template
  , template'attr
  , unsafeUnTemplate
  , Textarea
  , TTextarea
  , textarea
  , textarea'attr
  , unsafeUnTextarea
  , Tfoot
  , TTfoot
  , tfoot
  , tfoot'attr
  , unsafeUnTfoot
  , Th
  , TTh
  , th
  , th'attr
  , unsafeUnTh
  , Thead
  , TThead
  , thead
  , thead'attr
  , unsafeUnThead
  , Time
  , TTime
  , time
  , time'attr
  , unsafeUnTime
  , Title
  , TTitle
  , title
  , title'attr
  , unsafeUnTitle
  , Tr
  , TTr
  , tr
  , tr'attr
  , unsafeUnTr
  , Track
  , TTrack
  , track
  , track'attr
  , unsafeUnTrack
  , Tt
  , TTt
  , tt
  , tt'attr
  , unsafeUnTt
  , U
  , TU
  , u
  , u'attr
  , unsafeUnU
  , Ul
  , TUl
  , ul
  , ul'attr
  , unsafeUnUl
  , Var
  , TVar
  , var
  , var'attr
  , unsafeUnVar
  , Video
  , TVideo
  , video
  , video'attr
  , unsafeUnVideo
  , Wbr
  , TWbr
  , wbr
  , wbr'attr
  , unsafeUnWbr
  -- codegen 0
  ) where

import Prelude

import Data.Monoid.Additive (Additive)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Tuple.Nested (type (/\))
import Data.Typelevel.Num (class Pos, D1)
import Data.Vec (Vec, singleton)
import Deku.Control.Types (Frame0, SubScene)
import Deku.Graph.Attribute (Attribute, Cb, cb, prop, unsafeAttribute)
import Deku.Interpret (class DOMInterpret)
import Deku.Tumult (Tumultuous)
import Type.Proxy (Proxy(..))
import Web.DOM as Web.DOM

class TypeToSym (a :: Type) (b :: Symbol) | a -> b

instance typeToSymTup :: TypeToSym a c => TypeToSym (a /\ b) c

type Element' element children =
  (element :: element, children :: { | children })
newtype Element element children =
  Element { | Element' element children }
unsafeUnElement
  :: forall element children
   . Element element children
  -> { | Element' element children }
unsafeUnElement (Element unsafe) = unsafe

class Attr e a b where
  attr :: a -> b -> Attribute e

infixr 5 attr as :=

makeElt
  :: forall tag children attributes
   . ( { attributes :: attributes
       , tag :: String
       }
       -> tag
     )
  -> String
  -> attributes
  -> { | children }
  -> Element tag children
makeElt elt tag = compose Element
  <<< { element: _, children: _ }
  <<< elt
  <<< { tag, attributes: _ }
--------- other
type Root' = (element :: Web.DOM.Element)
newtype Root = Root { | Root' }
unsafeUnRoot :: Root -> { | Root' }
unsafeUnRoot (Root unsafe) = unsafe

instance typeToSymRoot ::
  TypeToSym Root "Root"

root
  :: forall children
   . Web.DOM.Element
  -> { | children }
  -> { root :: Element Root children }
root = compose ({ root: _ } <<< Element)
  <<< { element: _, children: _ }
  <<< Root
  <<< { element: _ }

type Text' = (text :: String)
newtype Text = Text { | Text' }
unsafeUnText :: Text -> { | Text' }
unsafeUnText (Text unsafe) = unsafe

instance typeToSymText ::
  TypeToSym Text "TEXT"

text
  :: String -> Element Text ()
text = Element
  <<< { element: _, children: {} }
  <<< Text
  <<< { text: _ }

--

newtype AsSubgraph terminus env push = AsSubgraph
  ( forall dom engine
     . DOMInterpret dom engine
    => Int
    -> SubScene terminus env dom engine Frame0 push (Additive Int)
  )

unAsSubGraph
  :: forall terminus env push
   . AsSubgraph terminus env push
  -> ( forall dom engine
        . DOMInterpret dom engine
       => Int
       -> SubScene terminus env dom engine Frame0 push (Additive Int)
     )
unAsSubGraph (AsSubgraph sg) = sg

type Subgraph' subgraphMaker envs =
  ( subgraphMaker :: subgraphMaker
  , envs :: envs
  , terminus :: String
  )
newtype Subgraph subgraphMaker envs = Subgraph
  { | Subgraph' subgraphMaker envs }

subgraph1
  :: forall env terminus push
   . IsSymbol terminus
  => env
  -> AsSubgraph terminus env push
  -> Element (Subgraph (AsSubgraph terminus env push) (Vec D1 env)) ()
subgraph1 = subgraph <<< singleton

subgraph
  :: forall n env terminus push
   . IsSymbol terminus
  => Pos n
  => Vec n env
  -> AsSubgraph terminus env push
  -> Element (Subgraph (AsSubgraph terminus env push) (Vec n env)) ()
subgraph envs subgraphMaker =
  Element
    { element: Subgraph
        { subgraphMaker, envs, terminus: reflectSymbol (Proxy :: _ terminus) }
    , children: {}
    }

unsafeUnSubgraph
  :: forall subgraphMaker envs
   . Subgraph subgraphMaker envs
  -> { | Subgraph' subgraphMaker envs }
unsafeUnSubgraph (Subgraph unsafe) = unsafe

type XSubgraph'  (n :: Type) (env :: Type) =
  ( envs :: Vec n env )
newtype XSubgraph index env = XSubgraph { | XSubgraph' index env }

instance typeToSymSubgraph ::
  TypeToSym (Subgraph subgraphMaker env) "Subgraph"

instance typeToSymXSubgraph ::
  TypeToSym (XSubgraph n envs) "Subgraph"

type X1Subgraph' (index :: Type) (env :: Type) =
  (index :: index, env :: env)
newtype X1Subgraph index env = X1Subgraph { | X1Subgraph' index env }

instance typeToSymX1Subgraph ::
  TypeToSym (X1Subgraph index env) "Subgraph"

type Tumult' (n :: Type) (terminus :: Symbol) =
  ( tumult :: Tumultuous n terminus
  , terminus :: String
  )
newtype Tumult n terminus = Tumult
  { | Tumult' n terminus }

tumult
  :: forall n terminus
   . IsSymbol terminus
  => Tumultuous n terminus
  -> Element (Tumult n terminus) ()
tumult tumultuous = Element
  { element: Tumult
      { terminus: reflectSymbol (Proxy :: _ terminus)
      , tumult: tumultuous
      }
  , children: {}
  }

unsafeUnTumult
  :: forall n terminus
   . Tumult n terminus
  -> { | Tumult' n terminus }
unsafeUnTumult (Tumult unsafe) = unsafe

instance typeToSymTumult :: TypeToSym (Tumult n terminus) "Tumult"

class ReifyAU a b | a -> b where
  reifyAU :: a -> b
----------

-- | Type-level constructor for a subgraph.
data TSubgraph
  (arity :: Type)
  (terminus :: Symbol)
  (env :: Type) = TSubgraph

instance typeToSymTSubgraph ::
  TypeToSym (TSubgraph arity terminus env) "TSubgraph"

instance semigroupTSubgraph :: Semigroup (TSubgraph arity terminus env) where
  append _ _ = TSubgraph

instance monoidTSubgraph :: Monoid (TSubgraph arity terminus env) where
  mempty = TSubgraph

instance reifyTSubgraph :: ReifyAU (Subgraph a b) (TSubgraph x y z) where
  reifyAU = const mempty

-- | Type-level constructor for a subgraph.
data TTumult (arity :: Type) (terminus :: Symbol) = TTumult

instance typeToSymTTumult :: TypeToSym (TTumult arity terminus) "TTumult"

instance semigroupTTumult :: Semigroup (TTumult arity terminus) where
  append _ _ = TTumult

instance monoidTTumult :: Monoid (TTumult arity terminus) where
  mempty = TTumult

instance reifyTTumult :: ReifyAU (Tumult n terminus) (TTumult w x) where
  reifyAU = const mempty

data TText = TText

instance typeToSymTText :: TypeToSym TText "TText"

instance semigroupTText :: Semigroup TText where
  append _ _ = TText

instance monoidTText :: Monoid TText where
  mempty = TText

instance reifyTText :: ReifyAU Text TText where
  reifyAU = const mempty

data TRoot = TRoot

instance typeToSymTRoot :: TypeToSym TRoot "TRoot"

instance semigroupTRoot :: Semigroup TRoot where
  append _ _ = TRoot

instance monoidTRoot :: Monoid TRoot where
  mempty = TRoot

instance reifyTRoot :: ReifyAU Root TRoot where
  reifyAU = const mempty

-- codegen 8
data Accept_ = Accept_
data AcceptCharset_ = AcceptCharset_
data Accesskey_ = Accesskey_
data Action_ = Action_
data Align_ = Align_
data Allow_ = Allow_
data Alt_ = Alt_
data Async_ = Async_
data Autocapitalize_ = Autocapitalize_
data Autocomplete_ = Autocomplete_
data Autofocus_ = Autofocus_
data Autoplay_ = Autoplay_
data Background_ = Background_
data Bgcolor_ = Bgcolor_
data Border_ = Border_
data Buffered_ = Buffered_
data Capture_ = Capture_
data Challenge_ = Challenge_
data Charset_ = Charset_
data Checked_ = Checked_
data Cite_ = Cite_
data Class_ = Class_
data Code_ = Code_
data Codebase_ = Codebase_
data Color_ = Color_
data Cols_ = Cols_
data Colspan_ = Colspan_
data Content_ = Content_
data Contenteditable_ = Contenteditable_
data Contextmenu_ = Contextmenu_
data Controls_ = Controls_
data Coords_ = Coords_
data Crossorigin_ = Crossorigin_
data Csp_ = Csp_
data Data_ = Data_
data Datetime_ = Datetime_
data Decoding_ = Decoding_
data Default_ = Default_
data Defer_ = Defer_
data Dir_ = Dir_
data Dirname_ = Dirname_
data Disabled_ = Disabled_
data Download_ = Download_
data Draggable_ = Draggable_
data Enctype_ = Enctype_
data Enterkeyhint_ = Enterkeyhint_
data For_ = For_
data Form_ = Form_
data Formaction_ = Formaction_
data Formenctype_ = Formenctype_
data Formmethod_ = Formmethod_
data Formnovalidate_ = Formnovalidate_
data Formtarget_ = Formtarget_
data Headers_ = Headers_
data Height_ = Height_
data Hidden_ = Hidden_
data High_ = High_
data Href_ = Href_
data Hreflang_ = Hreflang_
data HttpEquiv_ = HttpEquiv_
data Icon_ = Icon_
data Id_ = Id_
data Importance_ = Importance_
data Integrity_ = Integrity_
data Intrinsicsize_ = Intrinsicsize_
data Inputmode_ = Inputmode_
data Ismap_ = Ismap_
data Itemprop_ = Itemprop_
data Keytype_ = Keytype_
data Kind_ = Kind_
data Label_ = Label_
data Lang_ = Lang_
data Language_ = Language_
data Loading_ = Loading_
data List_ = List_
data Loop_ = Loop_
data Low_ = Low_
data Manifest_ = Manifest_
data Max_ = Max_
data Maxlength_ = Maxlength_
data Minlength_ = Minlength_
data Media_ = Media_
data Method_ = Method_
data Min_ = Min_
data Multiple_ = Multiple_
data Muted_ = Muted_
data Name_ = Name_
data Novalidate_ = Novalidate_
data Open_ = Open_
data Optimum_ = Optimum_
data Pattern_ = Pattern_
data Ping_ = Ping_
data Placeholder_ = Placeholder_
data Poster_ = Poster_
data Preload_ = Preload_
data Radiogroup_ = Radiogroup_
data Readonly_ = Readonly_
data Referrerpolicy_ = Referrerpolicy_
data Rel_ = Rel_
data Required_ = Required_
data Reversed_ = Reversed_
data Rows_ = Rows_
data Rowspan_ = Rowspan_
data Sandbox_ = Sandbox_
data Scope_ = Scope_
data Scoped_ = Scoped_
data Selected_ = Selected_
data Shape_ = Shape_
data Size_ = Size_
data Sizes_ = Sizes_
data Slot_ = Slot_
data Span_ = Span_
data Spellcheck_ = Spellcheck_
data Src_ = Src_
data Srcdoc_ = Srcdoc_
data Srclang_ = Srclang_
data Srcset_ = Srcset_
data Start_ = Start_
data Step_ = Step_
data Style_ = Style_
data Summary_ = Summary_
data Tabindex_ = Tabindex_
data Target_ = Target_
data Title_ = Title_
data Translate_ = Translate_
data Type_ = Type_
data Usemap_ = Usemap_
data Value_ = Value_
data Width_ = Width_
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
instance Attr Form Accept_ String where
  attr Accept_ value = unsafeAttribute { key: "accept", value: prop value }

instance Attr Input Accept_ String where
  attr Accept_ value = unsafeAttribute { key: "accept", value: prop value }

instance Attr Form AcceptCharset_ String where
  attr AcceptCharset_ value = unsafeAttribute { key: "accept-charset", value: prop value }

instance Attr Form Action_ String where
  attr Action_ value = unsafeAttribute { key: "action", value: prop value }

instance Attr Applet Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Caption Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Col Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Colgroup Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Hr Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Iframe Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Img Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Table Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Tbody Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Td Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Tfoot Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Th Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Thead Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Tr Align_ String where
  attr Align_ value = unsafeAttribute { key: "align", value: prop value }

instance Attr Iframe Allow_ String where
  attr Allow_ value = unsafeAttribute { key: "allow", value: prop value }

instance Attr Applet Alt_ String where
  attr Alt_ value = unsafeAttribute { key: "alt", value: prop value }

instance Attr Area Alt_ String where
  attr Alt_ value = unsafeAttribute { key: "alt", value: prop value }

instance Attr Img Alt_ String where
  attr Alt_ value = unsafeAttribute { key: "alt", value: prop value }

instance Attr Input Alt_ String where
  attr Alt_ value = unsafeAttribute { key: "alt", value: prop value }

instance Attr Script Async_ String where
  attr Async_ value = unsafeAttribute { key: "async", value: prop value }

instance Attr Form Autocomplete_ String where
  attr Autocomplete_ value = unsafeAttribute { key: "autocomplete", value: prop value }

instance Attr Input Autocomplete_ String where
  attr Autocomplete_ value = unsafeAttribute { key: "autocomplete", value: prop value }

instance Attr Select Autocomplete_ String where
  attr Autocomplete_ value = unsafeAttribute { key: "autocomplete", value: prop value }

instance Attr Textarea Autocomplete_ String where
  attr Autocomplete_ value = unsafeAttribute { key: "autocomplete", value: prop value }

instance Attr Button Autofocus_ String where
  attr Autofocus_ value = unsafeAttribute { key: "autofocus", value: prop value }

instance Attr Input Autofocus_ String where
  attr Autofocus_ value = unsafeAttribute { key: "autofocus", value: prop value }

instance Attr Select Autofocus_ String where
  attr Autofocus_ value = unsafeAttribute { key: "autofocus", value: prop value }

instance Attr Textarea Autofocus_ String where
  attr Autofocus_ value = unsafeAttribute { key: "autofocus", value: prop value }

instance Attr Audio Autoplay_ String where
  attr Autoplay_ value = unsafeAttribute { key: "autoplay", value: prop value }

instance Attr Video Autoplay_ String where
  attr Autoplay_ value = unsafeAttribute { key: "autoplay", value: prop value }

instance Attr Body Background_ String where
  attr Background_ value = unsafeAttribute { key: "background", value: prop value }

instance Attr Table Background_ String where
  attr Background_ value = unsafeAttribute { key: "background", value: prop value }

instance Attr Td Background_ String where
  attr Background_ value = unsafeAttribute { key: "background", value: prop value }

instance Attr Th Background_ String where
  attr Background_ value = unsafeAttribute { key: "background", value: prop value }

instance Attr Body Bgcolor_ String where
  attr Bgcolor_ value = unsafeAttribute { key: "bgcolor", value: prop value }

instance Attr Col Bgcolor_ String where
  attr Bgcolor_ value = unsafeAttribute { key: "bgcolor", value: prop value }

instance Attr Colgroup Bgcolor_ String where
  attr Bgcolor_ value = unsafeAttribute { key: "bgcolor", value: prop value }

instance Attr Table Bgcolor_ String where
  attr Bgcolor_ value = unsafeAttribute { key: "bgcolor", value: prop value }

instance Attr Tbody Bgcolor_ String where
  attr Bgcolor_ value = unsafeAttribute { key: "bgcolor", value: prop value }

instance Attr Tfoot Bgcolor_ String where
  attr Bgcolor_ value = unsafeAttribute { key: "bgcolor", value: prop value }

instance Attr Td Bgcolor_ String where
  attr Bgcolor_ value = unsafeAttribute { key: "bgcolor", value: prop value }

instance Attr Th Bgcolor_ String where
  attr Bgcolor_ value = unsafeAttribute { key: "bgcolor", value: prop value }

instance Attr Tr Bgcolor_ String where
  attr Bgcolor_ value = unsafeAttribute { key: "bgcolor", value: prop value }

instance Attr Img Border_ String where
  attr Border_ value = unsafeAttribute { key: "border", value: prop value }

instance Attr Object Border_ String where
  attr Border_ value = unsafeAttribute { key: "border", value: prop value }

instance Attr Table Border_ String where
  attr Border_ value = unsafeAttribute { key: "border", value: prop value }

instance Attr Audio Buffered_ String where
  attr Buffered_ value = unsafeAttribute { key: "buffered", value: prop value }

instance Attr Video Buffered_ String where
  attr Buffered_ value = unsafeAttribute { key: "buffered", value: prop value }

instance Attr Input Capture_ String where
  attr Capture_ value = unsafeAttribute { key: "capture", value: prop value }

instance Attr Meta Charset_ String where
  attr Charset_ value = unsafeAttribute { key: "charset", value: prop value }

instance Attr Script Charset_ String where
  attr Charset_ value = unsafeAttribute { key: "charset", value: prop value }

instance Attr Input Checked_ String where
  attr Checked_ value = unsafeAttribute { key: "checked", value: prop value }

instance Attr Blockquote Cite_ String where
  attr Cite_ value = unsafeAttribute { key: "cite", value: prop value }

instance Attr Del Cite_ String where
  attr Cite_ value = unsafeAttribute { key: "cite", value: prop value }

instance Attr Ins Cite_ String where
  attr Cite_ value = unsafeAttribute { key: "cite", value: prop value }

instance Attr Q Cite_ String where
  attr Cite_ value = unsafeAttribute { key: "cite", value: prop value }

instance Attr Applet Code_ String where
  attr Code_ value = unsafeAttribute { key: "code", value: prop value }

instance Attr Applet Codebase_ String where
  attr Codebase_ value = unsafeAttribute { key: "codebase", value: prop value }

instance Attr Basefont Color_ String where
  attr Color_ value = unsafeAttribute { key: "color", value: prop value }

instance Attr Font Color_ String where
  attr Color_ value = unsafeAttribute { key: "color", value: prop value }

instance Attr Hr Color_ String where
  attr Color_ value = unsafeAttribute { key: "color", value: prop value }

instance Attr Textarea Cols_ String where
  attr Cols_ value = unsafeAttribute { key: "cols", value: prop value }

instance Attr Td Colspan_ String where
  attr Colspan_ value = unsafeAttribute { key: "colspan", value: prop value }

instance Attr Th Colspan_ String where
  attr Colspan_ value = unsafeAttribute { key: "colspan", value: prop value }

instance Attr Meta Content_ String where
  attr Content_ value = unsafeAttribute { key: "content", value: prop value }

instance Attr Audio Controls_ String where
  attr Controls_ value = unsafeAttribute { key: "controls", value: prop value }

instance Attr Video Controls_ String where
  attr Controls_ value = unsafeAttribute { key: "controls", value: prop value }

instance Attr Area Coords_ String where
  attr Coords_ value = unsafeAttribute { key: "coords", value: prop value }

instance Attr Audio Crossorigin_ String where
  attr Crossorigin_ value = unsafeAttribute { key: "crossorigin", value: prop value }

instance Attr Img Crossorigin_ String where
  attr Crossorigin_ value = unsafeAttribute { key: "crossorigin", value: prop value }

instance Attr Link Crossorigin_ String where
  attr Crossorigin_ value = unsafeAttribute { key: "crossorigin", value: prop value }

instance Attr Script Crossorigin_ String where
  attr Crossorigin_ value = unsafeAttribute { key: "crossorigin", value: prop value }

instance Attr Video Crossorigin_ String where
  attr Crossorigin_ value = unsafeAttribute { key: "crossorigin", value: prop value }

instance Attr Iframe Csp_ String where
  attr Csp_ value = unsafeAttribute { key: "csp", value: prop value }

instance Attr Object Data_ String where
  attr Data_ value = unsafeAttribute { key: "data", value: prop value }

instance Attr Del Datetime_ String where
  attr Datetime_ value = unsafeAttribute { key: "datetime", value: prop value }

instance Attr Ins Datetime_ String where
  attr Datetime_ value = unsafeAttribute { key: "datetime", value: prop value }

instance Attr Time Datetime_ String where
  attr Datetime_ value = unsafeAttribute { key: "datetime", value: prop value }

instance Attr Img Decoding_ String where
  attr Decoding_ value = unsafeAttribute { key: "decoding", value: prop value }

instance Attr Track Default_ String where
  attr Default_ value = unsafeAttribute { key: "default", value: prop value }

instance Attr Script Defer_ String where
  attr Defer_ value = unsafeAttribute { key: "defer", value: prop value }

instance Attr Input Dirname_ String where
  attr Dirname_ value = unsafeAttribute { key: "dirname", value: prop value }

instance Attr Textarea Dirname_ String where
  attr Dirname_ value = unsafeAttribute { key: "dirname", value: prop value }

instance Attr Button Disabled_ String where
  attr Disabled_ value = unsafeAttribute { key: "disabled", value: prop value }

instance Attr Fieldset Disabled_ String where
  attr Disabled_ value = unsafeAttribute { key: "disabled", value: prop value }

instance Attr Input Disabled_ String where
  attr Disabled_ value = unsafeAttribute { key: "disabled", value: prop value }

instance Attr Optgroup Disabled_ String where
  attr Disabled_ value = unsafeAttribute { key: "disabled", value: prop value }

instance Attr Option Disabled_ String where
  attr Disabled_ value = unsafeAttribute { key: "disabled", value: prop value }

instance Attr Select Disabled_ String where
  attr Disabled_ value = unsafeAttribute { key: "disabled", value: prop value }

instance Attr Textarea Disabled_ String where
  attr Disabled_ value = unsafeAttribute { key: "disabled", value: prop value }

instance Attr A Download_ String where
  attr Download_ value = unsafeAttribute { key: "download", value: prop value }

instance Attr Area Download_ String where
  attr Download_ value = unsafeAttribute { key: "download", value: prop value }

instance Attr Form Enctype_ String where
  attr Enctype_ value = unsafeAttribute { key: "enctype", value: prop value }

instance Attr Textarea Enterkeyhint_ String where
  attr Enterkeyhint_ value = unsafeAttribute { key: "enterkeyhint", value: prop value }

instance Attr Label For_ String where
  attr For_ value = unsafeAttribute { key: "for", value: prop value }

instance Attr Output For_ String where
  attr For_ value = unsafeAttribute { key: "for", value: prop value }

instance Attr Button Form_ String where
  attr Form_ value = unsafeAttribute { key: "form", value: prop value }

instance Attr Fieldset Form_ String where
  attr Form_ value = unsafeAttribute { key: "form", value: prop value }

instance Attr Input Form_ String where
  attr Form_ value = unsafeAttribute { key: "form", value: prop value }

instance Attr Label Form_ String where
  attr Form_ value = unsafeAttribute { key: "form", value: prop value }

instance Attr Meter Form_ String where
  attr Form_ value = unsafeAttribute { key: "form", value: prop value }

instance Attr Object Form_ String where
  attr Form_ value = unsafeAttribute { key: "form", value: prop value }

instance Attr Output Form_ String where
  attr Form_ value = unsafeAttribute { key: "form", value: prop value }

instance Attr Progress Form_ String where
  attr Form_ value = unsafeAttribute { key: "form", value: prop value }

instance Attr Select Form_ String where
  attr Form_ value = unsafeAttribute { key: "form", value: prop value }

instance Attr Textarea Form_ String where
  attr Form_ value = unsafeAttribute { key: "form", value: prop value }

instance Attr Input Formaction_ String where
  attr Formaction_ value = unsafeAttribute { key: "formaction", value: prop value }

instance Attr Button Formaction_ String where
  attr Formaction_ value = unsafeAttribute { key: "formaction", value: prop value }

instance Attr Button Formenctype_ String where
  attr Formenctype_ value = unsafeAttribute { key: "formenctype", value: prop value }

instance Attr Input Formenctype_ String where
  attr Formenctype_ value = unsafeAttribute { key: "formenctype", value: prop value }

instance Attr Button Formmethod_ String where
  attr Formmethod_ value = unsafeAttribute { key: "formmethod", value: prop value }

instance Attr Input Formmethod_ String where
  attr Formmethod_ value = unsafeAttribute { key: "formmethod", value: prop value }

instance Attr Button Formnovalidate_ String where
  attr Formnovalidate_ value = unsafeAttribute { key: "formnovalidate", value: prop value }

instance Attr Input Formnovalidate_ String where
  attr Formnovalidate_ value = unsafeAttribute { key: "formnovalidate", value: prop value }

instance Attr Button Formtarget_ String where
  attr Formtarget_ value = unsafeAttribute { key: "formtarget", value: prop value }

instance Attr Input Formtarget_ String where
  attr Formtarget_ value = unsafeAttribute { key: "formtarget", value: prop value }

instance Attr Td Headers_ String where
  attr Headers_ value = unsafeAttribute { key: "headers", value: prop value }

instance Attr Th Headers_ String where
  attr Headers_ value = unsafeAttribute { key: "headers", value: prop value }

instance Attr Canvas Height_ String where
  attr Height_ value = unsafeAttribute { key: "height", value: prop value }

instance Attr Embed Height_ String where
  attr Height_ value = unsafeAttribute { key: "height", value: prop value }

instance Attr Iframe Height_ String where
  attr Height_ value = unsafeAttribute { key: "height", value: prop value }

instance Attr Img Height_ String where
  attr Height_ value = unsafeAttribute { key: "height", value: prop value }

instance Attr Input Height_ String where
  attr Height_ value = unsafeAttribute { key: "height", value: prop value }

instance Attr Object Height_ String where
  attr Height_ value = unsafeAttribute { key: "height", value: prop value }

instance Attr Video Height_ String where
  attr Height_ value = unsafeAttribute { key: "height", value: prop value }

instance Attr Meter High_ String where
  attr High_ value = unsafeAttribute { key: "high", value: prop value }

instance Attr A Href_ String where
  attr Href_ value = unsafeAttribute { key: "href", value: prop value }

instance Attr Area Href_ String where
  attr Href_ value = unsafeAttribute { key: "href", value: prop value }

instance Attr Base Href_ String where
  attr Href_ value = unsafeAttribute { key: "href", value: prop value }

instance Attr Link Href_ String where
  attr Href_ value = unsafeAttribute { key: "href", value: prop value }

instance Attr A Hreflang_ String where
  attr Hreflang_ value = unsafeAttribute { key: "hreflang", value: prop value }

instance Attr Area Hreflang_ String where
  attr Hreflang_ value = unsafeAttribute { key: "hreflang", value: prop value }

instance Attr Link Hreflang_ String where
  attr Hreflang_ value = unsafeAttribute { key: "hreflang", value: prop value }

instance Attr Meta HttpEquiv_ String where
  attr HttpEquiv_ value = unsafeAttribute { key: "http-equiv", value: prop value }

instance Attr Iframe Importance_ String where
  attr Importance_ value = unsafeAttribute { key: "importance", value: prop value }

instance Attr Img Importance_ String where
  attr Importance_ value = unsafeAttribute { key: "importance", value: prop value }

instance Attr Link Importance_ String where
  attr Importance_ value = unsafeAttribute { key: "importance", value: prop value }

instance Attr Script Importance_ String where
  attr Importance_ value = unsafeAttribute { key: "importance", value: prop value }

instance Attr Link Integrity_ String where
  attr Integrity_ value = unsafeAttribute { key: "integrity", value: prop value }

instance Attr Script Integrity_ String where
  attr Integrity_ value = unsafeAttribute { key: "integrity", value: prop value }

instance Attr Img Intrinsicsize_ String where
  attr Intrinsicsize_ value = unsafeAttribute { key: "intrinsicsize", value: prop value }

instance Attr Textarea Inputmode_ String where
  attr Inputmode_ value = unsafeAttribute { key: "inputmode", value: prop value }

instance Attr Img Ismap_ String where
  attr Ismap_ value = unsafeAttribute { key: "ismap", value: prop value }

instance Attr Track Kind_ String where
  attr Kind_ value = unsafeAttribute { key: "kind", value: prop value }

instance Attr Optgroup Label_ String where
  attr Label_ value = unsafeAttribute { key: "label", value: prop value }

instance Attr Option Label_ String where
  attr Label_ value = unsafeAttribute { key: "label", value: prop value }

instance Attr Track Label_ String where
  attr Label_ value = unsafeAttribute { key: "label", value: prop value }

instance Attr Script Language_ String where
  attr Language_ value = unsafeAttribute { key: "language", value: prop value }

instance Attr Img Loading_ String where
  attr Loading_ value = unsafeAttribute { key: "loading", value: prop value }

instance Attr Iframe Loading_ String where
  attr Loading_ value = unsafeAttribute { key: "loading", value: prop value }

instance Attr Input List_ String where
  attr List_ value = unsafeAttribute { key: "list", value: prop value }

instance Attr Audio Loop_ String where
  attr Loop_ value = unsafeAttribute { key: "loop", value: prop value }

instance Attr Video Loop_ String where
  attr Loop_ value = unsafeAttribute { key: "loop", value: prop value }

instance Attr Meter Low_ String where
  attr Low_ value = unsafeAttribute { key: "low", value: prop value }

instance Attr Html Manifest_ String where
  attr Manifest_ value = unsafeAttribute { key: "manifest", value: prop value }

instance Attr Input Max_ String where
  attr Max_ value = unsafeAttribute { key: "max", value: prop value }

instance Attr Meter Max_ String where
  attr Max_ value = unsafeAttribute { key: "max", value: prop value }

instance Attr Progress Max_ String where
  attr Max_ value = unsafeAttribute { key: "max", value: prop value }

instance Attr Input Maxlength_ String where
  attr Maxlength_ value = unsafeAttribute { key: "maxlength", value: prop value }

instance Attr Textarea Maxlength_ String where
  attr Maxlength_ value = unsafeAttribute { key: "maxlength", value: prop value }

instance Attr Input Minlength_ String where
  attr Minlength_ value = unsafeAttribute { key: "minlength", value: prop value }

instance Attr Textarea Minlength_ String where
  attr Minlength_ value = unsafeAttribute { key: "minlength", value: prop value }

instance Attr A Media_ String where
  attr Media_ value = unsafeAttribute { key: "media", value: prop value }

instance Attr Area Media_ String where
  attr Media_ value = unsafeAttribute { key: "media", value: prop value }

instance Attr Link Media_ String where
  attr Media_ value = unsafeAttribute { key: "media", value: prop value }

instance Attr Source Media_ String where
  attr Media_ value = unsafeAttribute { key: "media", value: prop value }

instance Attr Style Media_ String where
  attr Media_ value = unsafeAttribute { key: "media", value: prop value }

instance Attr Form Method_ String where
  attr Method_ value = unsafeAttribute { key: "method", value: prop value }

instance Attr Input Min_ String where
  attr Min_ value = unsafeAttribute { key: "min", value: prop value }

instance Attr Meter Min_ String where
  attr Min_ value = unsafeAttribute { key: "min", value: prop value }

instance Attr Input Multiple_ String where
  attr Multiple_ value = unsafeAttribute { key: "multiple", value: prop value }

instance Attr Select Multiple_ String where
  attr Multiple_ value = unsafeAttribute { key: "multiple", value: prop value }

instance Attr Audio Muted_ String where
  attr Muted_ value = unsafeAttribute { key: "muted", value: prop value }

instance Attr Video Muted_ String where
  attr Muted_ value = unsafeAttribute { key: "muted", value: prop value }

instance Attr Button Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Form Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Fieldset Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Iframe Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Input Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Object Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Output Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Select Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Textarea Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Map Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Meta Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Param Name_ String where
  attr Name_ value = unsafeAttribute { key: "name", value: prop value }

instance Attr Form Novalidate_ String where
  attr Novalidate_ value = unsafeAttribute { key: "novalidate", value: prop value }

instance Attr Details Open_ String where
  attr Open_ value = unsafeAttribute { key: "open", value: prop value }

instance Attr Dialog Open_ String where
  attr Open_ value = unsafeAttribute { key: "open", value: prop value }

instance Attr Meter Optimum_ String where
  attr Optimum_ value = unsafeAttribute { key: "optimum", value: prop value }

instance Attr Input Pattern_ String where
  attr Pattern_ value = unsafeAttribute { key: "pattern", value: prop value }

instance Attr A Ping_ String where
  attr Ping_ value = unsafeAttribute { key: "ping", value: prop value }

instance Attr Area Ping_ String where
  attr Ping_ value = unsafeAttribute { key: "ping", value: prop value }

instance Attr Input Placeholder_ String where
  attr Placeholder_ value = unsafeAttribute { key: "placeholder", value: prop value }

instance Attr Textarea Placeholder_ String where
  attr Placeholder_ value = unsafeAttribute { key: "placeholder", value: prop value }

instance Attr Video Poster_ String where
  attr Poster_ value = unsafeAttribute { key: "poster", value: prop value }

instance Attr Audio Preload_ String where
  attr Preload_ value = unsafeAttribute { key: "preload", value: prop value }

instance Attr Video Preload_ String where
  attr Preload_ value = unsafeAttribute { key: "preload", value: prop value }

instance Attr Input Readonly_ String where
  attr Readonly_ value = unsafeAttribute { key: "readonly", value: prop value }

instance Attr Textarea Readonly_ String where
  attr Readonly_ value = unsafeAttribute { key: "readonly", value: prop value }

instance Attr A Referrerpolicy_ String where
  attr Referrerpolicy_ value = unsafeAttribute { key: "referrerpolicy", value: prop value }

instance Attr Area Referrerpolicy_ String where
  attr Referrerpolicy_ value = unsafeAttribute { key: "referrerpolicy", value: prop value }

instance Attr Iframe Referrerpolicy_ String where
  attr Referrerpolicy_ value = unsafeAttribute { key: "referrerpolicy", value: prop value }

instance Attr Img Referrerpolicy_ String where
  attr Referrerpolicy_ value = unsafeAttribute { key: "referrerpolicy", value: prop value }

instance Attr Link Referrerpolicy_ String where
  attr Referrerpolicy_ value = unsafeAttribute { key: "referrerpolicy", value: prop value }

instance Attr Script Referrerpolicy_ String where
  attr Referrerpolicy_ value = unsafeAttribute { key: "referrerpolicy", value: prop value }

instance Attr A Rel_ String where
  attr Rel_ value = unsafeAttribute { key: "rel", value: prop value }

instance Attr Area Rel_ String where
  attr Rel_ value = unsafeAttribute { key: "rel", value: prop value }

instance Attr Link Rel_ String where
  attr Rel_ value = unsafeAttribute { key: "rel", value: prop value }

instance Attr Input Required_ String where
  attr Required_ value = unsafeAttribute { key: "required", value: prop value }

instance Attr Select Required_ String where
  attr Required_ value = unsafeAttribute { key: "required", value: prop value }

instance Attr Textarea Required_ String where
  attr Required_ value = unsafeAttribute { key: "required", value: prop value }

instance Attr Ol Reversed_ String where
  attr Reversed_ value = unsafeAttribute { key: "reversed", value: prop value }

instance Attr Textarea Rows_ String where
  attr Rows_ value = unsafeAttribute { key: "rows", value: prop value }

instance Attr Td Rowspan_ String where
  attr Rowspan_ value = unsafeAttribute { key: "rowspan", value: prop value }

instance Attr Th Rowspan_ String where
  attr Rowspan_ value = unsafeAttribute { key: "rowspan", value: prop value }

instance Attr Iframe Sandbox_ String where
  attr Sandbox_ value = unsafeAttribute { key: "sandbox", value: prop value }

instance Attr Th Scope_ String where
  attr Scope_ value = unsafeAttribute { key: "scope", value: prop value }

instance Attr Style Scoped_ String where
  attr Scoped_ value = unsafeAttribute { key: "scoped", value: prop value }

instance Attr Option Selected_ String where
  attr Selected_ value = unsafeAttribute { key: "selected", value: prop value }

instance Attr A Shape_ String where
  attr Shape_ value = unsafeAttribute { key: "shape", value: prop value }

instance Attr Area Shape_ String where
  attr Shape_ value = unsafeAttribute { key: "shape", value: prop value }

instance Attr Input Size_ String where
  attr Size_ value = unsafeAttribute { key: "size", value: prop value }

instance Attr Select Size_ String where
  attr Size_ value = unsafeAttribute { key: "size", value: prop value }

instance Attr Link Sizes_ String where
  attr Sizes_ value = unsafeAttribute { key: "sizes", value: prop value }

instance Attr Img Sizes_ String where
  attr Sizes_ value = unsafeAttribute { key: "sizes", value: prop value }

instance Attr Source Sizes_ String where
  attr Sizes_ value = unsafeAttribute { key: "sizes", value: prop value }

instance Attr Col Span_ String where
  attr Span_ value = unsafeAttribute { key: "span", value: prop value }

instance Attr Colgroup Span_ String where
  attr Span_ value = unsafeAttribute { key: "span", value: prop value }

instance Attr Audio Src_ String where
  attr Src_ value = unsafeAttribute { key: "src", value: prop value }

instance Attr Embed Src_ String where
  attr Src_ value = unsafeAttribute { key: "src", value: prop value }

instance Attr Iframe Src_ String where
  attr Src_ value = unsafeAttribute { key: "src", value: prop value }

instance Attr Img Src_ String where
  attr Src_ value = unsafeAttribute { key: "src", value: prop value }

instance Attr Input Src_ String where
  attr Src_ value = unsafeAttribute { key: "src", value: prop value }

instance Attr Script Src_ String where
  attr Src_ value = unsafeAttribute { key: "src", value: prop value }

instance Attr Source Src_ String where
  attr Src_ value = unsafeAttribute { key: "src", value: prop value }

instance Attr Track Src_ String where
  attr Src_ value = unsafeAttribute { key: "src", value: prop value }

instance Attr Video Src_ String where
  attr Src_ value = unsafeAttribute { key: "src", value: prop value }

instance Attr Iframe Srcdoc_ String where
  attr Srcdoc_ value = unsafeAttribute { key: "srcdoc", value: prop value }

instance Attr Track Srclang_ String where
  attr Srclang_ value = unsafeAttribute { key: "srclang", value: prop value }

instance Attr Img Srcset_ String where
  attr Srcset_ value = unsafeAttribute { key: "srcset", value: prop value }

instance Attr Source Srcset_ String where
  attr Srcset_ value = unsafeAttribute { key: "srcset", value: prop value }

instance Attr Ol Start_ String where
  attr Start_ value = unsafeAttribute { key: "start", value: prop value }

instance Attr Input Step_ String where
  attr Step_ value = unsafeAttribute { key: "step", value: prop value }

instance Attr Table Summary_ String where
  attr Summary_ value = unsafeAttribute { key: "summary", value: prop value }

instance Attr A Target_ String where
  attr Target_ value = unsafeAttribute { key: "target", value: prop value }

instance Attr Area Target_ String where
  attr Target_ value = unsafeAttribute { key: "target", value: prop value }

instance Attr Base Target_ String where
  attr Target_ value = unsafeAttribute { key: "target", value: prop value }

instance Attr Form Target_ String where
  attr Target_ value = unsafeAttribute { key: "target", value: prop value }

instance Attr Button Type_ String where
  attr Type_ value = unsafeAttribute { key: "type", value: prop value }

instance Attr Input Type_ String where
  attr Type_ value = unsafeAttribute { key: "type", value: prop value }

instance Attr Embed Type_ String where
  attr Type_ value = unsafeAttribute { key: "type", value: prop value }

instance Attr Object Type_ String where
  attr Type_ value = unsafeAttribute { key: "type", value: prop value }

instance Attr Script Type_ String where
  attr Type_ value = unsafeAttribute { key: "type", value: prop value }

instance Attr Source Type_ String where
  attr Type_ value = unsafeAttribute { key: "type", value: prop value }

instance Attr Style Type_ String where
  attr Type_ value = unsafeAttribute { key: "type", value: prop value }

instance Attr Link Type_ String where
  attr Type_ value = unsafeAttribute { key: "type", value: prop value }

instance Attr Img Usemap_ String where
  attr Usemap_ value = unsafeAttribute { key: "usemap", value: prop value }

instance Attr Input Usemap_ String where
  attr Usemap_ value = unsafeAttribute { key: "usemap", value: prop value }

instance Attr Object Usemap_ String where
  attr Usemap_ value = unsafeAttribute { key: "usemap", value: prop value }

instance Attr Button Value_ String where
  attr Value_ value = unsafeAttribute { key: "value", value: prop value }

instance Attr Data Value_ String where
  attr Value_ value = unsafeAttribute { key: "value", value: prop value }

instance Attr Input Value_ String where
  attr Value_ value = unsafeAttribute { key: "value", value: prop value }

instance Attr Li Value_ String where
  attr Value_ value = unsafeAttribute { key: "value", value: prop value }

instance Attr Meter Value_ String where
  attr Value_ value = unsafeAttribute { key: "value", value: prop value }

instance Attr Option Value_ String where
  attr Value_ value = unsafeAttribute { key: "value", value: prop value }

instance Attr Progress Value_ String where
  attr Value_ value = unsafeAttribute { key: "value", value: prop value }

instance Attr Param Value_ String where
  attr Value_ value = unsafeAttribute { key: "value", value: prop value }

instance Attr Canvas Width_ String where
  attr Width_ value = unsafeAttribute { key: "width", value: prop value }

instance Attr Embed Width_ String where
  attr Width_ value = unsafeAttribute { key: "width", value: prop value }

instance Attr Iframe Width_ String where
  attr Width_ value = unsafeAttribute { key: "width", value: prop value }

instance Attr Img Width_ String where
  attr Width_ value = unsafeAttribute { key: "width", value: prop value }

instance Attr Input Width_ String where
  attr Width_ value = unsafeAttribute { key: "width", value: prop value }

instance Attr Object Width_ String where
  attr Width_ value = unsafeAttribute { key: "width", value: prop value }

instance Attr Video Width_ String where
  attr Width_ value = unsafeAttribute { key: "width", value: prop value }

instance Attr anything OnAbort Cb where
  attr OnAbort value = unsafeAttribute { key: "abort", value: cb value }
instance Attr anything OnAnimationcancel  Cb where
  attr OnAnimationcancel  value = unsafeAttribute { key: "animationcancel ", value: cb value }
instance Attr anything OnAnimationend  Cb where
  attr OnAnimationend  value = unsafeAttribute { key: "animationend ", value: cb value }
instance Attr anything OnAnimationiteration  Cb where
  attr OnAnimationiteration  value = unsafeAttribute { key: "animationiteration ", value: cb value }
instance Attr anything OnAnimationstart  Cb where
  attr OnAnimationstart  value = unsafeAttribute { key: "animationstart ", value: cb value }
instance Attr anything OnAuxclick  Cb where
  attr OnAuxclick  value = unsafeAttribute { key: "auxclick ", value: cb value }
instance Attr anything OnBlur Cb where
  attr OnBlur value = unsafeAttribute { key: "blur", value: cb value }
instance Attr anything OnError Cb where
  attr OnError value = unsafeAttribute { key: "error", value: cb value }
instance Attr anything OnFocus Cb where
  attr OnFocus value = unsafeAttribute { key: "focus", value: cb value }
instance Attr anything OnCancel Cb where
  attr OnCancel value = unsafeAttribute { key: "cancel", value: cb value }
instance Attr anything OnCanplay Cb where
  attr OnCanplay value = unsafeAttribute { key: "canplay", value: cb value }
instance Attr anything OnCanplaythrough Cb where
  attr OnCanplaythrough value = unsafeAttribute { key: "canplaythrough", value: cb value }
instance Attr anything OnChange Cb where
  attr OnChange value = unsafeAttribute { key: "change", value: cb value }
instance Attr anything OnClick Cb where
  attr OnClick value = unsafeAttribute { key: "click", value: cb value }
instance Attr anything OnClose Cb where
  attr OnClose value = unsafeAttribute { key: "close", value: cb value }
instance Attr anything OnContextmenu Cb where
  attr OnContextmenu value = unsafeAttribute { key: "contextmenu", value: cb value }
instance Attr anything OnDblclick Cb where
  attr OnDblclick value = unsafeAttribute { key: "dblclick", value: cb value }
instance Attr anything OnDrag Cb where
  attr OnDrag value = unsafeAttribute { key: "drag", value: cb value }
instance Attr anything OnDragend Cb where
  attr OnDragend value = unsafeAttribute { key: "dragend", value: cb value }
instance Attr anything OnDragenter Cb where
  attr OnDragenter value = unsafeAttribute { key: "dragenter", value: cb value }
instance Attr anything OnDragleave Cb where
  attr OnDragleave value = unsafeAttribute { key: "dragleave", value: cb value }
instance Attr anything OnDragover Cb where
  attr OnDragover value = unsafeAttribute { key: "dragover", value: cb value }
instance Attr anything OnDragstart Cb where
  attr OnDragstart value = unsafeAttribute { key: "dragstart", value: cb value }
instance Attr anything OnDrop Cb where
  attr OnDrop value = unsafeAttribute { key: "drop", value: cb value }
instance Attr anything OnDurationchange Cb where
  attr OnDurationchange value = unsafeAttribute { key: "durationchange", value: cb value }
instance Attr anything OnEmptied Cb where
  attr OnEmptied value = unsafeAttribute { key: "emptied", value: cb value }
instance Attr anything OnEnded Cb where
  attr OnEnded value = unsafeAttribute { key: "ended", value: cb value }
instance Attr anything OnFormdata Cb where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb value }
instance Attr anything OnGotpointercapture Cb where
  attr OnGotpointercapture value = unsafeAttribute { key: "gotpointercapture", value: cb value }
instance Attr anything OnInput Cb where
  attr OnInput value = unsafeAttribute { key: "input", value: cb value }
instance Attr anything OnInvalid Cb where
  attr OnInvalid value = unsafeAttribute { key: "invalid", value: cb value }
instance Attr anything OnKeydown Cb where
  attr OnKeydown value = unsafeAttribute { key: "keydown", value: cb value }
instance Attr anything OnKeypress Cb where
  attr OnKeypress value = unsafeAttribute { key: "keypress", value: cb value }
instance Attr anything OnKeyup Cb where
  attr OnKeyup value = unsafeAttribute { key: "keyup", value: cb value }
instance Attr anything OnLoad Cb where
  attr OnLoad value = unsafeAttribute { key: "load", value: cb value }
instance Attr anything OnLoadeddata Cb where
  attr OnLoadeddata value = unsafeAttribute { key: "loadeddata", value: cb value }
instance Attr anything OnLoadedmetadata Cb where
  attr OnLoadedmetadata value = unsafeAttribute { key: "loadedmetadata", value: cb value }
instance Attr anything OnLoadend Cb where
  attr OnLoadend value = unsafeAttribute { key: "loadend", value: cb value }
instance Attr anything OnLoadstart Cb where
  attr OnLoadstart value = unsafeAttribute { key: "loadstart", value: cb value }
instance Attr anything OnLostpointercapture Cb where
  attr OnLostpointercapture value = unsafeAttribute { key: "lostpointercapture", value: cb value }
instance Attr anything OnMousedown Cb where
  attr OnMousedown value = unsafeAttribute { key: "mousedown", value: cb value }
instance Attr anything OnMouseenter Cb where
  attr OnMouseenter value = unsafeAttribute { key: "mouseenter", value: cb value }
instance Attr anything OnMouseleave Cb where
  attr OnMouseleave value = unsafeAttribute { key: "mouseleave", value: cb value }
instance Attr anything OnMousemove Cb where
  attr OnMousemove value = unsafeAttribute { key: "mousemove", value: cb value }
instance Attr anything OnMouseout Cb where
  attr OnMouseout value = unsafeAttribute { key: "mouseout", value: cb value }
instance Attr anything OnMouseover Cb where
  attr OnMouseover value = unsafeAttribute { key: "mouseover", value: cb value }
instance Attr anything OnMouseup Cb where
  attr OnMouseup value = unsafeAttribute { key: "mouseup", value: cb value }
instance Attr anything OnMousewheel   Cb where
  attr OnMousewheel   value = unsafeAttribute { key: "mousewheel  ", value: cb value }
instance Attr anything OnWheel Cb where
  attr OnWheel value = unsafeAttribute { key: "wheel", value: cb value }
instance Attr anything OnPause Cb where
  attr OnPause value = unsafeAttribute { key: "pause", value: cb value }
instance Attr anything OnPlay Cb where
  attr OnPlay value = unsafeAttribute { key: "play", value: cb value }
instance Attr anything OnPlaying Cb where
  attr OnPlaying value = unsafeAttribute { key: "playing", value: cb value }
instance Attr anything OnPointerdown Cb where
  attr OnPointerdown value = unsafeAttribute { key: "pointerdown", value: cb value }
instance Attr anything OnPointermove Cb where
  attr OnPointermove value = unsafeAttribute { key: "pointermove", value: cb value }
instance Attr anything OnPointerup Cb where
  attr OnPointerup value = unsafeAttribute { key: "pointerup", value: cb value }
instance Attr anything OnPointercancel Cb where
  attr OnPointercancel value = unsafeAttribute { key: "pointercancel", value: cb value }
instance Attr anything OnPointerover Cb where
  attr OnPointerover value = unsafeAttribute { key: "pointerover", value: cb value }
instance Attr anything OnPointerout Cb where
  attr OnPointerout value = unsafeAttribute { key: "pointerout", value: cb value }
instance Attr anything OnPointerenter Cb where
  attr OnPointerenter value = unsafeAttribute { key: "pointerenter", value: cb value }
instance Attr anything OnPointerleave Cb where
  attr OnPointerleave value = unsafeAttribute { key: "pointerleave", value: cb value }
instance Attr anything OnPointerlockchange  Cb where
  attr OnPointerlockchange  value = unsafeAttribute { key: "pointerlockchange ", value: cb value }
instance Attr anything OnPointerlockerror  Cb where
  attr OnPointerlockerror  value = unsafeAttribute { key: "pointerlockerror ", value: cb value }
instance Attr anything OnProgress Cb where
  attr OnProgress value = unsafeAttribute { key: "progress", value: cb value }
instance Attr anything OnRatechange Cb where
  attr OnRatechange value = unsafeAttribute { key: "ratechange", value: cb value }
instance Attr anything OnReset Cb where
  attr OnReset value = unsafeAttribute { key: "reset", value: cb value }
instance Attr anything OnResize Cb where
  attr OnResize value = unsafeAttribute { key: "resize", value: cb value }
instance Attr anything OnScroll Cb where
  attr OnScroll value = unsafeAttribute { key: "scroll", value: cb value }
instance Attr anything OnSecuritypolicyviolation Cb where
  attr OnSecuritypolicyviolation value = unsafeAttribute { key: "securitypolicyviolation", value: cb value }
instance Attr anything OnSeeked Cb where
  attr OnSeeked value = unsafeAttribute { key: "seeked", value: cb value }
instance Attr anything OnSeeking Cb where
  attr OnSeeking value = unsafeAttribute { key: "seeking", value: cb value }
instance Attr anything OnSelect Cb where
  attr OnSelect value = unsafeAttribute { key: "select", value: cb value }
instance Attr anything OnSelectstart Cb where
  attr OnSelectstart value = unsafeAttribute { key: "selectstart", value: cb value }
instance Attr anything OnSelectionchange Cb where
  attr OnSelectionchange value = unsafeAttribute { key: "selectionchange", value: cb value }
instance Attr anything OnShow  Cb where
  attr OnShow  value = unsafeAttribute { key: "show ", value: cb value }
instance Attr anything OnSlotchange Cb where
  attr OnSlotchange value = unsafeAttribute { key: "slotchange", value: cb value }
instance Attr anything OnStalled Cb where
  attr OnStalled value = unsafeAttribute { key: "stalled", value: cb value }
instance Attr anything OnSubmit Cb where
  attr OnSubmit value = unsafeAttribute { key: "submit", value: cb value }
instance Attr anything OnSuspend Cb where
  attr OnSuspend value = unsafeAttribute { key: "suspend", value: cb value }
instance Attr anything OnTimeupdate Cb where
  attr OnTimeupdate value = unsafeAttribute { key: "timeupdate", value: cb value }
instance Attr anything OnVolumechange Cb where
  attr OnVolumechange value = unsafeAttribute { key: "volumechange", value: cb value }
instance Attr anything OnTouchcancel   Cb where
  attr OnTouchcancel   value = unsafeAttribute { key: "touchcancel  ", value: cb value }
instance Attr anything OnTouchend   Cb where
  attr OnTouchend   value = unsafeAttribute { key: "touchend  ", value: cb value }
instance Attr anything OnTouchmove   Cb where
  attr OnTouchmove   value = unsafeAttribute { key: "touchmove  ", value: cb value }
instance Attr anything OnTouchstart   Cb where
  attr OnTouchstart   value = unsafeAttribute { key: "touchstart  ", value: cb value }
instance Attr anything OnTransitioncancel Cb where
  attr OnTransitioncancel value = unsafeAttribute { key: "transitioncancel", value: cb value }
instance Attr anything OnTransitionend Cb where
  attr OnTransitionend value = unsafeAttribute { key: "transitionend", value: cb value }
instance Attr anything OnTransitionrun Cb where
  attr OnTransitionrun value = unsafeAttribute { key: "transitionrun", value: cb value }
instance Attr anything OnTransitionstart Cb where
  attr OnTransitionstart value = unsafeAttribute { key: "transitionstart", value: cb value }
instance Attr anything OnWaiting Cb where
  attr OnWaiting value = unsafeAttribute { key: "waiting", value: cb value }
-- codegen 8
-- codegen 1
type A' =
  ( tag :: String
  , attributes :: Array (Attribute A)
  )
newtype A = A { | A' }
unsafeUnA :: A -> { | A' }
unsafeUnA (A unsafe) = unsafe

instance typeToSymA ::
  TypeToSym A "a"

a
  :: forall children
   . Array (Attribute A)
  -> { | children }
  -> Element A children
a = makeElt A "a"

a'attr
  :: Array (Attribute A)
  -> Array (Attribute A)
a'attr = identity

data TA = TA

instance typeToSymTA :: TypeToSym TA "TA"

instance semigroupTA :: Semigroup TA where
  append _ _ = TA

instance monoidTA :: Monoid TA where
  mempty = TA

instance reifyTA :: ReifyAU A TA where
  reifyAU = const mempty
type Abbr' =
  ( tag :: String
  , attributes :: Array (Attribute Abbr)
  )
newtype Abbr = Abbr { | Abbr' }
unsafeUnAbbr :: Abbr -> { | Abbr' }
unsafeUnAbbr (Abbr unsafe) = unsafe

instance typeToSymAbbr ::
  TypeToSym Abbr "abbr"

abbr
  :: forall children
   . Array (Attribute Abbr)
  -> { | children }
  -> Element Abbr children
abbr = makeElt Abbr "abbr"

abbr'attr
  :: Array (Attribute Abbr)
  -> Array (Attribute Abbr)
abbr'attr = identity

data TAbbr = TAbbr

instance typeToSymTAbbr :: TypeToSym TAbbr "TAbbr"

instance semigroupTAbbr :: Semigroup TAbbr where
  append _ _ = TAbbr

instance monoidTAbbr :: Monoid TAbbr where
  mempty = TAbbr

instance reifyTAbbr :: ReifyAU Abbr TAbbr where
  reifyAU = const mempty
type Acronym' =
  ( tag :: String
  , attributes :: Array (Attribute Acronym)
  )
newtype Acronym = Acronym { | Acronym' }
unsafeUnAcronym :: Acronym -> { | Acronym' }
unsafeUnAcronym (Acronym unsafe) = unsafe

instance typeToSymAcronym ::
  TypeToSym Acronym "acronym"

acronym
  :: forall children
   . Array (Attribute Acronym)
  -> { | children }
  -> Element Acronym children
acronym = makeElt Acronym "acronym"

acronym'attr
  :: Array (Attribute Acronym)
  -> Array (Attribute Acronym)
acronym'attr = identity

data TAcronym = TAcronym

instance typeToSymTAcronym :: TypeToSym TAcronym "TAcronym"

instance semigroupTAcronym :: Semigroup TAcronym where
  append _ _ = TAcronym

instance monoidTAcronym :: Monoid TAcronym where
  mempty = TAcronym

instance reifyTAcronym :: ReifyAU Acronym TAcronym where
  reifyAU = const mempty
type Address' =
  ( tag :: String
  , attributes :: Array (Attribute Address)
  )
newtype Address = Address { | Address' }
unsafeUnAddress :: Address -> { | Address' }
unsafeUnAddress (Address unsafe) = unsafe

instance typeToSymAddress ::
  TypeToSym Address "address"

address
  :: forall children
   . Array (Attribute Address)
  -> { | children }
  -> Element Address children
address = makeElt Address "address"

address'attr
  :: Array (Attribute Address)
  -> Array (Attribute Address)
address'attr = identity

data TAddress = TAddress

instance typeToSymTAddress :: TypeToSym TAddress "TAddress"

instance semigroupTAddress :: Semigroup TAddress where
  append _ _ = TAddress

instance monoidTAddress :: Monoid TAddress where
  mempty = TAddress

instance reifyTAddress :: ReifyAU Address TAddress where
  reifyAU = const mempty
type Applet' =
  ( tag :: String
  , attributes :: Array (Attribute Applet)
  )
newtype Applet = Applet { | Applet' }
unsafeUnApplet :: Applet -> { | Applet' }
unsafeUnApplet (Applet unsafe) = unsafe

instance typeToSymApplet ::
  TypeToSym Applet "applet"

applet
  :: forall children
   . Array (Attribute Applet)
  -> { | children }
  -> Element Applet children
applet = makeElt Applet "applet"

applet'attr
  :: Array (Attribute Applet)
  -> Array (Attribute Applet)
applet'attr = identity

data TApplet = TApplet

instance typeToSymTApplet :: TypeToSym TApplet "TApplet"

instance semigroupTApplet :: Semigroup TApplet where
  append _ _ = TApplet

instance monoidTApplet :: Monoid TApplet where
  mempty = TApplet

instance reifyTApplet :: ReifyAU Applet TApplet where
  reifyAU = const mempty
type Area' =
  ( tag :: String
  , attributes :: Array (Attribute Area)
  )
newtype Area = Area { | Area' }
unsafeUnArea :: Area -> { | Area' }
unsafeUnArea (Area unsafe) = unsafe

instance typeToSymArea ::
  TypeToSym Area "area"

area
  :: forall children
   . Array (Attribute Area)
  -> { | children }
  -> Element Area children
area = makeElt Area "area"

area'attr
  :: Array (Attribute Area)
  -> Array (Attribute Area)
area'attr = identity

data TArea = TArea

instance typeToSymTArea :: TypeToSym TArea "TArea"

instance semigroupTArea :: Semigroup TArea where
  append _ _ = TArea

instance monoidTArea :: Monoid TArea where
  mempty = TArea

instance reifyTArea :: ReifyAU Area TArea where
  reifyAU = const mempty
type Article' =
  ( tag :: String
  , attributes :: Array (Attribute Article)
  )
newtype Article = Article { | Article' }
unsafeUnArticle :: Article -> { | Article' }
unsafeUnArticle (Article unsafe) = unsafe

instance typeToSymArticle ::
  TypeToSym Article "article"

article
  :: forall children
   . Array (Attribute Article)
  -> { | children }
  -> Element Article children
article = makeElt Article "article"

article'attr
  :: Array (Attribute Article)
  -> Array (Attribute Article)
article'attr = identity

data TArticle = TArticle

instance typeToSymTArticle :: TypeToSym TArticle "TArticle"

instance semigroupTArticle :: Semigroup TArticle where
  append _ _ = TArticle

instance monoidTArticle :: Monoid TArticle where
  mempty = TArticle

instance reifyTArticle :: ReifyAU Article TArticle where
  reifyAU = const mempty
type Aside' =
  ( tag :: String
  , attributes :: Array (Attribute Aside)
  )
newtype Aside = Aside { | Aside' }
unsafeUnAside :: Aside -> { | Aside' }
unsafeUnAside (Aside unsafe) = unsafe

instance typeToSymAside ::
  TypeToSym Aside "aside"

aside
  :: forall children
   . Array (Attribute Aside)
  -> { | children }
  -> Element Aside children
aside = makeElt Aside "aside"

aside'attr
  :: Array (Attribute Aside)
  -> Array (Attribute Aside)
aside'attr = identity

data TAside = TAside

instance typeToSymTAside :: TypeToSym TAside "TAside"

instance semigroupTAside :: Semigroup TAside where
  append _ _ = TAside

instance monoidTAside :: Monoid TAside where
  mempty = TAside

instance reifyTAside :: ReifyAU Aside TAside where
  reifyAU = const mempty
type Audio' =
  ( tag :: String
  , attributes :: Array (Attribute Audio)
  )
newtype Audio = Audio { | Audio' }
unsafeUnAudio :: Audio -> { | Audio' }
unsafeUnAudio (Audio unsafe) = unsafe

instance typeToSymAudio ::
  TypeToSym Audio "audio"

audio
  :: forall children
   . Array (Attribute Audio)
  -> { | children }
  -> Element Audio children
audio = makeElt Audio "audio"

audio'attr
  :: Array (Attribute Audio)
  -> Array (Attribute Audio)
audio'attr = identity

data TAudio = TAudio

instance typeToSymTAudio :: TypeToSym TAudio "TAudio"

instance semigroupTAudio :: Semigroup TAudio where
  append _ _ = TAudio

instance monoidTAudio :: Monoid TAudio where
  mempty = TAudio

instance reifyTAudio :: ReifyAU Audio TAudio where
  reifyAU = const mempty
type B' =
  ( tag :: String
  , attributes :: Array (Attribute B)
  )
newtype B = B { | B' }
unsafeUnB :: B -> { | B' }
unsafeUnB (B unsafe) = unsafe

instance typeToSymB ::
  TypeToSym B "b"

b
  :: forall children
   . Array (Attribute B)
  -> { | children }
  -> Element B children
b = makeElt B "b"

b'attr
  :: Array (Attribute B)
  -> Array (Attribute B)
b'attr = identity

data TB = TB

instance typeToSymTB :: TypeToSym TB "TB"

instance semigroupTB :: Semigroup TB where
  append _ _ = TB

instance monoidTB :: Monoid TB where
  mempty = TB

instance reifyTB :: ReifyAU B TB where
  reifyAU = const mempty
type Base' =
  ( tag :: String
  , attributes :: Array (Attribute Base)
  )
newtype Base = Base { | Base' }
unsafeUnBase :: Base -> { | Base' }
unsafeUnBase (Base unsafe) = unsafe

instance typeToSymBase ::
  TypeToSym Base "base"

base
  :: forall children
   . Array (Attribute Base)
  -> { | children }
  -> Element Base children
base = makeElt Base "base"

base'attr
  :: Array (Attribute Base)
  -> Array (Attribute Base)
base'attr = identity

data TBase = TBase

instance typeToSymTBase :: TypeToSym TBase "TBase"

instance semigroupTBase :: Semigroup TBase where
  append _ _ = TBase

instance monoidTBase :: Monoid TBase where
  mempty = TBase

instance reifyTBase :: ReifyAU Base TBase where
  reifyAU = const mempty
type Basefont' =
  ( tag :: String
  , attributes :: Array (Attribute Basefont)
  )
newtype Basefont = Basefont { | Basefont' }
unsafeUnBasefont :: Basefont -> { | Basefont' }
unsafeUnBasefont (Basefont unsafe) = unsafe

instance typeToSymBasefont ::
  TypeToSym Basefont "basefont"

basefont
  :: forall children
   . Array (Attribute Basefont)
  -> { | children }
  -> Element Basefont children
basefont = makeElt Basefont "basefont"

basefont'attr
  :: Array (Attribute Basefont)
  -> Array (Attribute Basefont)
basefont'attr = identity

data TBasefont = TBasefont

instance typeToSymTBasefont :: TypeToSym TBasefont "TBasefont"

instance semigroupTBasefont :: Semigroup TBasefont where
  append _ _ = TBasefont

instance monoidTBasefont :: Monoid TBasefont where
  mempty = TBasefont

instance reifyTBasefont :: ReifyAU Basefont TBasefont where
  reifyAU = const mempty
type Bdi' =
  ( tag :: String
  , attributes :: Array (Attribute Bdi)
  )
newtype Bdi = Bdi { | Bdi' }
unsafeUnBdi :: Bdi -> { | Bdi' }
unsafeUnBdi (Bdi unsafe) = unsafe

instance typeToSymBdi ::
  TypeToSym Bdi "bdi"

bdi
  :: forall children
   . Array (Attribute Bdi)
  -> { | children }
  -> Element Bdi children
bdi = makeElt Bdi "bdi"

bdi'attr
  :: Array (Attribute Bdi)
  -> Array (Attribute Bdi)
bdi'attr = identity

data TBdi = TBdi

instance typeToSymTBdi :: TypeToSym TBdi "TBdi"

instance semigroupTBdi :: Semigroup TBdi where
  append _ _ = TBdi

instance monoidTBdi :: Monoid TBdi where
  mempty = TBdi

instance reifyTBdi :: ReifyAU Bdi TBdi where
  reifyAU = const mempty
type Bdo' =
  ( tag :: String
  , attributes :: Array (Attribute Bdo)
  )
newtype Bdo = Bdo { | Bdo' }
unsafeUnBdo :: Bdo -> { | Bdo' }
unsafeUnBdo (Bdo unsafe) = unsafe

instance typeToSymBdo ::
  TypeToSym Bdo "bdo"

bdo
  :: forall children
   . Array (Attribute Bdo)
  -> { | children }
  -> Element Bdo children
bdo = makeElt Bdo "bdo"

bdo'attr
  :: Array (Attribute Bdo)
  -> Array (Attribute Bdo)
bdo'attr = identity

data TBdo = TBdo

instance typeToSymTBdo :: TypeToSym TBdo "TBdo"

instance semigroupTBdo :: Semigroup TBdo where
  append _ _ = TBdo

instance monoidTBdo :: Monoid TBdo where
  mempty = TBdo

instance reifyTBdo :: ReifyAU Bdo TBdo where
  reifyAU = const mempty
type Big' =
  ( tag :: String
  , attributes :: Array (Attribute Big)
  )
newtype Big = Big { | Big' }
unsafeUnBig :: Big -> { | Big' }
unsafeUnBig (Big unsafe) = unsafe

instance typeToSymBig ::
  TypeToSym Big "big"

big
  :: forall children
   . Array (Attribute Big)
  -> { | children }
  -> Element Big children
big = makeElt Big "big"

big'attr
  :: Array (Attribute Big)
  -> Array (Attribute Big)
big'attr = identity

data TBig = TBig

instance typeToSymTBig :: TypeToSym TBig "TBig"

instance semigroupTBig :: Semigroup TBig where
  append _ _ = TBig

instance monoidTBig :: Monoid TBig where
  mempty = TBig

instance reifyTBig :: ReifyAU Big TBig where
  reifyAU = const mempty
type Blockquote' =
  ( tag :: String
  , attributes :: Array (Attribute Blockquote)
  )
newtype Blockquote = Blockquote { | Blockquote' }
unsafeUnBlockquote :: Blockquote -> { | Blockquote' }
unsafeUnBlockquote (Blockquote unsafe) = unsafe

instance typeToSymBlockquote ::
  TypeToSym Blockquote "blockquote"

blockquote
  :: forall children
   . Array (Attribute Blockquote)
  -> { | children }
  -> Element Blockquote children
blockquote = makeElt Blockquote "blockquote"

blockquote'attr
  :: Array (Attribute Blockquote)
  -> Array (Attribute Blockquote)
blockquote'attr = identity

data TBlockquote = TBlockquote

instance typeToSymTBlockquote :: TypeToSym TBlockquote "TBlockquote"

instance semigroupTBlockquote :: Semigroup TBlockquote where
  append _ _ = TBlockquote

instance monoidTBlockquote :: Monoid TBlockquote where
  mempty = TBlockquote

instance reifyTBlockquote :: ReifyAU Blockquote TBlockquote where
  reifyAU = const mempty
type Body' =
  ( tag :: String
  , attributes :: Array (Attribute Body)
  )
newtype Body = Body { | Body' }
unsafeUnBody :: Body -> { | Body' }
unsafeUnBody (Body unsafe) = unsafe

instance typeToSymBody ::
  TypeToSym Body "body"

body
  :: forall children
   . Array (Attribute Body)
  -> { | children }
  -> Element Body children
body = makeElt Body "body"

body'attr
  :: Array (Attribute Body)
  -> Array (Attribute Body)
body'attr = identity

data TBody = TBody

instance typeToSymTBody :: TypeToSym TBody "TBody"

instance semigroupTBody :: Semigroup TBody where
  append _ _ = TBody

instance monoidTBody :: Monoid TBody where
  mempty = TBody

instance reifyTBody :: ReifyAU Body TBody where
  reifyAU = const mempty
type Br' =
  ( tag :: String
  , attributes :: Array (Attribute Br)
  )
newtype Br = Br { | Br' }
unsafeUnBr :: Br -> { | Br' }
unsafeUnBr (Br unsafe) = unsafe

instance typeToSymBr ::
  TypeToSym Br "br"

br
  :: forall children
   . Array (Attribute Br)
  -> { | children }
  -> Element Br children
br = makeElt Br "br"

br'attr
  :: Array (Attribute Br)
  -> Array (Attribute Br)
br'attr = identity

data TBr = TBr

instance typeToSymTBr :: TypeToSym TBr "TBr"

instance semigroupTBr :: Semigroup TBr where
  append _ _ = TBr

instance monoidTBr :: Monoid TBr where
  mempty = TBr

instance reifyTBr :: ReifyAU Br TBr where
  reifyAU = const mempty
type Button' =
  ( tag :: String
  , attributes :: Array (Attribute Button)
  )
newtype Button = Button { | Button' }
unsafeUnButton :: Button -> { | Button' }
unsafeUnButton (Button unsafe) = unsafe

instance typeToSymButton ::
  TypeToSym Button "button"

button
  :: forall children
   . Array (Attribute Button)
  -> { | children }
  -> Element Button children
button = makeElt Button "button"

button'attr
  :: Array (Attribute Button)
  -> Array (Attribute Button)
button'attr = identity

data TButton = TButton

instance typeToSymTButton :: TypeToSym TButton "TButton"

instance semigroupTButton :: Semigroup TButton where
  append _ _ = TButton

instance monoidTButton :: Monoid TButton where
  mempty = TButton

instance reifyTButton :: ReifyAU Button TButton where
  reifyAU = const mempty
type Canvas' =
  ( tag :: String
  , attributes :: Array (Attribute Canvas)
  )
newtype Canvas = Canvas { | Canvas' }
unsafeUnCanvas :: Canvas -> { | Canvas' }
unsafeUnCanvas (Canvas unsafe) = unsafe

instance typeToSymCanvas ::
  TypeToSym Canvas "canvas"

canvas
  :: forall children
   . Array (Attribute Canvas)
  -> { | children }
  -> Element Canvas children
canvas = makeElt Canvas "canvas"

canvas'attr
  :: Array (Attribute Canvas)
  -> Array (Attribute Canvas)
canvas'attr = identity

data TCanvas = TCanvas

instance typeToSymTCanvas :: TypeToSym TCanvas "TCanvas"

instance semigroupTCanvas :: Semigroup TCanvas where
  append _ _ = TCanvas

instance monoidTCanvas :: Monoid TCanvas where
  mempty = TCanvas

instance reifyTCanvas :: ReifyAU Canvas TCanvas where
  reifyAU = const mempty
type Caption' =
  ( tag :: String
  , attributes :: Array (Attribute Caption)
  )
newtype Caption = Caption { | Caption' }
unsafeUnCaption :: Caption -> { | Caption' }
unsafeUnCaption (Caption unsafe) = unsafe

instance typeToSymCaption ::
  TypeToSym Caption "caption"

caption
  :: forall children
   . Array (Attribute Caption)
  -> { | children }
  -> Element Caption children
caption = makeElt Caption "caption"

caption'attr
  :: Array (Attribute Caption)
  -> Array (Attribute Caption)
caption'attr = identity

data TCaption = TCaption

instance typeToSymTCaption :: TypeToSym TCaption "TCaption"

instance semigroupTCaption :: Semigroup TCaption where
  append _ _ = TCaption

instance monoidTCaption :: Monoid TCaption where
  mempty = TCaption

instance reifyTCaption :: ReifyAU Caption TCaption where
  reifyAU = const mempty
type Center' =
  ( tag :: String
  , attributes :: Array (Attribute Center)
  )
newtype Center = Center { | Center' }
unsafeUnCenter :: Center -> { | Center' }
unsafeUnCenter (Center unsafe) = unsafe

instance typeToSymCenter ::
  TypeToSym Center "center"

center
  :: forall children
   . Array (Attribute Center)
  -> { | children }
  -> Element Center children
center = makeElt Center "center"

center'attr
  :: Array (Attribute Center)
  -> Array (Attribute Center)
center'attr = identity

data TCenter = TCenter

instance typeToSymTCenter :: TypeToSym TCenter "TCenter"

instance semigroupTCenter :: Semigroup TCenter where
  append _ _ = TCenter

instance monoidTCenter :: Monoid TCenter where
  mempty = TCenter

instance reifyTCenter :: ReifyAU Center TCenter where
  reifyAU = const mempty
type Cite' =
  ( tag :: String
  , attributes :: Array (Attribute Cite)
  )
newtype Cite = Cite { | Cite' }
unsafeUnCite :: Cite -> { | Cite' }
unsafeUnCite (Cite unsafe) = unsafe

instance typeToSymCite ::
  TypeToSym Cite "cite"

cite
  :: forall children
   . Array (Attribute Cite)
  -> { | children }
  -> Element Cite children
cite = makeElt Cite "cite"

cite'attr
  :: Array (Attribute Cite)
  -> Array (Attribute Cite)
cite'attr = identity

data TCite = TCite

instance typeToSymTCite :: TypeToSym TCite "TCite"

instance semigroupTCite :: Semigroup TCite where
  append _ _ = TCite

instance monoidTCite :: Monoid TCite where
  mempty = TCite

instance reifyTCite :: ReifyAU Cite TCite where
  reifyAU = const mempty
type Code' =
  ( tag :: String
  , attributes :: Array (Attribute Code)
  )
newtype Code = Code { | Code' }
unsafeUnCode :: Code -> { | Code' }
unsafeUnCode (Code unsafe) = unsafe

instance typeToSymCode ::
  TypeToSym Code "code"

code
  :: forall children
   . Array (Attribute Code)
  -> { | children }
  -> Element Code children
code = makeElt Code "code"

code'attr
  :: Array (Attribute Code)
  -> Array (Attribute Code)
code'attr = identity

data TCode = TCode

instance typeToSymTCode :: TypeToSym TCode "TCode"

instance semigroupTCode :: Semigroup TCode where
  append _ _ = TCode

instance monoidTCode :: Monoid TCode where
  mempty = TCode

instance reifyTCode :: ReifyAU Code TCode where
  reifyAU = const mempty
type Col' =
  ( tag :: String
  , attributes :: Array (Attribute Col)
  )
newtype Col = Col { | Col' }
unsafeUnCol :: Col -> { | Col' }
unsafeUnCol (Col unsafe) = unsafe

instance typeToSymCol ::
  TypeToSym Col "col"

col
  :: forall children
   . Array (Attribute Col)
  -> { | children }
  -> Element Col children
col = makeElt Col "col"

col'attr
  :: Array (Attribute Col)
  -> Array (Attribute Col)
col'attr = identity

data TCol = TCol

instance typeToSymTCol :: TypeToSym TCol "TCol"

instance semigroupTCol :: Semigroup TCol where
  append _ _ = TCol

instance monoidTCol :: Monoid TCol where
  mempty = TCol

instance reifyTCol :: ReifyAU Col TCol where
  reifyAU = const mempty
type Colgroup' =
  ( tag :: String
  , attributes :: Array (Attribute Colgroup)
  )
newtype Colgroup = Colgroup { | Colgroup' }
unsafeUnColgroup :: Colgroup -> { | Colgroup' }
unsafeUnColgroup (Colgroup unsafe) = unsafe

instance typeToSymColgroup ::
  TypeToSym Colgroup "colgroup"

colgroup
  :: forall children
   . Array (Attribute Colgroup)
  -> { | children }
  -> Element Colgroup children
colgroup = makeElt Colgroup "colgroup"

colgroup'attr
  :: Array (Attribute Colgroup)
  -> Array (Attribute Colgroup)
colgroup'attr = identity

data TColgroup = TColgroup

instance typeToSymTColgroup :: TypeToSym TColgroup "TColgroup"

instance semigroupTColgroup :: Semigroup TColgroup where
  append _ _ = TColgroup

instance monoidTColgroup :: Monoid TColgroup where
  mempty = TColgroup

instance reifyTColgroup :: ReifyAU Colgroup TColgroup where
  reifyAU = const mempty
type Data' =
  ( tag :: String
  , attributes :: Array (Attribute Data)
  )
newtype Data = Data { | Data' }
unsafeUnData :: Data -> { | Data' }
unsafeUnData (Data unsafe) = unsafe

instance typeToSymData ::
  TypeToSym Data "data"

xdata
  :: forall children
   . Array (Attribute Data)
  -> { | children }
  -> Element Data children
xdata = makeElt Data "data"

xdata'attr
  :: Array (Attribute Data)
  -> Array (Attribute Data)
xdata'attr = identity

data TData = TData

instance typeToSymTData :: TypeToSym TData "TData"

instance semigroupTData :: Semigroup TData where
  append _ _ = TData

instance monoidTData :: Monoid TData where
  mempty = TData

instance reifyTData :: ReifyAU Data TData where
  reifyAU = const mempty
type Datalist' =
  ( tag :: String
  , attributes :: Array (Attribute Datalist)
  )
newtype Datalist = Datalist { | Datalist' }
unsafeUnDatalist :: Datalist -> { | Datalist' }
unsafeUnDatalist (Datalist unsafe) = unsafe

instance typeToSymDatalist ::
  TypeToSym Datalist "datalist"

datalist
  :: forall children
   . Array (Attribute Datalist)
  -> { | children }
  -> Element Datalist children
datalist = makeElt Datalist "datalist"

datalist'attr
  :: Array (Attribute Datalist)
  -> Array (Attribute Datalist)
datalist'attr = identity

data TDatalist = TDatalist

instance typeToSymTDatalist :: TypeToSym TDatalist "TDatalist"

instance semigroupTDatalist :: Semigroup TDatalist where
  append _ _ = TDatalist

instance monoidTDatalist :: Monoid TDatalist where
  mempty = TDatalist

instance reifyTDatalist :: ReifyAU Datalist TDatalist where
  reifyAU = const mempty
type Dd' =
  ( tag :: String
  , attributes :: Array (Attribute Dd)
  )
newtype Dd = Dd { | Dd' }
unsafeUnDd :: Dd -> { | Dd' }
unsafeUnDd (Dd unsafe) = unsafe

instance typeToSymDd ::
  TypeToSym Dd "dd"

dd
  :: forall children
   . Array (Attribute Dd)
  -> { | children }
  -> Element Dd children
dd = makeElt Dd "dd"

dd'attr
  :: Array (Attribute Dd)
  -> Array (Attribute Dd)
dd'attr = identity

data TDd = TDd

instance typeToSymTDd :: TypeToSym TDd "TDd"

instance semigroupTDd :: Semigroup TDd where
  append _ _ = TDd

instance monoidTDd :: Monoid TDd where
  mempty = TDd

instance reifyTDd :: ReifyAU Dd TDd where
  reifyAU = const mempty
type Del' =
  ( tag :: String
  , attributes :: Array (Attribute Del)
  )
newtype Del = Del { | Del' }
unsafeUnDel :: Del -> { | Del' }
unsafeUnDel (Del unsafe) = unsafe

instance typeToSymDel ::
  TypeToSym Del "del"

del
  :: forall children
   . Array (Attribute Del)
  -> { | children }
  -> Element Del children
del = makeElt Del "del"

del'attr
  :: Array (Attribute Del)
  -> Array (Attribute Del)
del'attr = identity

data TDel = TDel

instance typeToSymTDel :: TypeToSym TDel "TDel"

instance semigroupTDel :: Semigroup TDel where
  append _ _ = TDel

instance monoidTDel :: Monoid TDel where
  mempty = TDel

instance reifyTDel :: ReifyAU Del TDel where
  reifyAU = const mempty
type Details' =
  ( tag :: String
  , attributes :: Array (Attribute Details)
  )
newtype Details = Details { | Details' }
unsafeUnDetails :: Details -> { | Details' }
unsafeUnDetails (Details unsafe) = unsafe

instance typeToSymDetails ::
  TypeToSym Details "details"

details
  :: forall children
   . Array (Attribute Details)
  -> { | children }
  -> Element Details children
details = makeElt Details "details"

details'attr
  :: Array (Attribute Details)
  -> Array (Attribute Details)
details'attr = identity

data TDetails = TDetails

instance typeToSymTDetails :: TypeToSym TDetails "TDetails"

instance semigroupTDetails :: Semigroup TDetails where
  append _ _ = TDetails

instance monoidTDetails :: Monoid TDetails where
  mempty = TDetails

instance reifyTDetails :: ReifyAU Details TDetails where
  reifyAU = const mempty
type Dfn' =
  ( tag :: String
  , attributes :: Array (Attribute Dfn)
  )
newtype Dfn = Dfn { | Dfn' }
unsafeUnDfn :: Dfn -> { | Dfn' }
unsafeUnDfn (Dfn unsafe) = unsafe

instance typeToSymDfn ::
  TypeToSym Dfn "dfn"

dfn
  :: forall children
   . Array (Attribute Dfn)
  -> { | children }
  -> Element Dfn children
dfn = makeElt Dfn "dfn"

dfn'attr
  :: Array (Attribute Dfn)
  -> Array (Attribute Dfn)
dfn'attr = identity

data TDfn = TDfn

instance typeToSymTDfn :: TypeToSym TDfn "TDfn"

instance semigroupTDfn :: Semigroup TDfn where
  append _ _ = TDfn

instance monoidTDfn :: Monoid TDfn where
  mempty = TDfn

instance reifyTDfn :: ReifyAU Dfn TDfn where
  reifyAU = const mempty
type Dialog' =
  ( tag :: String
  , attributes :: Array (Attribute Dialog)
  )
newtype Dialog = Dialog { | Dialog' }
unsafeUnDialog :: Dialog -> { | Dialog' }
unsafeUnDialog (Dialog unsafe) = unsafe

instance typeToSymDialog ::
  TypeToSym Dialog "dialog"

dialog
  :: forall children
   . Array (Attribute Dialog)
  -> { | children }
  -> Element Dialog children
dialog = makeElt Dialog "dialog"

dialog'attr
  :: Array (Attribute Dialog)
  -> Array (Attribute Dialog)
dialog'attr = identity

data TDialog = TDialog

instance typeToSymTDialog :: TypeToSym TDialog "TDialog"

instance semigroupTDialog :: Semigroup TDialog where
  append _ _ = TDialog

instance monoidTDialog :: Monoid TDialog where
  mempty = TDialog

instance reifyTDialog :: ReifyAU Dialog TDialog where
  reifyAU = const mempty
type Dir' =
  ( tag :: String
  , attributes :: Array (Attribute Dir)
  )
newtype Dir = Dir { | Dir' }
unsafeUnDir :: Dir -> { | Dir' }
unsafeUnDir (Dir unsafe) = unsafe

instance typeToSymDir ::
  TypeToSym Dir "dir"

dir
  :: forall children
   . Array (Attribute Dir)
  -> { | children }
  -> Element Dir children
dir = makeElt Dir "dir"

dir'attr
  :: Array (Attribute Dir)
  -> Array (Attribute Dir)
dir'attr = identity

data TDir = TDir

instance typeToSymTDir :: TypeToSym TDir "TDir"

instance semigroupTDir :: Semigroup TDir where
  append _ _ = TDir

instance monoidTDir :: Monoid TDir where
  mempty = TDir

instance reifyTDir :: ReifyAU Dir TDir where
  reifyAU = const mempty
type Div' =
  ( tag :: String
  , attributes :: Array (Attribute Div)
  )
newtype Div = Div { | Div' }
unsafeUnDiv :: Div -> { | Div' }
unsafeUnDiv (Div unsafe) = unsafe

instance typeToSymDiv ::
  TypeToSym Div "div"

div
  :: forall children
   . Array (Attribute Div)
  -> { | children }
  -> Element Div children
div = makeElt Div "div"

div'attr
  :: Array (Attribute Div)
  -> Array (Attribute Div)
div'attr = identity

data TDiv = TDiv

instance typeToSymTDiv :: TypeToSym TDiv "TDiv"

instance semigroupTDiv :: Semigroup TDiv where
  append _ _ = TDiv

instance monoidTDiv :: Monoid TDiv where
  mempty = TDiv

instance reifyTDiv :: ReifyAU Div TDiv where
  reifyAU = const mempty
type Dl' =
  ( tag :: String
  , attributes :: Array (Attribute Dl)
  )
newtype Dl = Dl { | Dl' }
unsafeUnDl :: Dl -> { | Dl' }
unsafeUnDl (Dl unsafe) = unsafe

instance typeToSymDl ::
  TypeToSym Dl "dl"

dl
  :: forall children
   . Array (Attribute Dl)
  -> { | children }
  -> Element Dl children
dl = makeElt Dl "dl"

dl'attr
  :: Array (Attribute Dl)
  -> Array (Attribute Dl)
dl'attr = identity

data TDl = TDl

instance typeToSymTDl :: TypeToSym TDl "TDl"

instance semigroupTDl :: Semigroup TDl where
  append _ _ = TDl

instance monoidTDl :: Monoid TDl where
  mempty = TDl

instance reifyTDl :: ReifyAU Dl TDl where
  reifyAU = const mempty
type Dt' =
  ( tag :: String
  , attributes :: Array (Attribute Dt)
  )
newtype Dt = Dt { | Dt' }
unsafeUnDt :: Dt -> { | Dt' }
unsafeUnDt (Dt unsafe) = unsafe

instance typeToSymDt ::
  TypeToSym Dt "dt"

dt
  :: forall children
   . Array (Attribute Dt)
  -> { | children }
  -> Element Dt children
dt = makeElt Dt "dt"

dt'attr
  :: Array (Attribute Dt)
  -> Array (Attribute Dt)
dt'attr = identity

data TDt = TDt

instance typeToSymTDt :: TypeToSym TDt "TDt"

instance semigroupTDt :: Semigroup TDt where
  append _ _ = TDt

instance monoidTDt :: Monoid TDt where
  mempty = TDt

instance reifyTDt :: ReifyAU Dt TDt where
  reifyAU = const mempty
type Em' =
  ( tag :: String
  , attributes :: Array (Attribute Em)
  )
newtype Em = Em { | Em' }
unsafeUnEm :: Em -> { | Em' }
unsafeUnEm (Em unsafe) = unsafe

instance typeToSymEm ::
  TypeToSym Em "em"

em
  :: forall children
   . Array (Attribute Em)
  -> { | children }
  -> Element Em children
em = makeElt Em "em"

em'attr
  :: Array (Attribute Em)
  -> Array (Attribute Em)
em'attr = identity

data TEm = TEm

instance typeToSymTEm :: TypeToSym TEm "TEm"

instance semigroupTEm :: Semigroup TEm where
  append _ _ = TEm

instance monoidTEm :: Monoid TEm where
  mempty = TEm

instance reifyTEm :: ReifyAU Em TEm where
  reifyAU = const mempty
type Embed' =
  ( tag :: String
  , attributes :: Array (Attribute Embed)
  )
newtype Embed = Embed { | Embed' }
unsafeUnEmbed :: Embed -> { | Embed' }
unsafeUnEmbed (Embed unsafe) = unsafe

instance typeToSymEmbed ::
  TypeToSym Embed "embed"

embed
  :: forall children
   . Array (Attribute Embed)
  -> { | children }
  -> Element Embed children
embed = makeElt Embed "embed"

embed'attr
  :: Array (Attribute Embed)
  -> Array (Attribute Embed)
embed'attr = identity

data TEmbed = TEmbed

instance typeToSymTEmbed :: TypeToSym TEmbed "TEmbed"

instance semigroupTEmbed :: Semigroup TEmbed where
  append _ _ = TEmbed

instance monoidTEmbed :: Monoid TEmbed where
  mempty = TEmbed

instance reifyTEmbed :: ReifyAU Embed TEmbed where
  reifyAU = const mempty
type Fieldset' =
  ( tag :: String
  , attributes :: Array (Attribute Fieldset)
  )
newtype Fieldset = Fieldset { | Fieldset' }
unsafeUnFieldset :: Fieldset -> { | Fieldset' }
unsafeUnFieldset (Fieldset unsafe) = unsafe

instance typeToSymFieldset ::
  TypeToSym Fieldset "fieldset"

fieldset
  :: forall children
   . Array (Attribute Fieldset)
  -> { | children }
  -> Element Fieldset children
fieldset = makeElt Fieldset "fieldset"

fieldset'attr
  :: Array (Attribute Fieldset)
  -> Array (Attribute Fieldset)
fieldset'attr = identity

data TFieldset = TFieldset

instance typeToSymTFieldset :: TypeToSym TFieldset "TFieldset"

instance semigroupTFieldset :: Semigroup TFieldset where
  append _ _ = TFieldset

instance monoidTFieldset :: Monoid TFieldset where
  mempty = TFieldset

instance reifyTFieldset :: ReifyAU Fieldset TFieldset where
  reifyAU = const mempty
type Figcaption' =
  ( tag :: String
  , attributes :: Array (Attribute Figcaption)
  )
newtype Figcaption = Figcaption { | Figcaption' }
unsafeUnFigcaption :: Figcaption -> { | Figcaption' }
unsafeUnFigcaption (Figcaption unsafe) = unsafe

instance typeToSymFigcaption ::
  TypeToSym Figcaption "figcaption"

figcaption
  :: forall children
   . Array (Attribute Figcaption)
  -> { | children }
  -> Element Figcaption children
figcaption = makeElt Figcaption "figcaption"

figcaption'attr
  :: Array (Attribute Figcaption)
  -> Array (Attribute Figcaption)
figcaption'attr = identity

data TFigcaption = TFigcaption

instance typeToSymTFigcaption :: TypeToSym TFigcaption "TFigcaption"

instance semigroupTFigcaption :: Semigroup TFigcaption where
  append _ _ = TFigcaption

instance monoidTFigcaption :: Monoid TFigcaption where
  mempty = TFigcaption

instance reifyTFigcaption :: ReifyAU Figcaption TFigcaption where
  reifyAU = const mempty
type Figure' =
  ( tag :: String
  , attributes :: Array (Attribute Figure)
  )
newtype Figure = Figure { | Figure' }
unsafeUnFigure :: Figure -> { | Figure' }
unsafeUnFigure (Figure unsafe) = unsafe

instance typeToSymFigure ::
  TypeToSym Figure "figure"

figure
  :: forall children
   . Array (Attribute Figure)
  -> { | children }
  -> Element Figure children
figure = makeElt Figure "figure"

figure'attr
  :: Array (Attribute Figure)
  -> Array (Attribute Figure)
figure'attr = identity

data TFigure = TFigure

instance typeToSymTFigure :: TypeToSym TFigure "TFigure"

instance semigroupTFigure :: Semigroup TFigure where
  append _ _ = TFigure

instance monoidTFigure :: Monoid TFigure where
  mempty = TFigure

instance reifyTFigure :: ReifyAU Figure TFigure where
  reifyAU = const mempty
type Font' =
  ( tag :: String
  , attributes :: Array (Attribute Font)
  )
newtype Font = Font { | Font' }
unsafeUnFont :: Font -> { | Font' }
unsafeUnFont (Font unsafe) = unsafe

instance typeToSymFont ::
  TypeToSym Font "font"

font
  :: forall children
   . Array (Attribute Font)
  -> { | children }
  -> Element Font children
font = makeElt Font "font"

font'attr
  :: Array (Attribute Font)
  -> Array (Attribute Font)
font'attr = identity

data TFont = TFont

instance typeToSymTFont :: TypeToSym TFont "TFont"

instance semigroupTFont :: Semigroup TFont where
  append _ _ = TFont

instance monoidTFont :: Monoid TFont where
  mempty = TFont

instance reifyTFont :: ReifyAU Font TFont where
  reifyAU = const mempty
type Footer' =
  ( tag :: String
  , attributes :: Array (Attribute Footer)
  )
newtype Footer = Footer { | Footer' }
unsafeUnFooter :: Footer -> { | Footer' }
unsafeUnFooter (Footer unsafe) = unsafe

instance typeToSymFooter ::
  TypeToSym Footer "footer"

footer
  :: forall children
   . Array (Attribute Footer)
  -> { | children }
  -> Element Footer children
footer = makeElt Footer "footer"

footer'attr
  :: Array (Attribute Footer)
  -> Array (Attribute Footer)
footer'attr = identity

data TFooter = TFooter

instance typeToSymTFooter :: TypeToSym TFooter "TFooter"

instance semigroupTFooter :: Semigroup TFooter where
  append _ _ = TFooter

instance monoidTFooter :: Monoid TFooter where
  mempty = TFooter

instance reifyTFooter :: ReifyAU Footer TFooter where
  reifyAU = const mempty
type Form' =
  ( tag :: String
  , attributes :: Array (Attribute Form)
  )
newtype Form = Form { | Form' }
unsafeUnForm :: Form -> { | Form' }
unsafeUnForm (Form unsafe) = unsafe

instance typeToSymForm ::
  TypeToSym Form "form"

form
  :: forall children
   . Array (Attribute Form)
  -> { | children }
  -> Element Form children
form = makeElt Form "form"

form'attr
  :: Array (Attribute Form)
  -> Array (Attribute Form)
form'attr = identity

data TForm = TForm

instance typeToSymTForm :: TypeToSym TForm "TForm"

instance semigroupTForm :: Semigroup TForm where
  append _ _ = TForm

instance monoidTForm :: Monoid TForm where
  mempty = TForm

instance reifyTForm :: ReifyAU Form TForm where
  reifyAU = const mempty
type Frame' =
  ( tag :: String
  , attributes :: Array (Attribute Frame)
  )
newtype Frame = Frame { | Frame' }
unsafeUnFrame :: Frame -> { | Frame' }
unsafeUnFrame (Frame unsafe) = unsafe

instance typeToSymFrame ::
  TypeToSym Frame "frame"

frame
  :: forall children
   . Array (Attribute Frame)
  -> { | children }
  -> Element Frame children
frame = makeElt Frame "frame"

frame'attr
  :: Array (Attribute Frame)
  -> Array (Attribute Frame)
frame'attr = identity

data TFrame = TFrame

instance typeToSymTFrame :: TypeToSym TFrame "TFrame"

instance semigroupTFrame :: Semigroup TFrame where
  append _ _ = TFrame

instance monoidTFrame :: Monoid TFrame where
  mempty = TFrame

instance reifyTFrame :: ReifyAU Frame TFrame where
  reifyAU = const mempty
type Frameset' =
  ( tag :: String
  , attributes :: Array (Attribute Frameset)
  )
newtype Frameset = Frameset { | Frameset' }
unsafeUnFrameset :: Frameset -> { | Frameset' }
unsafeUnFrameset (Frameset unsafe) = unsafe

instance typeToSymFrameset ::
  TypeToSym Frameset "frameset"

frameset
  :: forall children
   . Array (Attribute Frameset)
  -> { | children }
  -> Element Frameset children
frameset = makeElt Frameset "frameset"

frameset'attr
  :: Array (Attribute Frameset)
  -> Array (Attribute Frameset)
frameset'attr = identity

data TFrameset = TFrameset

instance typeToSymTFrameset :: TypeToSym TFrameset "TFrameset"

instance semigroupTFrameset :: Semigroup TFrameset where
  append _ _ = TFrameset

instance monoidTFrameset :: Monoid TFrameset where
  mempty = TFrameset

instance reifyTFrameset :: ReifyAU Frameset TFrameset where
  reifyAU = const mempty
type H1' =
  ( tag :: String
  , attributes :: Array (Attribute H1)
  )
newtype H1 = H1 { | H1' }
unsafeUnH1 :: H1 -> { | H1' }
unsafeUnH1 (H1 unsafe) = unsafe

instance typeToSymH1 ::
  TypeToSym H1 "h1"

h1
  :: forall children
   . Array (Attribute H1)
  -> { | children }
  -> Element H1 children
h1 = makeElt H1 "h1"

h1'attr
  :: Array (Attribute H1)
  -> Array (Attribute H1)
h1'attr = identity

data TH1 = TH1

instance typeToSymTH1 :: TypeToSym TH1 "TH1"

instance semigroupTH1 :: Semigroup TH1 where
  append _ _ = TH1

instance monoidTH1 :: Monoid TH1 where
  mempty = TH1

instance reifyTH1 :: ReifyAU H1 TH1 where
  reifyAU = const mempty
type H2' =
  ( tag :: String
  , attributes :: Array (Attribute H2)
  )
newtype H2 = H2 { | H2' }
unsafeUnH2 :: H2 -> { | H2' }
unsafeUnH2 (H2 unsafe) = unsafe

instance typeToSymH2 ::
  TypeToSym H2 "h2"

h2
  :: forall children
   . Array (Attribute H2)
  -> { | children }
  -> Element H2 children
h2 = makeElt H2 "h2"

h2'attr
  :: Array (Attribute H2)
  -> Array (Attribute H2)
h2'attr = identity

data TH2 = TH2

instance typeToSymTH2 :: TypeToSym TH2 "TH2"

instance semigroupTH2 :: Semigroup TH2 where
  append _ _ = TH2

instance monoidTH2 :: Monoid TH2 where
  mempty = TH2

instance reifyTH2 :: ReifyAU H2 TH2 where
  reifyAU = const mempty
type H3' =
  ( tag :: String
  , attributes :: Array (Attribute H3)
  )
newtype H3 = H3 { | H3' }
unsafeUnH3 :: H3 -> { | H3' }
unsafeUnH3 (H3 unsafe) = unsafe

instance typeToSymH3 ::
  TypeToSym H3 "h3"

h3
  :: forall children
   . Array (Attribute H3)
  -> { | children }
  -> Element H3 children
h3 = makeElt H3 "h3"

h3'attr
  :: Array (Attribute H3)
  -> Array (Attribute H3)
h3'attr = identity

data TH3 = TH3

instance typeToSymTH3 :: TypeToSym TH3 "TH3"

instance semigroupTH3 :: Semigroup TH3 where
  append _ _ = TH3

instance monoidTH3 :: Monoid TH3 where
  mempty = TH3

instance reifyTH3 :: ReifyAU H3 TH3 where
  reifyAU = const mempty
type H4' =
  ( tag :: String
  , attributes :: Array (Attribute H4)
  )
newtype H4 = H4 { | H4' }
unsafeUnH4 :: H4 -> { | H4' }
unsafeUnH4 (H4 unsafe) = unsafe

instance typeToSymH4 ::
  TypeToSym H4 "h4"

h4
  :: forall children
   . Array (Attribute H4)
  -> { | children }
  -> Element H4 children
h4 = makeElt H4 "h4"

h4'attr
  :: Array (Attribute H4)
  -> Array (Attribute H4)
h4'attr = identity

data TH4 = TH4

instance typeToSymTH4 :: TypeToSym TH4 "TH4"

instance semigroupTH4 :: Semigroup TH4 where
  append _ _ = TH4

instance monoidTH4 :: Monoid TH4 where
  mempty = TH4

instance reifyTH4 :: ReifyAU H4 TH4 where
  reifyAU = const mempty
type H5' =
  ( tag :: String
  , attributes :: Array (Attribute H5)
  )
newtype H5 = H5 { | H5' }
unsafeUnH5 :: H5 -> { | H5' }
unsafeUnH5 (H5 unsafe) = unsafe

instance typeToSymH5 ::
  TypeToSym H5 "h5"

h5
  :: forall children
   . Array (Attribute H5)
  -> { | children }
  -> Element H5 children
h5 = makeElt H5 "h5"

h5'attr
  :: Array (Attribute H5)
  -> Array (Attribute H5)
h5'attr = identity

data TH5 = TH5

instance typeToSymTH5 :: TypeToSym TH5 "TH5"

instance semigroupTH5 :: Semigroup TH5 where
  append _ _ = TH5

instance monoidTH5 :: Monoid TH5 where
  mempty = TH5

instance reifyTH5 :: ReifyAU H5 TH5 where
  reifyAU = const mempty
type H6' =
  ( tag :: String
  , attributes :: Array (Attribute H6)
  )
newtype H6 = H6 { | H6' }
unsafeUnH6 :: H6 -> { | H6' }
unsafeUnH6 (H6 unsafe) = unsafe

instance typeToSymH6 ::
  TypeToSym H6 "h6"

h6
  :: forall children
   . Array (Attribute H6)
  -> { | children }
  -> Element H6 children
h6 = makeElt H6 "h6"

h6'attr
  :: Array (Attribute H6)
  -> Array (Attribute H6)
h6'attr = identity

data TH6 = TH6

instance typeToSymTH6 :: TypeToSym TH6 "TH6"

instance semigroupTH6 :: Semigroup TH6 where
  append _ _ = TH6

instance monoidTH6 :: Monoid TH6 where
  mempty = TH6

instance reifyTH6 :: ReifyAU H6 TH6 where
  reifyAU = const mempty
type Head' =
  ( tag :: String
  , attributes :: Array (Attribute Head)
  )
newtype Head = Head { | Head' }
unsafeUnHead :: Head -> { | Head' }
unsafeUnHead (Head unsafe) = unsafe

instance typeToSymHead ::
  TypeToSym Head "head"

head
  :: forall children
   . Array (Attribute Head)
  -> { | children }
  -> Element Head children
head = makeElt Head "head"

head'attr
  :: Array (Attribute Head)
  -> Array (Attribute Head)
head'attr = identity

data THead = THead

instance typeToSymTHead :: TypeToSym THead "THead"

instance semigroupTHead :: Semigroup THead where
  append _ _ = THead

instance monoidTHead :: Monoid THead where
  mempty = THead

instance reifyTHead :: ReifyAU Head THead where
  reifyAU = const mempty
type Header' =
  ( tag :: String
  , attributes :: Array (Attribute Header)
  )
newtype Header = Header { | Header' }
unsafeUnHeader :: Header -> { | Header' }
unsafeUnHeader (Header unsafe) = unsafe

instance typeToSymHeader ::
  TypeToSym Header "header"

header
  :: forall children
   . Array (Attribute Header)
  -> { | children }
  -> Element Header children
header = makeElt Header "header"

header'attr
  :: Array (Attribute Header)
  -> Array (Attribute Header)
header'attr = identity

data THeader = THeader

instance typeToSymTHeader :: TypeToSym THeader "THeader"

instance semigroupTHeader :: Semigroup THeader where
  append _ _ = THeader

instance monoidTHeader :: Monoid THeader where
  mempty = THeader

instance reifyTHeader :: ReifyAU Header THeader where
  reifyAU = const mempty
type Hr' =
  ( tag :: String
  , attributes :: Array (Attribute Hr)
  )
newtype Hr = Hr { | Hr' }
unsafeUnHr :: Hr -> { | Hr' }
unsafeUnHr (Hr unsafe) = unsafe

instance typeToSymHr ::
  TypeToSym Hr "hr"

hr
  :: forall children
   . Array (Attribute Hr)
  -> { | children }
  -> Element Hr children
hr = makeElt Hr "hr"

hr'attr
  :: Array (Attribute Hr)
  -> Array (Attribute Hr)
hr'attr = identity

data THr = THr

instance typeToSymTHr :: TypeToSym THr "THr"

instance semigroupTHr :: Semigroup THr where
  append _ _ = THr

instance monoidTHr :: Monoid THr where
  mempty = THr

instance reifyTHr :: ReifyAU Hr THr where
  reifyAU = const mempty
type Html' =
  ( tag :: String
  , attributes :: Array (Attribute Html)
  )
newtype Html = Html { | Html' }
unsafeUnHtml :: Html -> { | Html' }
unsafeUnHtml (Html unsafe) = unsafe

instance typeToSymHtml ::
  TypeToSym Html "html"

html
  :: forall children
   . Array (Attribute Html)
  -> { | children }
  -> Element Html children
html = makeElt Html "html"

html'attr
  :: Array (Attribute Html)
  -> Array (Attribute Html)
html'attr = identity

data THtml = THtml

instance typeToSymTHtml :: TypeToSym THtml "THtml"

instance semigroupTHtml :: Semigroup THtml where
  append _ _ = THtml

instance monoidTHtml :: Monoid THtml where
  mempty = THtml

instance reifyTHtml :: ReifyAU Html THtml where
  reifyAU = const mempty
type I' =
  ( tag :: String
  , attributes :: Array (Attribute I)
  )
newtype I = I { | I' }
unsafeUnI :: I -> { | I' }
unsafeUnI (I unsafe) = unsafe

instance typeToSymI ::
  TypeToSym I "i"

i
  :: forall children
   . Array (Attribute I)
  -> { | children }
  -> Element I children
i = makeElt I "i"

i'attr
  :: Array (Attribute I)
  -> Array (Attribute I)
i'attr = identity

data TI = TI

instance typeToSymTI :: TypeToSym TI "TI"

instance semigroupTI :: Semigroup TI where
  append _ _ = TI

instance monoidTI :: Monoid TI where
  mempty = TI

instance reifyTI :: ReifyAU I TI where
  reifyAU = const mempty
type Iframe' =
  ( tag :: String
  , attributes :: Array (Attribute Iframe)
  )
newtype Iframe = Iframe { | Iframe' }
unsafeUnIframe :: Iframe -> { | Iframe' }
unsafeUnIframe (Iframe unsafe) = unsafe

instance typeToSymIframe ::
  TypeToSym Iframe "iframe"

iframe
  :: forall children
   . Array (Attribute Iframe)
  -> { | children }
  -> Element Iframe children
iframe = makeElt Iframe "iframe"

iframe'attr
  :: Array (Attribute Iframe)
  -> Array (Attribute Iframe)
iframe'attr = identity

data TIframe = TIframe

instance typeToSymTIframe :: TypeToSym TIframe "TIframe"

instance semigroupTIframe :: Semigroup TIframe where
  append _ _ = TIframe

instance monoidTIframe :: Monoid TIframe where
  mempty = TIframe

instance reifyTIframe :: ReifyAU Iframe TIframe where
  reifyAU = const mempty
type Img' =
  ( tag :: String
  , attributes :: Array (Attribute Img)
  )
newtype Img = Img { | Img' }
unsafeUnImg :: Img -> { | Img' }
unsafeUnImg (Img unsafe) = unsafe

instance typeToSymImg ::
  TypeToSym Img "img"

img
  :: forall children
   . Array (Attribute Img)
  -> { | children }
  -> Element Img children
img = makeElt Img "img"

img'attr
  :: Array (Attribute Img)
  -> Array (Attribute Img)
img'attr = identity

data TImg = TImg

instance typeToSymTImg :: TypeToSym TImg "TImg"

instance semigroupTImg :: Semigroup TImg where
  append _ _ = TImg

instance monoidTImg :: Monoid TImg where
  mempty = TImg

instance reifyTImg :: ReifyAU Img TImg where
  reifyAU = const mempty
type Input' =
  ( tag :: String
  , attributes :: Array (Attribute Input)
  )
newtype Input = Input { | Input' }
unsafeUnInput :: Input -> { | Input' }
unsafeUnInput (Input unsafe) = unsafe

instance typeToSymInput ::
  TypeToSym Input "input"

input
  :: forall children
   . Array (Attribute Input)
  -> { | children }
  -> Element Input children
input = makeElt Input "input"

input'attr
  :: Array (Attribute Input)
  -> Array (Attribute Input)
input'attr = identity

data TInput = TInput

instance typeToSymTInput :: TypeToSym TInput "TInput"

instance semigroupTInput :: Semigroup TInput where
  append _ _ = TInput

instance monoidTInput :: Monoid TInput where
  mempty = TInput

instance reifyTInput :: ReifyAU Input TInput where
  reifyAU = const mempty
type Ins' =
  ( tag :: String
  , attributes :: Array (Attribute Ins)
  )
newtype Ins = Ins { | Ins' }
unsafeUnIns :: Ins -> { | Ins' }
unsafeUnIns (Ins unsafe) = unsafe

instance typeToSymIns ::
  TypeToSym Ins "ins"

ins
  :: forall children
   . Array (Attribute Ins)
  -> { | children }
  -> Element Ins children
ins = makeElt Ins "ins"

ins'attr
  :: Array (Attribute Ins)
  -> Array (Attribute Ins)
ins'attr = identity

data TIns = TIns

instance typeToSymTIns :: TypeToSym TIns "TIns"

instance semigroupTIns :: Semigroup TIns where
  append _ _ = TIns

instance monoidTIns :: Monoid TIns where
  mempty = TIns

instance reifyTIns :: ReifyAU Ins TIns where
  reifyAU = const mempty
type Kbd' =
  ( tag :: String
  , attributes :: Array (Attribute Kbd)
  )
newtype Kbd = Kbd { | Kbd' }
unsafeUnKbd :: Kbd -> { | Kbd' }
unsafeUnKbd (Kbd unsafe) = unsafe

instance typeToSymKbd ::
  TypeToSym Kbd "kbd"

kbd
  :: forall children
   . Array (Attribute Kbd)
  -> { | children }
  -> Element Kbd children
kbd = makeElt Kbd "kbd"

kbd'attr
  :: Array (Attribute Kbd)
  -> Array (Attribute Kbd)
kbd'attr = identity

data TKbd = TKbd

instance typeToSymTKbd :: TypeToSym TKbd "TKbd"

instance semigroupTKbd :: Semigroup TKbd where
  append _ _ = TKbd

instance monoidTKbd :: Monoid TKbd where
  mempty = TKbd

instance reifyTKbd :: ReifyAU Kbd TKbd where
  reifyAU = const mempty
type Label' =
  ( tag :: String
  , attributes :: Array (Attribute Label)
  )
newtype Label = Label { | Label' }
unsafeUnLabel :: Label -> { | Label' }
unsafeUnLabel (Label unsafe) = unsafe

instance typeToSymLabel ::
  TypeToSym Label "label"

label
  :: forall children
   . Array (Attribute Label)
  -> { | children }
  -> Element Label children
label = makeElt Label "label"

label'attr
  :: Array (Attribute Label)
  -> Array (Attribute Label)
label'attr = identity

data TLabel = TLabel

instance typeToSymTLabel :: TypeToSym TLabel "TLabel"

instance semigroupTLabel :: Semigroup TLabel where
  append _ _ = TLabel

instance monoidTLabel :: Monoid TLabel where
  mempty = TLabel

instance reifyTLabel :: ReifyAU Label TLabel where
  reifyAU = const mempty
type Legend' =
  ( tag :: String
  , attributes :: Array (Attribute Legend)
  )
newtype Legend = Legend { | Legend' }
unsafeUnLegend :: Legend -> { | Legend' }
unsafeUnLegend (Legend unsafe) = unsafe

instance typeToSymLegend ::
  TypeToSym Legend "legend"

legend
  :: forall children
   . Array (Attribute Legend)
  -> { | children }
  -> Element Legend children
legend = makeElt Legend "legend"

legend'attr
  :: Array (Attribute Legend)
  -> Array (Attribute Legend)
legend'attr = identity

data TLegend = TLegend

instance typeToSymTLegend :: TypeToSym TLegend "TLegend"

instance semigroupTLegend :: Semigroup TLegend where
  append _ _ = TLegend

instance monoidTLegend :: Monoid TLegend where
  mempty = TLegend

instance reifyTLegend :: ReifyAU Legend TLegend where
  reifyAU = const mempty
type Li' =
  ( tag :: String
  , attributes :: Array (Attribute Li)
  )
newtype Li = Li { | Li' }
unsafeUnLi :: Li -> { | Li' }
unsafeUnLi (Li unsafe) = unsafe

instance typeToSymLi ::
  TypeToSym Li "li"

li
  :: forall children
   . Array (Attribute Li)
  -> { | children }
  -> Element Li children
li = makeElt Li "li"

li'attr
  :: Array (Attribute Li)
  -> Array (Attribute Li)
li'attr = identity

data TLi = TLi

instance typeToSymTLi :: TypeToSym TLi "TLi"

instance semigroupTLi :: Semigroup TLi where
  append _ _ = TLi

instance monoidTLi :: Monoid TLi where
  mempty = TLi

instance reifyTLi :: ReifyAU Li TLi where
  reifyAU = const mempty
type Link' =
  ( tag :: String
  , attributes :: Array (Attribute Link)
  )
newtype Link = Link { | Link' }
unsafeUnLink :: Link -> { | Link' }
unsafeUnLink (Link unsafe) = unsafe

instance typeToSymLink ::
  TypeToSym Link "link"

link
  :: forall children
   . Array (Attribute Link)
  -> { | children }
  -> Element Link children
link = makeElt Link "link"

link'attr
  :: Array (Attribute Link)
  -> Array (Attribute Link)
link'attr = identity

data TLink = TLink

instance typeToSymTLink :: TypeToSym TLink "TLink"

instance semigroupTLink :: Semigroup TLink where
  append _ _ = TLink

instance monoidTLink :: Monoid TLink where
  mempty = TLink

instance reifyTLink :: ReifyAU Link TLink where
  reifyAU = const mempty
type Main' =
  ( tag :: String
  , attributes :: Array (Attribute Main)
  )
newtype Main = Main { | Main' }
unsafeUnMain :: Main -> { | Main' }
unsafeUnMain (Main unsafe) = unsafe

instance typeToSymMain ::
  TypeToSym Main "main"

main
  :: forall children
   . Array (Attribute Main)
  -> { | children }
  -> Element Main children
main = makeElt Main "main"

main'attr
  :: Array (Attribute Main)
  -> Array (Attribute Main)
main'attr = identity

data TMain = TMain

instance typeToSymTMain :: TypeToSym TMain "TMain"

instance semigroupTMain :: Semigroup TMain where
  append _ _ = TMain

instance monoidTMain :: Monoid TMain where
  mempty = TMain

instance reifyTMain :: ReifyAU Main TMain where
  reifyAU = const mempty
type Map' =
  ( tag :: String
  , attributes :: Array (Attribute Map)
  )
newtype Map = Map { | Map' }
unsafeUnMap :: Map -> { | Map' }
unsafeUnMap (Map unsafe) = unsafe

instance typeToSymMap ::
  TypeToSym Map "map"

map
  :: forall children
   . Array (Attribute Map)
  -> { | children }
  -> Element Map children
map = makeElt Map "map"

map'attr
  :: Array (Attribute Map)
  -> Array (Attribute Map)
map'attr = identity

data TMap = TMap

instance typeToSymTMap :: TypeToSym TMap "TMap"

instance semigroupTMap :: Semigroup TMap where
  append _ _ = TMap

instance monoidTMap :: Monoid TMap where
  mempty = TMap

instance reifyTMap :: ReifyAU Map TMap where
  reifyAU = const mempty
type Mark' =
  ( tag :: String
  , attributes :: Array (Attribute Mark)
  )
newtype Mark = Mark { | Mark' }
unsafeUnMark :: Mark -> { | Mark' }
unsafeUnMark (Mark unsafe) = unsafe

instance typeToSymMark ::
  TypeToSym Mark "mark"

mark
  :: forall children
   . Array (Attribute Mark)
  -> { | children }
  -> Element Mark children
mark = makeElt Mark "mark"

mark'attr
  :: Array (Attribute Mark)
  -> Array (Attribute Mark)
mark'attr = identity

data TMark = TMark

instance typeToSymTMark :: TypeToSym TMark "TMark"

instance semigroupTMark :: Semigroup TMark where
  append _ _ = TMark

instance monoidTMark :: Monoid TMark where
  mempty = TMark

instance reifyTMark :: ReifyAU Mark TMark where
  reifyAU = const mempty
type Meta' =
  ( tag :: String
  , attributes :: Array (Attribute Meta)
  )
newtype Meta = Meta { | Meta' }
unsafeUnMeta :: Meta -> { | Meta' }
unsafeUnMeta (Meta unsafe) = unsafe

instance typeToSymMeta ::
  TypeToSym Meta "meta"

meta
  :: forall children
   . Array (Attribute Meta)
  -> { | children }
  -> Element Meta children
meta = makeElt Meta "meta"

meta'attr
  :: Array (Attribute Meta)
  -> Array (Attribute Meta)
meta'attr = identity

data TMeta = TMeta

instance typeToSymTMeta :: TypeToSym TMeta "TMeta"

instance semigroupTMeta :: Semigroup TMeta where
  append _ _ = TMeta

instance monoidTMeta :: Monoid TMeta where
  mempty = TMeta

instance reifyTMeta :: ReifyAU Meta TMeta where
  reifyAU = const mempty
type Meter' =
  ( tag :: String
  , attributes :: Array (Attribute Meter)
  )
newtype Meter = Meter { | Meter' }
unsafeUnMeter :: Meter -> { | Meter' }
unsafeUnMeter (Meter unsafe) = unsafe

instance typeToSymMeter ::
  TypeToSym Meter "meter"

meter
  :: forall children
   . Array (Attribute Meter)
  -> { | children }
  -> Element Meter children
meter = makeElt Meter "meter"

meter'attr
  :: Array (Attribute Meter)
  -> Array (Attribute Meter)
meter'attr = identity

data TMeter = TMeter

instance typeToSymTMeter :: TypeToSym TMeter "TMeter"

instance semigroupTMeter :: Semigroup TMeter where
  append _ _ = TMeter

instance monoidTMeter :: Monoid TMeter where
  mempty = TMeter

instance reifyTMeter :: ReifyAU Meter TMeter where
  reifyAU = const mempty
type Nav' =
  ( tag :: String
  , attributes :: Array (Attribute Nav)
  )
newtype Nav = Nav { | Nav' }
unsafeUnNav :: Nav -> { | Nav' }
unsafeUnNav (Nav unsafe) = unsafe

instance typeToSymNav ::
  TypeToSym Nav "nav"

nav
  :: forall children
   . Array (Attribute Nav)
  -> { | children }
  -> Element Nav children
nav = makeElt Nav "nav"

nav'attr
  :: Array (Attribute Nav)
  -> Array (Attribute Nav)
nav'attr = identity

data TNav = TNav

instance typeToSymTNav :: TypeToSym TNav "TNav"

instance semigroupTNav :: Semigroup TNav where
  append _ _ = TNav

instance monoidTNav :: Monoid TNav where
  mempty = TNav

instance reifyTNav :: ReifyAU Nav TNav where
  reifyAU = const mempty
type Noframes' =
  ( tag :: String
  , attributes :: Array (Attribute Noframes)
  )
newtype Noframes = Noframes { | Noframes' }
unsafeUnNoframes :: Noframes -> { | Noframes' }
unsafeUnNoframes (Noframes unsafe) = unsafe

instance typeToSymNoframes ::
  TypeToSym Noframes "noframes"

noframes
  :: forall children
   . Array (Attribute Noframes)
  -> { | children }
  -> Element Noframes children
noframes = makeElt Noframes "noframes"

noframes'attr
  :: Array (Attribute Noframes)
  -> Array (Attribute Noframes)
noframes'attr = identity

data TNoframes = TNoframes

instance typeToSymTNoframes :: TypeToSym TNoframes "TNoframes"

instance semigroupTNoframes :: Semigroup TNoframes where
  append _ _ = TNoframes

instance monoidTNoframes :: Monoid TNoframes where
  mempty = TNoframes

instance reifyTNoframes :: ReifyAU Noframes TNoframes where
  reifyAU = const mempty
type Noscript' =
  ( tag :: String
  , attributes :: Array (Attribute Noscript)
  )
newtype Noscript = Noscript { | Noscript' }
unsafeUnNoscript :: Noscript -> { | Noscript' }
unsafeUnNoscript (Noscript unsafe) = unsafe

instance typeToSymNoscript ::
  TypeToSym Noscript "noscript"

noscript
  :: forall children
   . Array (Attribute Noscript)
  -> { | children }
  -> Element Noscript children
noscript = makeElt Noscript "noscript"

noscript'attr
  :: Array (Attribute Noscript)
  -> Array (Attribute Noscript)
noscript'attr = identity

data TNoscript = TNoscript

instance typeToSymTNoscript :: TypeToSym TNoscript "TNoscript"

instance semigroupTNoscript :: Semigroup TNoscript where
  append _ _ = TNoscript

instance monoidTNoscript :: Monoid TNoscript where
  mempty = TNoscript

instance reifyTNoscript :: ReifyAU Noscript TNoscript where
  reifyAU = const mempty
type Object' =
  ( tag :: String
  , attributes :: Array (Attribute Object)
  )
newtype Object = Object { | Object' }
unsafeUnObject :: Object -> { | Object' }
unsafeUnObject (Object unsafe) = unsafe

instance typeToSymObject ::
  TypeToSym Object "object"

object
  :: forall children
   . Array (Attribute Object)
  -> { | children }
  -> Element Object children
object = makeElt Object "object"

object'attr
  :: Array (Attribute Object)
  -> Array (Attribute Object)
object'attr = identity

data TObject = TObject

instance typeToSymTObject :: TypeToSym TObject "TObject"

instance semigroupTObject :: Semigroup TObject where
  append _ _ = TObject

instance monoidTObject :: Monoid TObject where
  mempty = TObject

instance reifyTObject :: ReifyAU Object TObject where
  reifyAU = const mempty
type Ol' =
  ( tag :: String
  , attributes :: Array (Attribute Ol)
  )
newtype Ol = Ol { | Ol' }
unsafeUnOl :: Ol -> { | Ol' }
unsafeUnOl (Ol unsafe) = unsafe

instance typeToSymOl ::
  TypeToSym Ol "ol"

ol
  :: forall children
   . Array (Attribute Ol)
  -> { | children }
  -> Element Ol children
ol = makeElt Ol "ol"

ol'attr
  :: Array (Attribute Ol)
  -> Array (Attribute Ol)
ol'attr = identity

data TOl = TOl

instance typeToSymTOl :: TypeToSym TOl "TOl"

instance semigroupTOl :: Semigroup TOl where
  append _ _ = TOl

instance monoidTOl :: Monoid TOl where
  mempty = TOl

instance reifyTOl :: ReifyAU Ol TOl where
  reifyAU = const mempty
type Optgroup' =
  ( tag :: String
  , attributes :: Array (Attribute Optgroup)
  )
newtype Optgroup = Optgroup { | Optgroup' }
unsafeUnOptgroup :: Optgroup -> { | Optgroup' }
unsafeUnOptgroup (Optgroup unsafe) = unsafe

instance typeToSymOptgroup ::
  TypeToSym Optgroup "optgroup"

optgroup
  :: forall children
   . Array (Attribute Optgroup)
  -> { | children }
  -> Element Optgroup children
optgroup = makeElt Optgroup "optgroup"

optgroup'attr
  :: Array (Attribute Optgroup)
  -> Array (Attribute Optgroup)
optgroup'attr = identity

data TOptgroup = TOptgroup

instance typeToSymTOptgroup :: TypeToSym TOptgroup "TOptgroup"

instance semigroupTOptgroup :: Semigroup TOptgroup where
  append _ _ = TOptgroup

instance monoidTOptgroup :: Monoid TOptgroup where
  mempty = TOptgroup

instance reifyTOptgroup :: ReifyAU Optgroup TOptgroup where
  reifyAU = const mempty
type Option' =
  ( tag :: String
  , attributes :: Array (Attribute Option)
  )
newtype Option = Option { | Option' }
unsafeUnOption :: Option -> { | Option' }
unsafeUnOption (Option unsafe) = unsafe

instance typeToSymOption ::
  TypeToSym Option "option"

option
  :: forall children
   . Array (Attribute Option)
  -> { | children }
  -> Element Option children
option = makeElt Option "option"

option'attr
  :: Array (Attribute Option)
  -> Array (Attribute Option)
option'attr = identity

data TOption = TOption

instance typeToSymTOption :: TypeToSym TOption "TOption"

instance semigroupTOption :: Semigroup TOption where
  append _ _ = TOption

instance monoidTOption :: Monoid TOption where
  mempty = TOption

instance reifyTOption :: ReifyAU Option TOption where
  reifyAU = const mempty
type Output' =
  ( tag :: String
  , attributes :: Array (Attribute Output)
  )
newtype Output = Output { | Output' }
unsafeUnOutput :: Output -> { | Output' }
unsafeUnOutput (Output unsafe) = unsafe

instance typeToSymOutput ::
  TypeToSym Output "output"

output
  :: forall children
   . Array (Attribute Output)
  -> { | children }
  -> Element Output children
output = makeElt Output "output"

output'attr
  :: Array (Attribute Output)
  -> Array (Attribute Output)
output'attr = identity

data TOutput = TOutput

instance typeToSymTOutput :: TypeToSym TOutput "TOutput"

instance semigroupTOutput :: Semigroup TOutput where
  append _ _ = TOutput

instance monoidTOutput :: Monoid TOutput where
  mempty = TOutput

instance reifyTOutput :: ReifyAU Output TOutput where
  reifyAU = const mempty
type P' =
  ( tag :: String
  , attributes :: Array (Attribute P)
  )
newtype P = P { | P' }
unsafeUnP :: P -> { | P' }
unsafeUnP (P unsafe) = unsafe

instance typeToSymP ::
  TypeToSym P "p"

p
  :: forall children
   . Array (Attribute P)
  -> { | children }
  -> Element P children
p = makeElt P "p"

p'attr
  :: Array (Attribute P)
  -> Array (Attribute P)
p'attr = identity

data TP = TP

instance typeToSymTP :: TypeToSym TP "TP"

instance semigroupTP :: Semigroup TP where
  append _ _ = TP

instance monoidTP :: Monoid TP where
  mempty = TP

instance reifyTP :: ReifyAU P TP where
  reifyAU = const mempty
type Param' =
  ( tag :: String
  , attributes :: Array (Attribute Param)
  )
newtype Param = Param { | Param' }
unsafeUnParam :: Param -> { | Param' }
unsafeUnParam (Param unsafe) = unsafe

instance typeToSymParam ::
  TypeToSym Param "param"

param
  :: forall children
   . Array (Attribute Param)
  -> { | children }
  -> Element Param children
param = makeElt Param "param"

param'attr
  :: Array (Attribute Param)
  -> Array (Attribute Param)
param'attr = identity

data TParam = TParam

instance typeToSymTParam :: TypeToSym TParam "TParam"

instance semigroupTParam :: Semigroup TParam where
  append _ _ = TParam

instance monoidTParam :: Monoid TParam where
  mempty = TParam

instance reifyTParam :: ReifyAU Param TParam where
  reifyAU = const mempty
type Picture' =
  ( tag :: String
  , attributes :: Array (Attribute Picture)
  )
newtype Picture = Picture { | Picture' }
unsafeUnPicture :: Picture -> { | Picture' }
unsafeUnPicture (Picture unsafe) = unsafe

instance typeToSymPicture ::
  TypeToSym Picture "picture"

picture
  :: forall children
   . Array (Attribute Picture)
  -> { | children }
  -> Element Picture children
picture = makeElt Picture "picture"

picture'attr
  :: Array (Attribute Picture)
  -> Array (Attribute Picture)
picture'attr = identity

data TPicture = TPicture

instance typeToSymTPicture :: TypeToSym TPicture "TPicture"

instance semigroupTPicture :: Semigroup TPicture where
  append _ _ = TPicture

instance monoidTPicture :: Monoid TPicture where
  mempty = TPicture

instance reifyTPicture :: ReifyAU Picture TPicture where
  reifyAU = const mempty
type Pre' =
  ( tag :: String
  , attributes :: Array (Attribute Pre)
  )
newtype Pre = Pre { | Pre' }
unsafeUnPre :: Pre -> { | Pre' }
unsafeUnPre (Pre unsafe) = unsafe

instance typeToSymPre ::
  TypeToSym Pre "pre"

pre
  :: forall children
   . Array (Attribute Pre)
  -> { | children }
  -> Element Pre children
pre = makeElt Pre "pre"

pre'attr
  :: Array (Attribute Pre)
  -> Array (Attribute Pre)
pre'attr = identity

data TPre = TPre

instance typeToSymTPre :: TypeToSym TPre "TPre"

instance semigroupTPre :: Semigroup TPre where
  append _ _ = TPre

instance monoidTPre :: Monoid TPre where
  mempty = TPre

instance reifyTPre :: ReifyAU Pre TPre where
  reifyAU = const mempty
type Progress' =
  ( tag :: String
  , attributes :: Array (Attribute Progress)
  )
newtype Progress = Progress { | Progress' }
unsafeUnProgress :: Progress -> { | Progress' }
unsafeUnProgress (Progress unsafe) = unsafe

instance typeToSymProgress ::
  TypeToSym Progress "progress"

progress
  :: forall children
   . Array (Attribute Progress)
  -> { | children }
  -> Element Progress children
progress = makeElt Progress "progress"

progress'attr
  :: Array (Attribute Progress)
  -> Array (Attribute Progress)
progress'attr = identity

data TProgress = TProgress

instance typeToSymTProgress :: TypeToSym TProgress "TProgress"

instance semigroupTProgress :: Semigroup TProgress where
  append _ _ = TProgress

instance monoidTProgress :: Monoid TProgress where
  mempty = TProgress

instance reifyTProgress :: ReifyAU Progress TProgress where
  reifyAU = const mempty
type Q' =
  ( tag :: String
  , attributes :: Array (Attribute Q)
  )
newtype Q = Q { | Q' }
unsafeUnQ :: Q -> { | Q' }
unsafeUnQ (Q unsafe) = unsafe

instance typeToSymQ ::
  TypeToSym Q "q"

q
  :: forall children
   . Array (Attribute Q)
  -> { | children }
  -> Element Q children
q = makeElt Q "q"

q'attr
  :: Array (Attribute Q)
  -> Array (Attribute Q)
q'attr = identity

data TQ = TQ

instance typeToSymTQ :: TypeToSym TQ "TQ"

instance semigroupTQ :: Semigroup TQ where
  append _ _ = TQ

instance monoidTQ :: Monoid TQ where
  mempty = TQ

instance reifyTQ :: ReifyAU Q TQ where
  reifyAU = const mempty
type Rp' =
  ( tag :: String
  , attributes :: Array (Attribute Rp)
  )
newtype Rp = Rp { | Rp' }
unsafeUnRp :: Rp -> { | Rp' }
unsafeUnRp (Rp unsafe) = unsafe

instance typeToSymRp ::
  TypeToSym Rp "rp"

rp
  :: forall children
   . Array (Attribute Rp)
  -> { | children }
  -> Element Rp children
rp = makeElt Rp "rp"

rp'attr
  :: Array (Attribute Rp)
  -> Array (Attribute Rp)
rp'attr = identity

data TRp = TRp

instance typeToSymTRp :: TypeToSym TRp "TRp"

instance semigroupTRp :: Semigroup TRp where
  append _ _ = TRp

instance monoidTRp :: Monoid TRp where
  mempty = TRp

instance reifyTRp :: ReifyAU Rp TRp where
  reifyAU = const mempty
type Rt' =
  ( tag :: String
  , attributes :: Array (Attribute Rt)
  )
newtype Rt = Rt { | Rt' }
unsafeUnRt :: Rt -> { | Rt' }
unsafeUnRt (Rt unsafe) = unsafe

instance typeToSymRt ::
  TypeToSym Rt "rt"

rt
  :: forall children
   . Array (Attribute Rt)
  -> { | children }
  -> Element Rt children
rt = makeElt Rt "rt"

rt'attr
  :: Array (Attribute Rt)
  -> Array (Attribute Rt)
rt'attr = identity

data TRt = TRt

instance typeToSymTRt :: TypeToSym TRt "TRt"

instance semigroupTRt :: Semigroup TRt where
  append _ _ = TRt

instance monoidTRt :: Monoid TRt where
  mempty = TRt

instance reifyTRt :: ReifyAU Rt TRt where
  reifyAU = const mempty
type Ruby' =
  ( tag :: String
  , attributes :: Array (Attribute Ruby)
  )
newtype Ruby = Ruby { | Ruby' }
unsafeUnRuby :: Ruby -> { | Ruby' }
unsafeUnRuby (Ruby unsafe) = unsafe

instance typeToSymRuby ::
  TypeToSym Ruby "ruby"

ruby
  :: forall children
   . Array (Attribute Ruby)
  -> { | children }
  -> Element Ruby children
ruby = makeElt Ruby "ruby"

ruby'attr
  :: Array (Attribute Ruby)
  -> Array (Attribute Ruby)
ruby'attr = identity

data TRuby = TRuby

instance typeToSymTRuby :: TypeToSym TRuby "TRuby"

instance semigroupTRuby :: Semigroup TRuby where
  append _ _ = TRuby

instance monoidTRuby :: Monoid TRuby where
  mempty = TRuby

instance reifyTRuby :: ReifyAU Ruby TRuby where
  reifyAU = const mempty
type S' =
  ( tag :: String
  , attributes :: Array (Attribute S)
  )
newtype S = S { | S' }
unsafeUnS :: S -> { | S' }
unsafeUnS (S unsafe) = unsafe

instance typeToSymS ::
  TypeToSym S "s"

s
  :: forall children
   . Array (Attribute S)
  -> { | children }
  -> Element S children
s = makeElt S "s"

s'attr
  :: Array (Attribute S)
  -> Array (Attribute S)
s'attr = identity

data TS = TS

instance typeToSymTS :: TypeToSym TS "TS"

instance semigroupTS :: Semigroup TS where
  append _ _ = TS

instance monoidTS :: Monoid TS where
  mempty = TS

instance reifyTS :: ReifyAU S TS where
  reifyAU = const mempty
type Samp' =
  ( tag :: String
  , attributes :: Array (Attribute Samp)
  )
newtype Samp = Samp { | Samp' }
unsafeUnSamp :: Samp -> { | Samp' }
unsafeUnSamp (Samp unsafe) = unsafe

instance typeToSymSamp ::
  TypeToSym Samp "samp"

samp
  :: forall children
   . Array (Attribute Samp)
  -> { | children }
  -> Element Samp children
samp = makeElt Samp "samp"

samp'attr
  :: Array (Attribute Samp)
  -> Array (Attribute Samp)
samp'attr = identity

data TSamp = TSamp

instance typeToSymTSamp :: TypeToSym TSamp "TSamp"

instance semigroupTSamp :: Semigroup TSamp where
  append _ _ = TSamp

instance monoidTSamp :: Monoid TSamp where
  mempty = TSamp

instance reifyTSamp :: ReifyAU Samp TSamp where
  reifyAU = const mempty
type Script' =
  ( tag :: String
  , attributes :: Array (Attribute Script)
  )
newtype Script = Script { | Script' }
unsafeUnScript :: Script -> { | Script' }
unsafeUnScript (Script unsafe) = unsafe

instance typeToSymScript ::
  TypeToSym Script "script"

script
  :: forall children
   . Array (Attribute Script)
  -> { | children }
  -> Element Script children
script = makeElt Script "script"

script'attr
  :: Array (Attribute Script)
  -> Array (Attribute Script)
script'attr = identity

data TScript = TScript

instance typeToSymTScript :: TypeToSym TScript "TScript"

instance semigroupTScript :: Semigroup TScript where
  append _ _ = TScript

instance monoidTScript :: Monoid TScript where
  mempty = TScript

instance reifyTScript :: ReifyAU Script TScript where
  reifyAU = const mempty
type Section' =
  ( tag :: String
  , attributes :: Array (Attribute Section)
  )
newtype Section = Section { | Section' }
unsafeUnSection :: Section -> { | Section' }
unsafeUnSection (Section unsafe) = unsafe

instance typeToSymSection ::
  TypeToSym Section "section"

section
  :: forall children
   . Array (Attribute Section)
  -> { | children }
  -> Element Section children
section = makeElt Section "section"

section'attr
  :: Array (Attribute Section)
  -> Array (Attribute Section)
section'attr = identity

data TSection = TSection

instance typeToSymTSection :: TypeToSym TSection "TSection"

instance semigroupTSection :: Semigroup TSection where
  append _ _ = TSection

instance monoidTSection :: Monoid TSection where
  mempty = TSection

instance reifyTSection :: ReifyAU Section TSection where
  reifyAU = const mempty
type Select' =
  ( tag :: String
  , attributes :: Array (Attribute Select)
  )
newtype Select = Select { | Select' }
unsafeUnSelect :: Select -> { | Select' }
unsafeUnSelect (Select unsafe) = unsafe

instance typeToSymSelect ::
  TypeToSym Select "select"

select
  :: forall children
   . Array (Attribute Select)
  -> { | children }
  -> Element Select children
select = makeElt Select "select"

select'attr
  :: Array (Attribute Select)
  -> Array (Attribute Select)
select'attr = identity

data TSelect = TSelect

instance typeToSymTSelect :: TypeToSym TSelect "TSelect"

instance semigroupTSelect :: Semigroup TSelect where
  append _ _ = TSelect

instance monoidTSelect :: Monoid TSelect where
  mempty = TSelect

instance reifyTSelect :: ReifyAU Select TSelect where
  reifyAU = const mempty
type Small' =
  ( tag :: String
  , attributes :: Array (Attribute Small)
  )
newtype Small = Small { | Small' }
unsafeUnSmall :: Small -> { | Small' }
unsafeUnSmall (Small unsafe) = unsafe

instance typeToSymSmall ::
  TypeToSym Small "small"

small
  :: forall children
   . Array (Attribute Small)
  -> { | children }
  -> Element Small children
small = makeElt Small "small"

small'attr
  :: Array (Attribute Small)
  -> Array (Attribute Small)
small'attr = identity

data TSmall = TSmall

instance typeToSymTSmall :: TypeToSym TSmall "TSmall"

instance semigroupTSmall :: Semigroup TSmall where
  append _ _ = TSmall

instance monoidTSmall :: Monoid TSmall where
  mempty = TSmall

instance reifyTSmall :: ReifyAU Small TSmall where
  reifyAU = const mempty
type Source' =
  ( tag :: String
  , attributes :: Array (Attribute Source)
  )
newtype Source = Source { | Source' }
unsafeUnSource :: Source -> { | Source' }
unsafeUnSource (Source unsafe) = unsafe

instance typeToSymSource ::
  TypeToSym Source "source"

source
  :: forall children
   . Array (Attribute Source)
  -> { | children }
  -> Element Source children
source = makeElt Source "source"

source'attr
  :: Array (Attribute Source)
  -> Array (Attribute Source)
source'attr = identity

data TSource = TSource

instance typeToSymTSource :: TypeToSym TSource "TSource"

instance semigroupTSource :: Semigroup TSource where
  append _ _ = TSource

instance monoidTSource :: Monoid TSource where
  mempty = TSource

instance reifyTSource :: ReifyAU Source TSource where
  reifyAU = const mempty
type Span' =
  ( tag :: String
  , attributes :: Array (Attribute Span)
  )
newtype Span = Span { | Span' }
unsafeUnSpan :: Span -> { | Span' }
unsafeUnSpan (Span unsafe) = unsafe

instance typeToSymSpan ::
  TypeToSym Span "span"

span
  :: forall children
   . Array (Attribute Span)
  -> { | children }
  -> Element Span children
span = makeElt Span "span"

span'attr
  :: Array (Attribute Span)
  -> Array (Attribute Span)
span'attr = identity

data TSpan = TSpan

instance typeToSymTSpan :: TypeToSym TSpan "TSpan"

instance semigroupTSpan :: Semigroup TSpan where
  append _ _ = TSpan

instance monoidTSpan :: Monoid TSpan where
  mempty = TSpan

instance reifyTSpan :: ReifyAU Span TSpan where
  reifyAU = const mempty
type Strike' =
  ( tag :: String
  , attributes :: Array (Attribute Strike)
  )
newtype Strike = Strike { | Strike' }
unsafeUnStrike :: Strike -> { | Strike' }
unsafeUnStrike (Strike unsafe) = unsafe

instance typeToSymStrike ::
  TypeToSym Strike "strike"

strike
  :: forall children
   . Array (Attribute Strike)
  -> { | children }
  -> Element Strike children
strike = makeElt Strike "strike"

strike'attr
  :: Array (Attribute Strike)
  -> Array (Attribute Strike)
strike'attr = identity

data TStrike = TStrike

instance typeToSymTStrike :: TypeToSym TStrike "TStrike"

instance semigroupTStrike :: Semigroup TStrike where
  append _ _ = TStrike

instance monoidTStrike :: Monoid TStrike where
  mempty = TStrike

instance reifyTStrike :: ReifyAU Strike TStrike where
  reifyAU = const mempty
type Strong' =
  ( tag :: String
  , attributes :: Array (Attribute Strong)
  )
newtype Strong = Strong { | Strong' }
unsafeUnStrong :: Strong -> { | Strong' }
unsafeUnStrong (Strong unsafe) = unsafe

instance typeToSymStrong ::
  TypeToSym Strong "strong"

strong
  :: forall children
   . Array (Attribute Strong)
  -> { | children }
  -> Element Strong children
strong = makeElt Strong "strong"

strong'attr
  :: Array (Attribute Strong)
  -> Array (Attribute Strong)
strong'attr = identity

data TStrong = TStrong

instance typeToSymTStrong :: TypeToSym TStrong "TStrong"

instance semigroupTStrong :: Semigroup TStrong where
  append _ _ = TStrong

instance monoidTStrong :: Monoid TStrong where
  mempty = TStrong

instance reifyTStrong :: ReifyAU Strong TStrong where
  reifyAU = const mempty
type Style' =
  ( tag :: String
  , attributes :: Array (Attribute Style)
  )
newtype Style = Style { | Style' }
unsafeUnStyle :: Style -> { | Style' }
unsafeUnStyle (Style unsafe) = unsafe

instance typeToSymStyle ::
  TypeToSym Style "style"

style
  :: forall children
   . Array (Attribute Style)
  -> { | children }
  -> Element Style children
style = makeElt Style "style"

style'attr
  :: Array (Attribute Style)
  -> Array (Attribute Style)
style'attr = identity

data TStyle = TStyle

instance typeToSymTStyle :: TypeToSym TStyle "TStyle"

instance semigroupTStyle :: Semigroup TStyle where
  append _ _ = TStyle

instance monoidTStyle :: Monoid TStyle where
  mempty = TStyle

instance reifyTStyle :: ReifyAU Style TStyle where
  reifyAU = const mempty
type Sub' =
  ( tag :: String
  , attributes :: Array (Attribute Sub)
  )
newtype Sub = Sub { | Sub' }
unsafeUnSub :: Sub -> { | Sub' }
unsafeUnSub (Sub unsafe) = unsafe

instance typeToSymSub ::
  TypeToSym Sub "sub"

sub
  :: forall children
   . Array (Attribute Sub)
  -> { | children }
  -> Element Sub children
sub = makeElt Sub "sub"

sub'attr
  :: Array (Attribute Sub)
  -> Array (Attribute Sub)
sub'attr = identity

data TSub = TSub

instance typeToSymTSub :: TypeToSym TSub "TSub"

instance semigroupTSub :: Semigroup TSub where
  append _ _ = TSub

instance monoidTSub :: Monoid TSub where
  mempty = TSub

instance reifyTSub :: ReifyAU Sub TSub where
  reifyAU = const mempty
type Summary' =
  ( tag :: String
  , attributes :: Array (Attribute Summary)
  )
newtype Summary = Summary { | Summary' }
unsafeUnSummary :: Summary -> { | Summary' }
unsafeUnSummary (Summary unsafe) = unsafe

instance typeToSymSummary ::
  TypeToSym Summary "summary"

summary
  :: forall children
   . Array (Attribute Summary)
  -> { | children }
  -> Element Summary children
summary = makeElt Summary "summary"

summary'attr
  :: Array (Attribute Summary)
  -> Array (Attribute Summary)
summary'attr = identity

data TSummary = TSummary

instance typeToSymTSummary :: TypeToSym TSummary "TSummary"

instance semigroupTSummary :: Semigroup TSummary where
  append _ _ = TSummary

instance monoidTSummary :: Monoid TSummary where
  mempty = TSummary

instance reifyTSummary :: ReifyAU Summary TSummary where
  reifyAU = const mempty
type Sup' =
  ( tag :: String
  , attributes :: Array (Attribute Sup)
  )
newtype Sup = Sup { | Sup' }
unsafeUnSup :: Sup -> { | Sup' }
unsafeUnSup (Sup unsafe) = unsafe

instance typeToSymSup ::
  TypeToSym Sup "sup"

sup
  :: forall children
   . Array (Attribute Sup)
  -> { | children }
  -> Element Sup children
sup = makeElt Sup "sup"

sup'attr
  :: Array (Attribute Sup)
  -> Array (Attribute Sup)
sup'attr = identity

data TSup = TSup

instance typeToSymTSup :: TypeToSym TSup "TSup"

instance semigroupTSup :: Semigroup TSup where
  append _ _ = TSup

instance monoidTSup :: Monoid TSup where
  mempty = TSup

instance reifyTSup :: ReifyAU Sup TSup where
  reifyAU = const mempty
type Svg' =
  ( tag :: String
  , attributes :: Array (Attribute Svg)
  )
newtype Svg = Svg { | Svg' }
unsafeUnSvg :: Svg -> { | Svg' }
unsafeUnSvg (Svg unsafe) = unsafe

instance typeToSymSvg ::
  TypeToSym Svg "svg"

svg
  :: forall children
   . Array (Attribute Svg)
  -> { | children }
  -> Element Svg children
svg = makeElt Svg "svg"

svg'attr
  :: Array (Attribute Svg)
  -> Array (Attribute Svg)
svg'attr = identity

data TSvg = TSvg

instance typeToSymTSvg :: TypeToSym TSvg "TSvg"

instance semigroupTSvg :: Semigroup TSvg where
  append _ _ = TSvg

instance monoidTSvg :: Monoid TSvg where
  mempty = TSvg

instance reifyTSvg :: ReifyAU Svg TSvg where
  reifyAU = const mempty
type Table' =
  ( tag :: String
  , attributes :: Array (Attribute Table)
  )
newtype Table = Table { | Table' }
unsafeUnTable :: Table -> { | Table' }
unsafeUnTable (Table unsafe) = unsafe

instance typeToSymTable ::
  TypeToSym Table "table"

table
  :: forall children
   . Array (Attribute Table)
  -> { | children }
  -> Element Table children
table = makeElt Table "table"

table'attr
  :: Array (Attribute Table)
  -> Array (Attribute Table)
table'attr = identity

data TTable = TTable

instance typeToSymTTable :: TypeToSym TTable "TTable"

instance semigroupTTable :: Semigroup TTable where
  append _ _ = TTable

instance monoidTTable :: Monoid TTable where
  mempty = TTable

instance reifyTTable :: ReifyAU Table TTable where
  reifyAU = const mempty
type Tbody' =
  ( tag :: String
  , attributes :: Array (Attribute Tbody)
  )
newtype Tbody = Tbody { | Tbody' }
unsafeUnTbody :: Tbody -> { | Tbody' }
unsafeUnTbody (Tbody unsafe) = unsafe

instance typeToSymTbody ::
  TypeToSym Tbody "tbody"

tbody
  :: forall children
   . Array (Attribute Tbody)
  -> { | children }
  -> Element Tbody children
tbody = makeElt Tbody "tbody"

tbody'attr
  :: Array (Attribute Tbody)
  -> Array (Attribute Tbody)
tbody'attr = identity

data TTbody = TTbody

instance typeToSymTTbody :: TypeToSym TTbody "TTbody"

instance semigroupTTbody :: Semigroup TTbody where
  append _ _ = TTbody

instance monoidTTbody :: Monoid TTbody where
  mempty = TTbody

instance reifyTTbody :: ReifyAU Tbody TTbody where
  reifyAU = const mempty
type Td' =
  ( tag :: String
  , attributes :: Array (Attribute Td)
  )
newtype Td = Td { | Td' }
unsafeUnTd :: Td -> { | Td' }
unsafeUnTd (Td unsafe) = unsafe

instance typeToSymTd ::
  TypeToSym Td "td"

td
  :: forall children
   . Array (Attribute Td)
  -> { | children }
  -> Element Td children
td = makeElt Td "td"

td'attr
  :: Array (Attribute Td)
  -> Array (Attribute Td)
td'attr = identity

data TTd = TTd

instance typeToSymTTd :: TypeToSym TTd "TTd"

instance semigroupTTd :: Semigroup TTd where
  append _ _ = TTd

instance monoidTTd :: Monoid TTd where
  mempty = TTd

instance reifyTTd :: ReifyAU Td TTd where
  reifyAU = const mempty
type Template' =
  ( tag :: String
  , attributes :: Array (Attribute Template)
  )
newtype Template = Template { | Template' }
unsafeUnTemplate :: Template -> { | Template' }
unsafeUnTemplate (Template unsafe) = unsafe

instance typeToSymTemplate ::
  TypeToSym Template "template"

template
  :: forall children
   . Array (Attribute Template)
  -> { | children }
  -> Element Template children
template = makeElt Template "template"

template'attr
  :: Array (Attribute Template)
  -> Array (Attribute Template)
template'attr = identity

data TTemplate = TTemplate

instance typeToSymTTemplate :: TypeToSym TTemplate "TTemplate"

instance semigroupTTemplate :: Semigroup TTemplate where
  append _ _ = TTemplate

instance monoidTTemplate :: Monoid TTemplate where
  mempty = TTemplate

instance reifyTTemplate :: ReifyAU Template TTemplate where
  reifyAU = const mempty
type Textarea' =
  ( tag :: String
  , attributes :: Array (Attribute Textarea)
  )
newtype Textarea = Textarea { | Textarea' }
unsafeUnTextarea :: Textarea -> { | Textarea' }
unsafeUnTextarea (Textarea unsafe) = unsafe

instance typeToSymTextarea ::
  TypeToSym Textarea "textarea"

textarea
  :: forall children
   . Array (Attribute Textarea)
  -> { | children }
  -> Element Textarea children
textarea = makeElt Textarea "textarea"

textarea'attr
  :: Array (Attribute Textarea)
  -> Array (Attribute Textarea)
textarea'attr = identity

data TTextarea = TTextarea

instance typeToSymTTextarea :: TypeToSym TTextarea "TTextarea"

instance semigroupTTextarea :: Semigroup TTextarea where
  append _ _ = TTextarea

instance monoidTTextarea :: Monoid TTextarea where
  mempty = TTextarea

instance reifyTTextarea :: ReifyAU Textarea TTextarea where
  reifyAU = const mempty
type Tfoot' =
  ( tag :: String
  , attributes :: Array (Attribute Tfoot)
  )
newtype Tfoot = Tfoot { | Tfoot' }
unsafeUnTfoot :: Tfoot -> { | Tfoot' }
unsafeUnTfoot (Tfoot unsafe) = unsafe

instance typeToSymTfoot ::
  TypeToSym Tfoot "tfoot"

tfoot
  :: forall children
   . Array (Attribute Tfoot)
  -> { | children }
  -> Element Tfoot children
tfoot = makeElt Tfoot "tfoot"

tfoot'attr
  :: Array (Attribute Tfoot)
  -> Array (Attribute Tfoot)
tfoot'attr = identity

data TTfoot = TTfoot

instance typeToSymTTfoot :: TypeToSym TTfoot "TTfoot"

instance semigroupTTfoot :: Semigroup TTfoot where
  append _ _ = TTfoot

instance monoidTTfoot :: Monoid TTfoot where
  mempty = TTfoot

instance reifyTTfoot :: ReifyAU Tfoot TTfoot where
  reifyAU = const mempty
type Th' =
  ( tag :: String
  , attributes :: Array (Attribute Th)
  )
newtype Th = Th { | Th' }
unsafeUnTh :: Th -> { | Th' }
unsafeUnTh (Th unsafe) = unsafe

instance typeToSymTh ::
  TypeToSym Th "th"

th
  :: forall children
   . Array (Attribute Th)
  -> { | children }
  -> Element Th children
th = makeElt Th "th"

th'attr
  :: Array (Attribute Th)
  -> Array (Attribute Th)
th'attr = identity

data TTh = TTh

instance typeToSymTTh :: TypeToSym TTh "TTh"

instance semigroupTTh :: Semigroup TTh where
  append _ _ = TTh

instance monoidTTh :: Monoid TTh where
  mempty = TTh

instance reifyTTh :: ReifyAU Th TTh where
  reifyAU = const mempty
type Thead' =
  ( tag :: String
  , attributes :: Array (Attribute Thead)
  )
newtype Thead = Thead { | Thead' }
unsafeUnThead :: Thead -> { | Thead' }
unsafeUnThead (Thead unsafe) = unsafe

instance typeToSymThead ::
  TypeToSym Thead "thead"

thead
  :: forall children
   . Array (Attribute Thead)
  -> { | children }
  -> Element Thead children
thead = makeElt Thead "thead"

thead'attr
  :: Array (Attribute Thead)
  -> Array (Attribute Thead)
thead'attr = identity

data TThead = TThead

instance typeToSymTThead :: TypeToSym TThead "TThead"

instance semigroupTThead :: Semigroup TThead where
  append _ _ = TThead

instance monoidTThead :: Monoid TThead where
  mempty = TThead

instance reifyTThead :: ReifyAU Thead TThead where
  reifyAU = const mempty
type Time' =
  ( tag :: String
  , attributes :: Array (Attribute Time)
  )
newtype Time = Time { | Time' }
unsafeUnTime :: Time -> { | Time' }
unsafeUnTime (Time unsafe) = unsafe

instance typeToSymTime ::
  TypeToSym Time "time"

time
  :: forall children
   . Array (Attribute Time)
  -> { | children }
  -> Element Time children
time = makeElt Time "time"

time'attr
  :: Array (Attribute Time)
  -> Array (Attribute Time)
time'attr = identity

data TTime = TTime

instance typeToSymTTime :: TypeToSym TTime "TTime"

instance semigroupTTime :: Semigroup TTime where
  append _ _ = TTime

instance monoidTTime :: Monoid TTime where
  mempty = TTime

instance reifyTTime :: ReifyAU Time TTime where
  reifyAU = const mempty
type Title' =
  ( tag :: String
  , attributes :: Array (Attribute Title)
  )
newtype Title = Title { | Title' }
unsafeUnTitle :: Title -> { | Title' }
unsafeUnTitle (Title unsafe) = unsafe

instance typeToSymTitle ::
  TypeToSym Title "title"

title
  :: forall children
   . Array (Attribute Title)
  -> { | children }
  -> Element Title children
title = makeElt Title "title"

title'attr
  :: Array (Attribute Title)
  -> Array (Attribute Title)
title'attr = identity

data TTitle = TTitle

instance typeToSymTTitle :: TypeToSym TTitle "TTitle"

instance semigroupTTitle :: Semigroup TTitle where
  append _ _ = TTitle

instance monoidTTitle :: Monoid TTitle where
  mempty = TTitle

instance reifyTTitle :: ReifyAU Title TTitle where
  reifyAU = const mempty
type Tr' =
  ( tag :: String
  , attributes :: Array (Attribute Tr)
  )
newtype Tr = Tr { | Tr' }
unsafeUnTr :: Tr -> { | Tr' }
unsafeUnTr (Tr unsafe) = unsafe

instance typeToSymTr ::
  TypeToSym Tr "tr"

tr
  :: forall children
   . Array (Attribute Tr)
  -> { | children }
  -> Element Tr children
tr = makeElt Tr "tr"

tr'attr
  :: Array (Attribute Tr)
  -> Array (Attribute Tr)
tr'attr = identity

data TTr = TTr

instance typeToSymTTr :: TypeToSym TTr "TTr"

instance semigroupTTr :: Semigroup TTr where
  append _ _ = TTr

instance monoidTTr :: Monoid TTr where
  mempty = TTr

instance reifyTTr :: ReifyAU Tr TTr where
  reifyAU = const mempty
type Track' =
  ( tag :: String
  , attributes :: Array (Attribute Track)
  )
newtype Track = Track { | Track' }
unsafeUnTrack :: Track -> { | Track' }
unsafeUnTrack (Track unsafe) = unsafe

instance typeToSymTrack ::
  TypeToSym Track "track"

track
  :: forall children
   . Array (Attribute Track)
  -> { | children }
  -> Element Track children
track = makeElt Track "track"

track'attr
  :: Array (Attribute Track)
  -> Array (Attribute Track)
track'attr = identity

data TTrack = TTrack

instance typeToSymTTrack :: TypeToSym TTrack "TTrack"

instance semigroupTTrack :: Semigroup TTrack where
  append _ _ = TTrack

instance monoidTTrack :: Monoid TTrack where
  mempty = TTrack

instance reifyTTrack :: ReifyAU Track TTrack where
  reifyAU = const mempty
type Tt' =
  ( tag :: String
  , attributes :: Array (Attribute Tt)
  )
newtype Tt = Tt { | Tt' }
unsafeUnTt :: Tt -> { | Tt' }
unsafeUnTt (Tt unsafe) = unsafe

instance typeToSymTt ::
  TypeToSym Tt "tt"

tt
  :: forall children
   . Array (Attribute Tt)
  -> { | children }
  -> Element Tt children
tt = makeElt Tt "tt"

tt'attr
  :: Array (Attribute Tt)
  -> Array (Attribute Tt)
tt'attr = identity

data TTt = TTt

instance typeToSymTTt :: TypeToSym TTt "TTt"

instance semigroupTTt :: Semigroup TTt where
  append _ _ = TTt

instance monoidTTt :: Monoid TTt where
  mempty = TTt

instance reifyTTt :: ReifyAU Tt TTt where
  reifyAU = const mempty
type U' =
  ( tag :: String
  , attributes :: Array (Attribute U)
  )
newtype U = U { | U' }
unsafeUnU :: U -> { | U' }
unsafeUnU (U unsafe) = unsafe

instance typeToSymU ::
  TypeToSym U "u"

u
  :: forall children
   . Array (Attribute U)
  -> { | children }
  -> Element U children
u = makeElt U "u"

u'attr
  :: Array (Attribute U)
  -> Array (Attribute U)
u'attr = identity

data TU = TU

instance typeToSymTU :: TypeToSym TU "TU"

instance semigroupTU :: Semigroup TU where
  append _ _ = TU

instance monoidTU :: Monoid TU where
  mempty = TU

instance reifyTU :: ReifyAU U TU where
  reifyAU = const mempty
type Ul' =
  ( tag :: String
  , attributes :: Array (Attribute Ul)
  )
newtype Ul = Ul { | Ul' }
unsafeUnUl :: Ul -> { | Ul' }
unsafeUnUl (Ul unsafe) = unsafe

instance typeToSymUl ::
  TypeToSym Ul "ul"

ul
  :: forall children
   . Array (Attribute Ul)
  -> { | children }
  -> Element Ul children
ul = makeElt Ul "ul"

ul'attr
  :: Array (Attribute Ul)
  -> Array (Attribute Ul)
ul'attr = identity

data TUl = TUl

instance typeToSymTUl :: TypeToSym TUl "TUl"

instance semigroupTUl :: Semigroup TUl where
  append _ _ = TUl

instance monoidTUl :: Monoid TUl where
  mempty = TUl

instance reifyTUl :: ReifyAU Ul TUl where
  reifyAU = const mempty
type Var' =
  ( tag :: String
  , attributes :: Array (Attribute Var)
  )
newtype Var = Var { | Var' }
unsafeUnVar :: Var -> { | Var' }
unsafeUnVar (Var unsafe) = unsafe

instance typeToSymVar ::
  TypeToSym Var "var"

var
  :: forall children
   . Array (Attribute Var)
  -> { | children }
  -> Element Var children
var = makeElt Var "var"

var'attr
  :: Array (Attribute Var)
  -> Array (Attribute Var)
var'attr = identity

data TVar = TVar

instance typeToSymTVar :: TypeToSym TVar "TVar"

instance semigroupTVar :: Semigroup TVar where
  append _ _ = TVar

instance monoidTVar :: Monoid TVar where
  mempty = TVar

instance reifyTVar :: ReifyAU Var TVar where
  reifyAU = const mempty
type Video' =
  ( tag :: String
  , attributes :: Array (Attribute Video)
  )
newtype Video = Video { | Video' }
unsafeUnVideo :: Video -> { | Video' }
unsafeUnVideo (Video unsafe) = unsafe

instance typeToSymVideo ::
  TypeToSym Video "video"

video
  :: forall children
   . Array (Attribute Video)
  -> { | children }
  -> Element Video children
video = makeElt Video "video"

video'attr
  :: Array (Attribute Video)
  -> Array (Attribute Video)
video'attr = identity

data TVideo = TVideo

instance typeToSymTVideo :: TypeToSym TVideo "TVideo"

instance semigroupTVideo :: Semigroup TVideo where
  append _ _ = TVideo

instance monoidTVideo :: Monoid TVideo where
  mempty = TVideo

instance reifyTVideo :: ReifyAU Video TVideo where
  reifyAU = const mempty
type Wbr' =
  ( tag :: String
  , attributes :: Array (Attribute Wbr)
  )
newtype Wbr = Wbr { | Wbr' }
unsafeUnWbr :: Wbr -> { | Wbr' }
unsafeUnWbr (Wbr unsafe) = unsafe

instance typeToSymWbr ::
  TypeToSym Wbr "wbr"

wbr
  :: forall children
   . Array (Attribute Wbr)
  -> { | children }
  -> Element Wbr children
wbr = makeElt Wbr "wbr"

wbr'attr
  :: Array (Attribute Wbr)
  -> Array (Attribute Wbr)
wbr'attr = identity

data TWbr = TWbr

instance typeToSymTWbr :: TypeToSym TWbr "TWbr"

instance semigroupTWbr :: Semigroup TWbr where
  append _ _ = TWbr

instance monoidTWbr :: Monoid TWbr where
  mempty = TWbr

instance reifyTWbr :: ReifyAU Wbr TWbr where
  reifyAU = const mempty
-- codegen 1