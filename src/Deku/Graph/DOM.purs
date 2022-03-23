module Deku.Graph.DOM
  ( Element
  , unsafeUnElement
  , class TypeToSym
  , SubgraphSig
  , ResolvedSubgraphSig
  , AsSubgraph(..)
  , unAsSubGraph
  , myNameIs
  , MyNameIs
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
  , unsafeUnSubgraph
  , XSubgraph'
  , XSubgraph
  , xsubgraph
  , unsafeUnXSubgraph
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
  , OnAnimationcancel(..)
  , OnAnimationend(..)
  , OnAnimationiteration(..)
  , OnAnimationstart(..)
  , OnAuxclick(..)
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
  , OnMousewheel(..)
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
  , OnPointerlockchange(..)
  , OnPointerlockerror(..)
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
  , OnShow(..)
  , OnSlotchange(..)
  , OnStalled(..)
  , OnSubmit(..)
  , OnSuspend(..)
  , OnTimeupdate(..)
  , OnVolumechange(..)
  , OnTouchcancel(..)
  , OnTouchend(..)
  , OnTouchmove(..)
  , OnTouchstart(..)
  , OnTransitioncancel(..)
  , OnTransitionend(..)
  , OnTransitionrun(..)
  , OnTransitionstart(..)
  , OnWaiting(..)
  -- codegen 7
  -- codegen 0
  , A_
  , TA_
  , a
  , a'attr
  , unsafeUnA_
  , Abbr_
  , TAbbr_
  , abbr
  , abbr'attr
  , unsafeUnAbbr_
  , Acronym_
  , TAcronym_
  , acronym
  , acronym'attr
  , unsafeUnAcronym_
  , Address_
  , TAddress_
  , address
  , address'attr
  , unsafeUnAddress_
  , Applet_
  , TApplet_
  , applet
  , applet'attr
  , unsafeUnApplet_
  , Area_
  , TArea_
  , area
  , area'attr
  , unsafeUnArea_
  , Article_
  , TArticle_
  , article
  , article'attr
  , unsafeUnArticle_
  , Aside_
  , TAside_
  , aside
  , aside'attr
  , unsafeUnAside_
  , Audio_
  , TAudio_
  , audio
  , audio'attr
  , unsafeUnAudio_
  , B_
  , TB_
  , b
  , b'attr
  , unsafeUnB_
  , Base_
  , TBase_
  , base
  , base'attr
  , unsafeUnBase_
  , Basefont_
  , TBasefont_
  , basefont
  , basefont'attr
  , unsafeUnBasefont_
  , Bdi_
  , TBdi_
  , bdi
  , bdi'attr
  , unsafeUnBdi_
  , Bdo_
  , TBdo_
  , bdo
  , bdo'attr
  , unsafeUnBdo_
  , Big_
  , TBig_
  , big
  , big'attr
  , unsafeUnBig_
  , Blockquote_
  , TBlockquote_
  , blockquote
  , blockquote'attr
  , unsafeUnBlockquote_
  , Body_
  , TBody_
  , body
  , body'attr
  , unsafeUnBody_
  , Br_
  , TBr_
  , br
  , br'attr
  , unsafeUnBr_
  , Button_
  , TButton_
  , button
  , button'attr
  , unsafeUnButton_
  , Canvas_
  , TCanvas_
  , canvas
  , canvas'attr
  , unsafeUnCanvas_
  , Caption_
  , TCaption_
  , caption
  , caption'attr
  , unsafeUnCaption_
  , Center_
  , TCenter_
  , center
  , center'attr
  , unsafeUnCenter_
  , Cite_
  , TCite_
  , cite
  , cite'attr
  , unsafeUnCite_
  , Code_
  , TCode_
  , code
  , code'attr
  , unsafeUnCode_
  , Col_
  , TCol_
  , col
  , col'attr
  , unsafeUnCol_
  , Colgroup_
  , TColgroup_
  , colgroup
  , colgroup'attr
  , unsafeUnColgroup_
  , Xdata_
  , TXdata_
  , xdata
  , xdata'attr
  , unsafeUnXdata_
  , Datalist_
  , TDatalist_
  , datalist
  , datalist'attr
  , unsafeUnDatalist_
  , Dd_
  , TDd_
  , dd
  , dd'attr
  , unsafeUnDd_
  , Del_
  , TDel_
  , del
  , del'attr
  , unsafeUnDel_
  , Details_
  , TDetails_
  , details
  , details'attr
  , unsafeUnDetails_
  , Dfn_
  , TDfn_
  , dfn
  , dfn'attr
  , unsafeUnDfn_
  , Dialog_
  , TDialog_
  , dialog
  , dialog'attr
  , unsafeUnDialog_
  , Dir_
  , TDir_
  , dir
  , dir'attr
  , unsafeUnDir_
  , Div_
  , TDiv_
  , div
  , div'attr
  , unsafeUnDiv_
  , Dl_
  , TDl_
  , dl
  , dl'attr
  , unsafeUnDl_
  , Dt_
  , TDt_
  , dt
  , dt'attr
  , unsafeUnDt_
  , Em_
  , TEm_
  , em
  , em'attr
  , unsafeUnEm_
  , Embed_
  , TEmbed_
  , embed
  , embed'attr
  , unsafeUnEmbed_
  , Fieldset_
  , TFieldset_
  , fieldset
  , fieldset'attr
  , unsafeUnFieldset_
  , Figcaption_
  , TFigcaption_
  , figcaption
  , figcaption'attr
  , unsafeUnFigcaption_
  , Figure_
  , TFigure_
  , figure
  , figure'attr
  , unsafeUnFigure_
  , Font_
  , TFont_
  , font
  , font'attr
  , unsafeUnFont_
  , Footer_
  , TFooter_
  , footer
  , footer'attr
  , unsafeUnFooter_
  , Form_
  , TForm_
  , form
  , form'attr
  , unsafeUnForm_
  , Frame_
  , TFrame_
  , frame
  , frame'attr
  , unsafeUnFrame_
  , Frameset_
  , TFrameset_
  , frameset
  , frameset'attr
  , unsafeUnFrameset_
  , H1_
  , TH1_
  , h1
  , h1'attr
  , unsafeUnH1_
  , H2_
  , TH2_
  , h2
  , h2'attr
  , unsafeUnH2_
  , H3_
  , TH3_
  , h3
  , h3'attr
  , unsafeUnH3_
  , H4_
  , TH4_
  , h4
  , h4'attr
  , unsafeUnH4_
  , H5_
  , TH5_
  , h5
  , h5'attr
  , unsafeUnH5_
  , H6_
  , TH6_
  , h6
  , h6'attr
  , unsafeUnH6_
  , Head_
  , THead_
  , head
  , head'attr
  , unsafeUnHead_
  , Header_
  , THeader_
  , header
  , header'attr
  , unsafeUnHeader_
  , Hr_
  , THr_
  , hr
  , hr'attr
  , unsafeUnHr_
  , Html_
  , THtml_
  , html
  , html'attr
  , unsafeUnHtml_
  , I_
  , TI_
  , i
  , i'attr
  , unsafeUnI_
  , Iframe_
  , TIframe_
  , iframe
  , iframe'attr
  , unsafeUnIframe_
  , Img_
  , TImg_
  , img
  , img'attr
  , unsafeUnImg_
  , Input_
  , TInput_
  , input
  , input'attr
  , unsafeUnInput_
  , Ins_
  , TIns_
  , ins
  , ins'attr
  , unsafeUnIns_
  , Kbd_
  , TKbd_
  , kbd
  , kbd'attr
  , unsafeUnKbd_
  , Label_
  , TLabel_
  , label
  , label'attr
  , unsafeUnLabel_
  , Legend_
  , TLegend_
  , legend
  , legend'attr
  , unsafeUnLegend_
  , Li_
  , TLi_
  , li
  , li'attr
  , unsafeUnLi_
  , Link_
  , TLink_
  , link
  , link'attr
  , unsafeUnLink_
  , Main_
  , TMain_
  , main
  , main'attr
  , unsafeUnMain_
  , Map_
  , TMap_
  , map
  , map'attr
  , unsafeUnMap_
  , Mark_
  , TMark_
  , mark
  , mark'attr
  , unsafeUnMark_
  , Meta_
  , TMeta_
  , meta
  , meta'attr
  , unsafeUnMeta_
  , Meter_
  , TMeter_
  , meter
  , meter'attr
  , unsafeUnMeter_
  , Nav_
  , TNav_
  , nav
  , nav'attr
  , unsafeUnNav_
  , Noframes_
  , TNoframes_
  , noframes
  , noframes'attr
  , unsafeUnNoframes_
  , Noscript_
  , TNoscript_
  , noscript
  , noscript'attr
  , unsafeUnNoscript_
  , Object_
  , TObject_
  , object
  , object'attr
  , unsafeUnObject_
  , Ol_
  , TOl_
  , ol
  , ol'attr
  , unsafeUnOl_
  , Optgroup_
  , TOptgroup_
  , optgroup
  , optgroup'attr
  , unsafeUnOptgroup_
  , Option_
  , TOption_
  , option
  , option'attr
  , unsafeUnOption_
  , Output_
  , TOutput_
  , output
  , output'attr
  , unsafeUnOutput_
  , P_
  , TP_
  , p
  , p'attr
  , unsafeUnP_
  , Param_
  , TParam_
  , param
  , param'attr
  , unsafeUnParam_
  , Picture_
  , TPicture_
  , picture
  , picture'attr
  , unsafeUnPicture_
  , Pre_
  , TPre_
  , pre
  , pre'attr
  , unsafeUnPre_
  , Progress_
  , TProgress_
  , progress
  , progress'attr
  , unsafeUnProgress_
  , Q_
  , TQ_
  , q
  , q'attr
  , unsafeUnQ_
  , Rp_
  , TRp_
  , rp
  , rp'attr
  , unsafeUnRp_
  , Rt_
  , TRt_
  , rt
  , rt'attr
  , unsafeUnRt_
  , Ruby_
  , TRuby_
  , ruby
  , ruby'attr
  , unsafeUnRuby_
  , S_
  , TS_
  , s
  , s'attr
  , unsafeUnS_
  , Samp_
  , TSamp_
  , samp
  , samp'attr
  , unsafeUnSamp_
  , Script_
  , TScript_
  , script
  , script'attr
  , unsafeUnScript_
  , Section_
  , TSection_
  , section
  , section'attr
  , unsafeUnSection_
  , Select_
  , TSelect_
  , select
  , select'attr
  , unsafeUnSelect_
  , Small_
  , TSmall_
  , small
  , small'attr
  , unsafeUnSmall_
  , Source_
  , TSource_
  , source
  , source'attr
  , unsafeUnSource_
  , Span_
  , TSpan_
  , span
  , span'attr
  , unsafeUnSpan_
  , Strike_
  , TStrike_
  , strike
  , strike'attr
  , unsafeUnStrike_
  , Strong_
  , TStrong_
  , strong
  , strong'attr
  , unsafeUnStrong_
  , Style_
  , TStyle_
  , style
  , style'attr
  , unsafeUnStyle_
  , Sub_
  , TSub_
  , sub
  , sub'attr
  , unsafeUnSub_
  , Summary_
  , TSummary_
  , summary
  , summary'attr
  , unsafeUnSummary_
  , Sup_
  , TSup_
  , sup
  , sup'attr
  , unsafeUnSup_
  , Svg_
  , TSvg_
  , svg
  , svg'attr
  , unsafeUnSvg_
  , Table_
  , TTable_
  , table
  , table'attr
  , unsafeUnTable_
  , Tbody_
  , TTbody_
  , tbody
  , tbody'attr
  , unsafeUnTbody_
  , Td_
  , TTd_
  , td
  , td'attr
  , unsafeUnTd_
  , Template_
  , TTemplate_
  , template
  , template'attr
  , unsafeUnTemplate_
  , Textarea_
  , TTextarea_
  , textarea
  , textarea'attr
  , unsafeUnTextarea_
  , Tfoot_
  , TTfoot_
  , tfoot
  , tfoot'attr
  , unsafeUnTfoot_
  , Th_
  , TTh_
  , th
  , th'attr
  , unsafeUnTh_
  , Thead_
  , TThead_
  , thead
  , thead'attr
  , unsafeUnThead_
  , Time_
  , TTime_
  , time
  , time'attr
  , unsafeUnTime_
  , Title_
  , TTitle_
  , title
  , title'attr
  , unsafeUnTitle_
  , Tr_
  , TTr_
  , tr
  , tr'attr
  , unsafeUnTr_
  , Track_
  , TTrack_
  , track
  , track'attr
  , unsafeUnTrack_
  , Tt_
  , TTt_
  , tt
  , tt'attr
  , unsafeUnTt_
  , U_
  , TU_
  , u
  , u'attr
  , unsafeUnU_
  , Ul_
  , TUl_
  , ul
  , ul'attr
  , unsafeUnUl_
  , Var_
  , TVar_
  , var
  , var'attr
  , unsafeUnVar_
  , Video_
  , TVideo_
  , video
  , video'attr
  , unsafeUnVideo_
  , Wbr_
  , TWbr_
  , wbr
  , wbr'attr
  , unsafeUnWbr_
  -- codegen 0
  ) where

import Prelude hiding (map)

import Data.Functor as Funk
import Data.Map (Map)
import Data.Map as Map
import Data.Tuple.Nested ((/\), type (/\))
import Data.Hashable (hash, class Hashable)
import Data.Maybe (Maybe)
import Data.Monoid.Additive (Additive)
import Deku.Control.Types (Frame0, SubScene)
import Deku.Graph.Attribute (Attribute, Cb, cb', prop', unsafeAttribute)
import Deku.Interpret (class DOMInterpret)
import Web.DOM as Web.DOM

class TypeToSym (a :: Type) (b :: Symbol) | a -> b

instance typeToSymTup :: TypeToSym a c => TypeToSym (a /\ b) c

newtype MyNameIs name item = MyNameIs { unMyNameIs :: item }

myNameIs :: forall proxy name item. proxy name -> item -> MyNameIs name item
myNameIs _ = MyNameIs <<< { unMyNameIs: _ }

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

type SubgraphSig index env push =
  forall dom engine
   . DOMInterpret dom engine
  => index
  -> SubScene env dom engine Frame0 push (Additive Int)

type ResolvedSubgraphSig env push =
  forall dom engine
   . DOMInterpret dom engine
  => SubScene env dom engine Frame0 push (Additive Int)

newtype AsSubgraph index env push = AsSubgraph
  ( forall dom engine
     . DOMInterpret dom engine
    => index
    -> SubScene env dom engine Frame0 push (Additive Int)
  )

unAsSubGraph
  :: forall index env push
   . AsSubgraph index env push
  -> ( forall dom engine
        . DOMInterpret dom engine
       => index
       -> SubScene env dom engine Frame0 push (Additive Int)
     )
unAsSubGraph (AsSubgraph sg) = sg

type Subgraph' index env push =
  ( subgraphMaker :: AsSubgraph index env push
  , envs :: Array { index :: index, pos :: Int, env :: Maybe env }
  )
newtype Subgraph index env push = Subgraph
  { | Subgraph' index env push }

subgraph
  :: forall index env push
   . Hashable index
  => Map index (Maybe env)
  -> AsSubgraph index env push
  -> Element (Subgraph index env push) ()
subgraph envs subgraphMaker =
  Element
    { element: Subgraph
        { envs: Funk.map
            ( \(index /\ env) ->
                { index
                , env
                , pos: hash index
                }
            )
            (Map.toUnfoldable envs)
        , subgraphMaker
        }
    , children: {}
    }

unsafeUnSubgraph
  :: forall index env push
   . Subgraph index env push
  -> { | Subgraph' index env push }
unsafeUnSubgraph (Subgraph unsafe) = unsafe

type XSubgraph' index env =
  (envs :: Array { index :: index, pos :: Int, env :: Maybe env })

newtype XSubgraph index env = XSubgraph { | XSubgraph' index env }

unsafeUnXSubgraph
  :: forall index env
   . XSubgraph index env
  -> { | XSubgraph' index env }
unsafeUnXSubgraph (XSubgraph unsafe) = unsafe

xsubgraph
  :: forall index env
   . Hashable index
  => Map index (Maybe env)
  -> XSubgraph index env
xsubgraph envs = XSubgraph
  { envs: Funk.map
      ( \(index /\ env) ->
          { index
          , env
          , pos: hash index
          }
      )
      (Map.toUnfoldable envs)
  }

instance typeToSymSubgraph ::
  TypeToSym (Subgraph index env push) "Subgraph"

instance typeToSymXSubgraph ::
  TypeToSym (XSubgraph index envs) "Subgraph"

class ReifyAU a b | a -> b where
  reifyAU :: a -> b
----------

-- | Type-level constructor for a subgraph.
data TSubgraph
  (env :: Type) = TSubgraph

instance typeToSymTSubgraph ::
  TypeToSym (TSubgraph env) "TSubgraph"

instance semigroupTSubgraph :: Semigroup (TSubgraph env) where
  append _ _ = TSubgraph

instance monoidTSubgraph :: Monoid (TSubgraph env) where
  mempty = TSubgraph

instance reifyTSubgraph ::
  ReifyAU (Subgraph index env push) (TSubgraph env) where
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
data OnAnimationcancel = OnAnimationcancel
data OnAnimationend = OnAnimationend
data OnAnimationiteration = OnAnimationiteration
data OnAnimationstart = OnAnimationstart
data OnAuxclick = OnAuxclick
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
data OnMousewheel = OnMousewheel
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
data OnPointerlockchange = OnPointerlockchange
data OnPointerlockerror = OnPointerlockerror
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
data OnShow = OnShow
data OnSlotchange = OnSlotchange
data OnStalled = OnStalled
data OnSubmit = OnSubmit
data OnSuspend = OnSuspend
data OnTimeupdate = OnTimeupdate
data OnVolumechange = OnVolumechange
data OnTouchcancel = OnTouchcancel
data OnTouchend = OnTouchend
data OnTouchmove = OnTouchmove
data OnTouchstart = OnTouchstart
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
  attr AcceptCharset value = unsafeAttribute
    { key: "accept-charset", value: prop' value }

instance Attr A_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Abbr_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Acronym_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Address_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Applet_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Area_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Article_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Aside_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Audio_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr B_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Base_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Basefont_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Bdi_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Bdo_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Big_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Blockquote_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Body_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Br_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Button_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Canvas_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Caption_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Center_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Cite_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Code_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Col_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Colgroup_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Xdata_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Datalist_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Dd_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Del_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Details_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Dfn_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Dialog_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Dir_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Div_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Dl_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Dt_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Em_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Embed_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Fieldset_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Figcaption_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Figure_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Font_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Footer_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Form_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Frame_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Frameset_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr H1_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr H2_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr H3_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr H4_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr H5_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr H6_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Head_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Header_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Hr_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Html_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr I_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Iframe_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Img_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Input_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Ins_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Kbd_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Label_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Legend_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Li_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Link_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Main_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Map_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Mark_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Meta_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Meter_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Nav_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Noframes_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Noscript_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Object_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Ol_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Optgroup_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Option_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Output_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr P_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Param_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Picture_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Pre_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Progress_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Q_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Rp_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Rt_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Ruby_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr S_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Samp_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Script_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Section_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Select_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Small_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Source_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Span_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Strike_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Strong_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Style_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Sub_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Summary_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Sup_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Svg_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Table_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Tbody_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Td_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Template_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Textarea_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Tfoot_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Th_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Thead_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Time_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Title_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Tr_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Track_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Tt_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr U_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Ul_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Var_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Video_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

instance Attr Wbr_ Accesskey String where
  attr Accesskey value = unsafeAttribute
    { key: "accesskey", value: prop' value }

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
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Abbr_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Acronym_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Address_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Applet_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Area_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Article_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Aside_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Audio_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr B_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Base_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Basefont_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Bdi_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Bdo_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Big_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Blockquote_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Body_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Br_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Button_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Canvas_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Caption_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Center_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Cite_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Code_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Col_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Colgroup_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Xdata_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Datalist_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Dd_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Del_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Details_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Dfn_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Dialog_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Dir_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Div_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Dl_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Dt_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Em_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Embed_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Fieldset_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Figcaption_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Figure_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Font_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Footer_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Form_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Frame_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Frameset_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr H1_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr H2_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr H3_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr H4_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr H5_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr H6_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Head_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Header_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Hr_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Html_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr I_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Iframe_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Img_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Input_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Ins_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Kbd_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Label_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Legend_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Li_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Link_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Main_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Map_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Mark_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Meta_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Meter_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Nav_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Noframes_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Noscript_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Object_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Ol_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Optgroup_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Option_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Output_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr P_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Param_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Picture_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Pre_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Progress_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Q_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Rp_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Rt_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Ruby_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr S_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Samp_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Script_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Section_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Select_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Small_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Source_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Span_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Strike_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Strong_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Style_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Sub_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Summary_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Sup_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Svg_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Table_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Tbody_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Td_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Template_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Textarea_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Tfoot_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Th_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Thead_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Time_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Title_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Tr_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Track_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Tt_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr U_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Ul_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Var_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Video_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Wbr_ Autocapitalize String where
  attr Autocapitalize value = unsafeAttribute
    { key: "autocapitalize", value: prop' value }

instance Attr Form_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute
    { key: "autocomplete", value: prop' value }

instance Attr Input_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute
    { key: "autocomplete", value: prop' value }

instance Attr Select_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute
    { key: "autocomplete", value: prop' value }

instance Attr Textarea_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute
    { key: "autocomplete", value: prop' value }

instance Attr Button_ Autofocus String where
  attr Autofocus value = unsafeAttribute
    { key: "autofocus", value: prop' value }

instance Attr Input_ Autofocus String where
  attr Autofocus value = unsafeAttribute
    { key: "autofocus", value: prop' value }

instance Attr Select_ Autofocus String where
  attr Autofocus value = unsafeAttribute
    { key: "autofocus", value: prop' value }

instance Attr Textarea_ Autofocus String where
  attr Autofocus value = unsafeAttribute
    { key: "autofocus", value: prop' value }

instance Attr Audio_ Autoplay String where
  attr Autoplay value = unsafeAttribute { key: "autoplay", value: prop' value }

instance Attr Video_ Autoplay String where
  attr Autoplay value = unsafeAttribute { key: "autoplay", value: prop' value }

instance Attr Body_ Background String where
  attr Background value = unsafeAttribute
    { key: "background", value: prop' value }

instance Attr Table_ Background String where
  attr Background value = unsafeAttribute
    { key: "background", value: prop' value }

instance Attr Td_ Background String where
  attr Background value = unsafeAttribute
    { key: "background", value: prop' value }

instance Attr Th_ Background String where
  attr Background value = unsafeAttribute
    { key: "background", value: prop' value }

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
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Abbr_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Acronym_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Address_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Applet_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Area_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Article_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Aside_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Audio_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr B_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Base_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Basefont_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Bdi_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Bdo_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Big_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Blockquote_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Body_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Br_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Button_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Canvas_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Caption_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Center_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Cite_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Code_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Col_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Colgroup_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Xdata_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Datalist_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Dd_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Del_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Details_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Dfn_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Dialog_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Dir_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Div_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Dl_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Dt_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Em_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Embed_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Fieldset_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Figcaption_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Figure_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Font_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Footer_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Form_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Frame_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Frameset_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr H1_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr H2_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr H3_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr H4_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr H5_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr H6_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Head_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Header_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Hr_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Html_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr I_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Iframe_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Img_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Input_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Ins_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Kbd_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Label_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Legend_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Li_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Link_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Main_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Map_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Mark_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Meta_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Meter_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Nav_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Noframes_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Noscript_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Object_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Ol_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Optgroup_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Option_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Output_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr P_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Param_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Picture_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Pre_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Progress_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Q_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Rp_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Rt_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Ruby_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr S_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Samp_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Script_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Section_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Select_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Small_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Source_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Span_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Strike_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Strong_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Style_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Sub_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Summary_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Sup_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Svg_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Table_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Tbody_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Td_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Template_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Textarea_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Tfoot_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Th_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Thead_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Time_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Title_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Tr_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Track_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Tt_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr U_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Ul_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Var_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Video_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

instance Attr Wbr_ Challenge String where
  attr Challenge value = unsafeAttribute
    { key: "challenge", value: prop' value }

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
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Abbr_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Acronym_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Address_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Applet_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Area_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Article_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Aside_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Audio_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr B_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Base_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Basefont_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Bdi_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Bdo_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Big_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Blockquote_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Body_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Br_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Button_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Canvas_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Caption_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Center_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Cite_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Code_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Col_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Colgroup_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Xdata_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Datalist_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Dd_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Del_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Details_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Dfn_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Dialog_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Dir_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Div_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Dl_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Dt_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Em_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Embed_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Fieldset_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Figcaption_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Figure_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Font_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Footer_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Form_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Frame_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Frameset_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr H1_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr H2_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr H3_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr H4_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr H5_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr H6_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Head_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Header_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Hr_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Html_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr I_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Iframe_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Img_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Input_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Ins_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Kbd_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Label_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Legend_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Li_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Link_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Main_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Map_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Mark_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Meta_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Meter_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Nav_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Noframes_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Noscript_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Object_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Ol_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Optgroup_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Option_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Output_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr P_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Param_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Picture_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Pre_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Progress_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Q_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Rp_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Rt_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Ruby_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr S_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Samp_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Script_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Section_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Select_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Small_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Source_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Span_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Strike_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Strong_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Style_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Sub_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Summary_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Sup_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Svg_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Table_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Tbody_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Td_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Template_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Textarea_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Tfoot_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Th_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Thead_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Time_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Title_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Tr_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Track_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Tt_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr U_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Ul_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Var_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Video_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr Wbr_ Contenteditable String where
  attr Contenteditable value = unsafeAttribute
    { key: "contenteditable", value: prop' value }

instance Attr A_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Abbr_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Acronym_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Address_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Applet_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Area_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Article_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Aside_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Audio_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr B_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Base_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Basefont_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Bdi_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Bdo_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Big_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Blockquote_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Body_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Br_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Button_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Canvas_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Caption_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Center_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Cite_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Code_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Col_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Colgroup_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Xdata_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Datalist_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Dd_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Del_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Details_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Dfn_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Dialog_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Dir_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Div_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Dl_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Dt_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Em_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Embed_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Fieldset_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Figcaption_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Figure_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Font_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Footer_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Form_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Frame_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Frameset_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr H1_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr H2_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr H3_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr H4_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr H5_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr H6_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Head_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Header_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Hr_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Html_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr I_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Iframe_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Img_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Input_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Ins_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Kbd_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Label_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Legend_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Li_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Link_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Main_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Map_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Mark_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Meta_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Meter_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Nav_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Noframes_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Noscript_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Object_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Ol_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Optgroup_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Option_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Output_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr P_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Param_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Picture_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Pre_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Progress_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Q_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Rp_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Rt_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Ruby_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr S_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Samp_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Script_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Section_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Select_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Small_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Source_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Span_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Strike_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Strong_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Style_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Sub_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Summary_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Sup_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Svg_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Table_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Tbody_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Td_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Template_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Textarea_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Tfoot_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Th_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Thead_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Time_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Title_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Tr_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Track_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Tt_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr U_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Ul_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Var_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Video_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Wbr_ Contextmenu String where
  attr Contextmenu value = unsafeAttribute
    { key: "contextmenu", value: prop' value }

instance Attr Audio_ Controls String where
  attr Controls value = unsafeAttribute { key: "controls", value: prop' value }

instance Attr Video_ Controls String where
  attr Controls value = unsafeAttribute { key: "controls", value: prop' value }

instance Attr Area_ Coords String where
  attr Coords value = unsafeAttribute { key: "coords", value: prop' value }

instance Attr Audio_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute
    { key: "crossorigin", value: prop' value }

instance Attr Img_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute
    { key: "crossorigin", value: prop' value }

instance Attr Link_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute
    { key: "crossorigin", value: prop' value }

instance Attr Script_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute
    { key: "crossorigin", value: prop' value }

instance Attr Video_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute
    { key: "crossorigin", value: prop' value }

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
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Abbr_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Acronym_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Address_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Applet_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Area_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Article_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Aside_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Audio_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr B_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Base_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Basefont_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Bdi_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Bdo_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Big_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Blockquote_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Body_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Br_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Button_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Canvas_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Caption_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Center_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Cite_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Code_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Col_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Colgroup_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Xdata_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Datalist_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dd_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Del_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Details_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dfn_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dialog_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dir_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Div_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dl_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dt_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Em_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Embed_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Fieldset_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Figcaption_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Figure_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Font_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Footer_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Form_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Frame_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Frameset_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H1_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H2_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H3_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H4_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H5_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H6_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Head_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Header_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Hr_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Html_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr I_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Iframe_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Img_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Input_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Ins_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Kbd_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Label_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Legend_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Li_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Link_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Main_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Map_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Mark_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Meta_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Meter_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Nav_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Noframes_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Noscript_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Object_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Ol_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Optgroup_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Option_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Output_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr P_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Param_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Picture_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Pre_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Progress_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Q_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Rp_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Rt_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Ruby_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr S_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Samp_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Script_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Section_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Select_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Small_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Source_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Span_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Strike_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Strong_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Style_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Sub_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Summary_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Sup_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Svg_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Table_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Tbody_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Td_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Template_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Textarea_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Tfoot_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Th_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Thead_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Time_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Title_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Tr_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Track_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Tt_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr U_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Ul_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Var_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Video_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Wbr_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Form_ Enctype String where
  attr Enctype value = unsafeAttribute { key: "enctype", value: prop' value }

instance Attr Textarea_ Enterkeyhint String where
  attr Enterkeyhint value = unsafeAttribute
    { key: "enterkeyhint", value: prop' value }

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
  attr Formaction value = unsafeAttribute
    { key: "formaction", value: prop' value }

instance Attr Button_ Formaction String where
  attr Formaction value = unsafeAttribute
    { key: "formaction", value: prop' value }

instance Attr Button_ Formenctype String where
  attr Formenctype value = unsafeAttribute
    { key: "formenctype", value: prop' value }

instance Attr Input_ Formenctype String where
  attr Formenctype value = unsafeAttribute
    { key: "formenctype", value: prop' value }

instance Attr Button_ Formmethod String where
  attr Formmethod value = unsafeAttribute
    { key: "formmethod", value: prop' value }

instance Attr Input_ Formmethod String where
  attr Formmethod value = unsafeAttribute
    { key: "formmethod", value: prop' value }

instance Attr Button_ Formnovalidate String where
  attr Formnovalidate value = unsafeAttribute
    { key: "formnovalidate", value: prop' value }

instance Attr Input_ Formnovalidate String where
  attr Formnovalidate value = unsafeAttribute
    { key: "formnovalidate", value: prop' value }

instance Attr Button_ Formtarget String where
  attr Formtarget value = unsafeAttribute
    { key: "formtarget", value: prop' value }

instance Attr Input_ Formtarget String where
  attr Formtarget value = unsafeAttribute
    { key: "formtarget", value: prop' value }

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
  attr HttpEquiv value = unsafeAttribute
    { key: "http-equiv", value: prop' value }

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
  attr Importance value = unsafeAttribute
    { key: "importance", value: prop' value }

instance Attr Img_ Importance String where
  attr Importance value = unsafeAttribute
    { key: "importance", value: prop' value }

instance Attr Link_ Importance String where
  attr Importance value = unsafeAttribute
    { key: "importance", value: prop' value }

instance Attr Script_ Importance String where
  attr Importance value = unsafeAttribute
    { key: "importance", value: prop' value }

instance Attr Link_ Integrity String where
  attr Integrity value = unsafeAttribute
    { key: "integrity", value: prop' value }

instance Attr Script_ Integrity String where
  attr Integrity value = unsafeAttribute
    { key: "integrity", value: prop' value }

instance Attr Img_ Intrinsicsize String where
  attr Intrinsicsize value = unsafeAttribute
    { key: "intrinsicsize", value: prop' value }

instance Attr Textarea_ Inputmode String where
  attr Inputmode value = unsafeAttribute
    { key: "inputmode", value: prop' value }

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
  attr Maxlength value = unsafeAttribute
    { key: "maxlength", value: prop' value }

instance Attr Textarea_ Maxlength String where
  attr Maxlength value = unsafeAttribute
    { key: "maxlength", value: prop' value }

instance Attr Input_ Minlength String where
  attr Minlength value = unsafeAttribute
    { key: "minlength", value: prop' value }

instance Attr Textarea_ Minlength String where
  attr Minlength value = unsafeAttribute
    { key: "minlength", value: prop' value }

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
  attr Novalidate value = unsafeAttribute
    { key: "novalidate", value: prop' value }

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
  attr Placeholder value = unsafeAttribute
    { key: "placeholder", value: prop' value }

instance Attr Textarea_ Placeholder String where
  attr Placeholder value = unsafeAttribute
    { key: "placeholder", value: prop' value }

instance Attr Video_ Poster String where
  attr Poster value = unsafeAttribute { key: "poster", value: prop' value }

instance Attr Audio_ Preload String where
  attr Preload value = unsafeAttribute { key: "preload", value: prop' value }

instance Attr Video_ Preload String where
  attr Preload value = unsafeAttribute { key: "preload", value: prop' value }

instance Attr A_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Abbr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Acronym_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Address_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Applet_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Area_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Article_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Aside_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Audio_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr B_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Base_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Basefont_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Bdi_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Bdo_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Big_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Blockquote_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Body_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Br_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Button_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Canvas_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Caption_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Center_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Cite_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Code_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Col_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Colgroup_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Xdata_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Datalist_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dd_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Del_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Details_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dfn_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dialog_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dir_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Div_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dl_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dt_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Em_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Embed_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Fieldset_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Figcaption_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Figure_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Font_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Footer_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Form_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Frame_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Frameset_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H1_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H2_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H3_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H4_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H5_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H6_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Head_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Header_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Hr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Html_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr I_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Iframe_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Img_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Input_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Ins_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Kbd_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Label_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Legend_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Li_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Link_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Main_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Map_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Mark_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Meta_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Meter_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Nav_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Noframes_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Noscript_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Object_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Ol_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Optgroup_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Option_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Output_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr P_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Param_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Picture_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Pre_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Progress_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Q_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Rp_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Rt_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Ruby_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr S_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Samp_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Script_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Section_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Select_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Small_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Source_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Span_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Strike_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Strong_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Style_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Sub_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Summary_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Sup_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Svg_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Table_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Tbody_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Td_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Template_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Textarea_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Tfoot_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Th_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Thead_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Time_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Title_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Tr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Track_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Tt_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr U_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Ul_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Var_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Video_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Wbr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Input_ Readonly String where
  attr Readonly value = unsafeAttribute { key: "readonly", value: prop' value }

instance Attr Textarea_ Readonly String where
  attr Readonly value = unsafeAttribute { key: "readonly", value: prop' value }

instance Attr A_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute
    { key: "referrerpolicy", value: prop' value }

instance Attr Area_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute
    { key: "referrerpolicy", value: prop' value }

instance Attr Iframe_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute
    { key: "referrerpolicy", value: prop' value }

instance Attr Img_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute
    { key: "referrerpolicy", value: prop' value }

instance Attr Link_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute
    { key: "referrerpolicy", value: prop' value }

instance Attr Script_ Referrerpolicy String where
  attr Referrerpolicy value = unsafeAttribute
    { key: "referrerpolicy", value: prop' value }

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
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Abbr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Acronym_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Address_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Applet_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Area_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Article_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Aside_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Audio_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr B_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Base_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Basefont_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Bdi_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Bdo_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Big_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Blockquote_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Body_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Br_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Button_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Canvas_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Caption_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Center_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Cite_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Code_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Col_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Colgroup_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Xdata_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Datalist_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dd_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Del_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Details_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dfn_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dialog_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dir_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Div_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dl_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dt_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Em_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Embed_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Fieldset_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Figcaption_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Figure_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Font_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Footer_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Form_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Frame_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Frameset_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H1_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H2_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H3_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H4_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H5_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H6_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Head_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Header_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Hr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Html_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr I_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Iframe_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Img_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Input_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Ins_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Kbd_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Label_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Legend_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Li_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Link_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Main_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Map_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Mark_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Meta_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Meter_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Nav_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Noframes_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Noscript_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Object_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Ol_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Optgroup_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Option_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Output_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr P_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Param_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Picture_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Pre_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Progress_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Q_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Rp_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Rt_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Ruby_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr S_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Samp_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Script_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Section_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Select_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Small_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Source_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Span_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Strike_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Strong_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Style_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Sub_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Summary_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Sup_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Svg_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Table_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Tbody_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Td_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Template_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Textarea_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Tfoot_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Th_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Thead_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Time_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Title_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Tr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Track_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Tt_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr U_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Ul_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Var_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Video_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Wbr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

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
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Abbr_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Acronym_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Address_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Applet_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Area_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Article_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Aside_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Audio_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr B_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Base_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Basefont_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Bdi_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Bdo_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Big_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Blockquote_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Body_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Br_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Button_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Canvas_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Caption_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Center_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Cite_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Code_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Col_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Colgroup_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Xdata_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Datalist_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Dd_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Del_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Details_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Dfn_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Dialog_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Dir_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Div_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Dl_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Dt_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Em_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Embed_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Fieldset_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Figcaption_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Figure_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Font_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Footer_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Form_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Frame_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Frameset_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr H1_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr H2_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr H3_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr H4_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr H5_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr H6_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Head_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Header_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Hr_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Html_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr I_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Iframe_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Img_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Input_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Ins_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Kbd_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Label_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Legend_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Li_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Link_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Main_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Map_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Mark_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Meta_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Meter_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Nav_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Noframes_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Noscript_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Object_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Ol_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Optgroup_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Option_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Output_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr P_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Param_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Picture_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Pre_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Progress_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Q_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Rp_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Rt_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Ruby_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr S_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Samp_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Script_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Section_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Select_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Small_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Source_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Span_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Strike_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Strong_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Style_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Sub_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Summary_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Sup_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Svg_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Table_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Tbody_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Td_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Template_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Textarea_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Tfoot_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Th_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Thead_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Time_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Title_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Tr_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Track_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Tt_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr U_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Ul_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Var_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Video_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

instance Attr Wbr_ Translate String where
  attr Translate value = unsafeAttribute
    { key: "translate", value: prop' value }

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
instance Attr anything OnAnimationcancel Cb where
  attr OnAnimationcancel value = unsafeAttribute
    { key: "animationcancel ", value: cb' value }
instance Attr anything OnAnimationend Cb where
  attr OnAnimationend value = unsafeAttribute
    { key: "animationend ", value: cb' value }
instance Attr anything OnAnimationiteration Cb where
  attr OnAnimationiteration value = unsafeAttribute
    { key: "animationiteration ", value: cb' value }
instance Attr anything OnAnimationstart Cb where
  attr OnAnimationstart value = unsafeAttribute
    { key: "animationstart ", value: cb' value }
instance Attr anything OnAuxclick Cb where
  attr OnAuxclick value = unsafeAttribute { key: "auxclick ", value: cb' value }
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
  attr OnCanplaythrough value = unsafeAttribute
    { key: "canplaythrough", value: cb' value }
instance Attr anything OnChange Cb where
  attr OnChange value = unsafeAttribute { key: "change", value: cb' value }
instance Attr anything OnClick Cb where
  attr OnClick value = unsafeAttribute { key: "click", value: cb' value }
instance Attr anything OnClose Cb where
  attr OnClose value = unsafeAttribute { key: "close", value: cb' value }
instance Attr anything OnContextmenu Cb where
  attr OnContextmenu value = unsafeAttribute
    { key: "contextmenu", value: cb' value }
instance Attr anything OnDblclick Cb where
  attr OnDblclick value = unsafeAttribute { key: "dblclick", value: cb' value }
instance Attr anything OnDrag Cb where
  attr OnDrag value = unsafeAttribute { key: "drag", value: cb' value }
instance Attr anything OnDragend Cb where
  attr OnDragend value = unsafeAttribute { key: "dragend", value: cb' value }
instance Attr anything OnDragenter Cb where
  attr OnDragenter value = unsafeAttribute
    { key: "dragenter", value: cb' value }
instance Attr anything OnDragleave Cb where
  attr OnDragleave value = unsafeAttribute
    { key: "dragleave", value: cb' value }
instance Attr anything OnDragover Cb where
  attr OnDragover value = unsafeAttribute { key: "dragover", value: cb' value }
instance Attr anything OnDragstart Cb where
  attr OnDragstart value = unsafeAttribute
    { key: "dragstart", value: cb' value }
instance Attr anything OnDrop Cb where
  attr OnDrop value = unsafeAttribute { key: "drop", value: cb' value }
instance Attr anything OnDurationchange Cb where
  attr OnDurationchange value = unsafeAttribute
    { key: "durationchange", value: cb' value }
instance Attr anything OnEmptied Cb where
  attr OnEmptied value = unsafeAttribute { key: "emptied", value: cb' value }
instance Attr anything OnEnded Cb where
  attr OnEnded value = unsafeAttribute { key: "ended", value: cb' value }
instance Attr anything OnFormdata Cb where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb' value }
instance Attr anything OnGotpointercapture Cb where
  attr OnGotpointercapture value = unsafeAttribute
    { key: "gotpointercapture", value: cb' value }
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
  attr OnLoadeddata value = unsafeAttribute
    { key: "loadeddata", value: cb' value }
instance Attr anything OnLoadedmetadata Cb where
  attr OnLoadedmetadata value = unsafeAttribute
    { key: "loadedmetadata", value: cb' value }
instance Attr anything OnLoadend Cb where
  attr OnLoadend value = unsafeAttribute { key: "loadend", value: cb' value }
instance Attr anything OnLoadstart Cb where
  attr OnLoadstart value = unsafeAttribute
    { key: "loadstart", value: cb' value }
instance Attr anything OnLostpointercapture Cb where
  attr OnLostpointercapture value = unsafeAttribute
    { key: "lostpointercapture", value: cb' value }
instance Attr anything OnMousedown Cb where
  attr OnMousedown value = unsafeAttribute
    { key: "mousedown", value: cb' value }
instance Attr anything OnMouseenter Cb where
  attr OnMouseenter value = unsafeAttribute
    { key: "mouseenter", value: cb' value }
instance Attr anything OnMouseleave Cb where
  attr OnMouseleave value = unsafeAttribute
    { key: "mouseleave", value: cb' value }
instance Attr anything OnMousemove Cb where
  attr OnMousemove value = unsafeAttribute
    { key: "mousemove", value: cb' value }
instance Attr anything OnMouseout Cb where
  attr OnMouseout value = unsafeAttribute { key: "mouseout", value: cb' value }
instance Attr anything OnMouseover Cb where
  attr OnMouseover value = unsafeAttribute
    { key: "mouseover", value: cb' value }
instance Attr anything OnMouseup Cb where
  attr OnMouseup value = unsafeAttribute { key: "mouseup", value: cb' value }
instance Attr anything OnMousewheel Cb where
  attr OnMousewheel value = unsafeAttribute
    { key: "mousewheel  ", value: cb' value }
instance Attr anything OnWheel Cb where
  attr OnWheel value = unsafeAttribute { key: "wheel", value: cb' value }
instance Attr anything OnPause Cb where
  attr OnPause value = unsafeAttribute { key: "pause", value: cb' value }
instance Attr anything OnPlay Cb where
  attr OnPlay value = unsafeAttribute { key: "play", value: cb' value }
instance Attr anything OnPlaying Cb where
  attr OnPlaying value = unsafeAttribute { key: "playing", value: cb' value }
instance Attr anything OnPointerdown Cb where
  attr OnPointerdown value = unsafeAttribute
    { key: "pointerdown", value: cb' value }
instance Attr anything OnPointermove Cb where
  attr OnPointermove value = unsafeAttribute
    { key: "pointermove", value: cb' value }
instance Attr anything OnPointerup Cb where
  attr OnPointerup value = unsafeAttribute
    { key: "pointerup", value: cb' value }
instance Attr anything OnPointercancel Cb where
  attr OnPointercancel value = unsafeAttribute
    { key: "pointercancel", value: cb' value }
instance Attr anything OnPointerover Cb where
  attr OnPointerover value = unsafeAttribute
    { key: "pointerover", value: cb' value }
instance Attr anything OnPointerout Cb where
  attr OnPointerout value = unsafeAttribute
    { key: "pointerout", value: cb' value }
instance Attr anything OnPointerenter Cb where
  attr OnPointerenter value = unsafeAttribute
    { key: "pointerenter", value: cb' value }
instance Attr anything OnPointerleave Cb where
  attr OnPointerleave value = unsafeAttribute
    { key: "pointerleave", value: cb' value }
instance Attr anything OnPointerlockchange Cb where
  attr OnPointerlockchange value = unsafeAttribute
    { key: "pointerlockchange ", value: cb' value }
instance Attr anything OnPointerlockerror Cb where
  attr OnPointerlockerror value = unsafeAttribute
    { key: "pointerlockerror ", value: cb' value }
instance Attr anything OnProgress Cb where
  attr OnProgress value = unsafeAttribute { key: "progress", value: cb' value }
instance Attr anything OnRatechange Cb where
  attr OnRatechange value = unsafeAttribute
    { key: "ratechange", value: cb' value }
instance Attr anything OnReset Cb where
  attr OnReset value = unsafeAttribute { key: "reset", value: cb' value }
instance Attr anything OnResize Cb where
  attr OnResize value = unsafeAttribute { key: "resize", value: cb' value }
instance Attr anything OnScroll Cb where
  attr OnScroll value = unsafeAttribute { key: "scroll", value: cb' value }
instance Attr anything OnSecuritypolicyviolation Cb where
  attr OnSecuritypolicyviolation value = unsafeAttribute
    { key: "securitypolicyviolation", value: cb' value }
instance Attr anything OnSeeked Cb where
  attr OnSeeked value = unsafeAttribute { key: "seeked", value: cb' value }
instance Attr anything OnSeeking Cb where
  attr OnSeeking value = unsafeAttribute { key: "seeking", value: cb' value }
instance Attr anything OnSelect Cb where
  attr OnSelect value = unsafeAttribute { key: "select", value: cb' value }
instance Attr anything OnSelectstart Cb where
  attr OnSelectstart value = unsafeAttribute
    { key: "selectstart", value: cb' value }
instance Attr anything OnSelectionchange Cb where
  attr OnSelectionchange value = unsafeAttribute
    { key: "selectionchange", value: cb' value }
instance Attr anything OnShow Cb where
  attr OnShow value = unsafeAttribute { key: "show ", value: cb' value }
instance Attr anything OnSlotchange Cb where
  attr OnSlotchange value = unsafeAttribute
    { key: "slotchange", value: cb' value }
instance Attr anything OnStalled Cb where
  attr OnStalled value = unsafeAttribute { key: "stalled", value: cb' value }
instance Attr anything OnSubmit Cb where
  attr OnSubmit value = unsafeAttribute { key: "submit", value: cb' value }
instance Attr anything OnSuspend Cb where
  attr OnSuspend value = unsafeAttribute { key: "suspend", value: cb' value }
instance Attr anything OnTimeupdate Cb where
  attr OnTimeupdate value = unsafeAttribute
    { key: "timeupdate", value: cb' value }
instance Attr anything OnVolumechange Cb where
  attr OnVolumechange value = unsafeAttribute
    { key: "volumechange", value: cb' value }
instance Attr anything OnTouchcancel Cb where
  attr OnTouchcancel value = unsafeAttribute
    { key: "touchcancel  ", value: cb' value }
instance Attr anything OnTouchend Cb where
  attr OnTouchend value = unsafeAttribute
    { key: "touchend  ", value: cb' value }
instance Attr anything OnTouchmove Cb where
  attr OnTouchmove value = unsafeAttribute
    { key: "touchmove  ", value: cb' value }
instance Attr anything OnTouchstart Cb where
  attr OnTouchstart value = unsafeAttribute
    { key: "touchstart  ", value: cb' value }
instance Attr anything OnTransitioncancel Cb where
  attr OnTransitioncancel value = unsafeAttribute
    { key: "transitioncancel", value: cb' value }
instance Attr anything OnTransitionend Cb where
  attr OnTransitionend value = unsafeAttribute
    { key: "transitionend", value: cb' value }
instance Attr anything OnTransitionrun Cb where
  attr OnTransitionrun value = unsafeAttribute
    { key: "transitionrun", value: cb' value }
instance Attr anything OnTransitionstart Cb where
  attr OnTransitionstart value = unsafeAttribute
    { key: "transitionstart", value: cb' value }
instance Attr anything OnWaiting Cb where
  attr OnWaiting value = unsafeAttribute { key: "waiting", value: cb' value }
-- codegen 8
-- codegen 1
type A_' =
  ( tag :: String
  , attributes :: Array (Attribute A_)
  )
newtype A_ = A_ { | A_' }
unsafeUnA_ :: A_ -> { | A_' }
unsafeUnA_ (A_ unsafe) = unsafe

instance typeToSymA_ ::
  TypeToSym A_ "a"

a
  :: forall children
   . Array (Attribute A_)
  -> { | children }
  -> Element A_ children
a = makeElt A_ "a"

a'attr
  :: Array (Attribute A_)
  -> Array (Attribute A_)
a'attr = identity

data TA_ = TA_

instance typeToSymTA_ :: TypeToSym TA_ "TA_"

instance semigroupTA_ :: Semigroup TA_ where
  append _ _ = TA_

instance monoidTA_ :: Monoid TA_ where
  mempty = TA_

instance reifyTA_ :: ReifyAU A_ TA_ where
  reifyAU = const mempty
type Abbr_' =
  ( tag :: String
  , attributes :: Array (Attribute Abbr_)
  )
newtype Abbr_ = Abbr_ { | Abbr_' }
unsafeUnAbbr_ :: Abbr_ -> { | Abbr_' }
unsafeUnAbbr_ (Abbr_ unsafe) = unsafe

instance typeToSymAbbr_ ::
  TypeToSym Abbr_ "abbr"

abbr
  :: forall children
   . Array (Attribute Abbr_)
  -> { | children }
  -> Element Abbr_ children
abbr = makeElt Abbr_ "abbr"

abbr'attr
  :: Array (Attribute Abbr_)
  -> Array (Attribute Abbr_)
abbr'attr = identity

data TAbbr_ = TAbbr_

instance typeToSymTAbbr_ :: TypeToSym TAbbr_ "TAbbr_"

instance semigroupTAbbr_ :: Semigroup TAbbr_ where
  append _ _ = TAbbr_

instance monoidTAbbr_ :: Monoid TAbbr_ where
  mempty = TAbbr_

instance reifyTAbbr_ :: ReifyAU Abbr_ TAbbr_ where
  reifyAU = const mempty
type Acronym_' =
  ( tag :: String
  , attributes :: Array (Attribute Acronym_)
  )
newtype Acronym_ = Acronym_ { | Acronym_' }
unsafeUnAcronym_ :: Acronym_ -> { | Acronym_' }
unsafeUnAcronym_ (Acronym_ unsafe) = unsafe

instance typeToSymAcronym_ ::
  TypeToSym Acronym_ "acronym"

acronym
  :: forall children
   . Array (Attribute Acronym_)
  -> { | children }
  -> Element Acronym_ children
acronym = makeElt Acronym_ "acronym"

acronym'attr
  :: Array (Attribute Acronym_)
  -> Array (Attribute Acronym_)
acronym'attr = identity

data TAcronym_ = TAcronym_

instance typeToSymTAcronym_ :: TypeToSym TAcronym_ "TAcronym_"

instance semigroupTAcronym_ :: Semigroup TAcronym_ where
  append _ _ = TAcronym_

instance monoidTAcronym_ :: Monoid TAcronym_ where
  mempty = TAcronym_

instance reifyTAcronym_ :: ReifyAU Acronym_ TAcronym_ where
  reifyAU = const mempty
type Address_' =
  ( tag :: String
  , attributes :: Array (Attribute Address_)
  )
newtype Address_ = Address_ { | Address_' }
unsafeUnAddress_ :: Address_ -> { | Address_' }
unsafeUnAddress_ (Address_ unsafe) = unsafe

instance typeToSymAddress_ ::
  TypeToSym Address_ "address"

address
  :: forall children
   . Array (Attribute Address_)
  -> { | children }
  -> Element Address_ children
address = makeElt Address_ "address"

address'attr
  :: Array (Attribute Address_)
  -> Array (Attribute Address_)
address'attr = identity

data TAddress_ = TAddress_

instance typeToSymTAddress_ :: TypeToSym TAddress_ "TAddress_"

instance semigroupTAddress_ :: Semigroup TAddress_ where
  append _ _ = TAddress_

instance monoidTAddress_ :: Monoid TAddress_ where
  mempty = TAddress_

instance reifyTAddress_ :: ReifyAU Address_ TAddress_ where
  reifyAU = const mempty
type Applet_' =
  ( tag :: String
  , attributes :: Array (Attribute Applet_)
  )
newtype Applet_ = Applet_ { | Applet_' }
unsafeUnApplet_ :: Applet_ -> { | Applet_' }
unsafeUnApplet_ (Applet_ unsafe) = unsafe

instance typeToSymApplet_ ::
  TypeToSym Applet_ "applet"

applet
  :: forall children
   . Array (Attribute Applet_)
  -> { | children }
  -> Element Applet_ children
applet = makeElt Applet_ "applet"

applet'attr
  :: Array (Attribute Applet_)
  -> Array (Attribute Applet_)
applet'attr = identity

data TApplet_ = TApplet_

instance typeToSymTApplet_ :: TypeToSym TApplet_ "TApplet_"

instance semigroupTApplet_ :: Semigroup TApplet_ where
  append _ _ = TApplet_

instance monoidTApplet_ :: Monoid TApplet_ where
  mempty = TApplet_

instance reifyTApplet_ :: ReifyAU Applet_ TApplet_ where
  reifyAU = const mempty
type Area_' =
  ( tag :: String
  , attributes :: Array (Attribute Area_)
  )
newtype Area_ = Area_ { | Area_' }
unsafeUnArea_ :: Area_ -> { | Area_' }
unsafeUnArea_ (Area_ unsafe) = unsafe

instance typeToSymArea_ ::
  TypeToSym Area_ "area"

area
  :: forall children
   . Array (Attribute Area_)
  -> { | children }
  -> Element Area_ children
area = makeElt Area_ "area"

area'attr
  :: Array (Attribute Area_)
  -> Array (Attribute Area_)
area'attr = identity

data TArea_ = TArea_

instance typeToSymTArea_ :: TypeToSym TArea_ "TArea_"

instance semigroupTArea_ :: Semigroup TArea_ where
  append _ _ = TArea_

instance monoidTArea_ :: Monoid TArea_ where
  mempty = TArea_

instance reifyTArea_ :: ReifyAU Area_ TArea_ where
  reifyAU = const mempty
type Article_' =
  ( tag :: String
  , attributes :: Array (Attribute Article_)
  )
newtype Article_ = Article_ { | Article_' }
unsafeUnArticle_ :: Article_ -> { | Article_' }
unsafeUnArticle_ (Article_ unsafe) = unsafe

instance typeToSymArticle_ ::
  TypeToSym Article_ "article"

article
  :: forall children
   . Array (Attribute Article_)
  -> { | children }
  -> Element Article_ children
article = makeElt Article_ "article"

article'attr
  :: Array (Attribute Article_)
  -> Array (Attribute Article_)
article'attr = identity

data TArticle_ = TArticle_

instance typeToSymTArticle_ :: TypeToSym TArticle_ "TArticle_"

instance semigroupTArticle_ :: Semigroup TArticle_ where
  append _ _ = TArticle_

instance monoidTArticle_ :: Monoid TArticle_ where
  mempty = TArticle_

instance reifyTArticle_ :: ReifyAU Article_ TArticle_ where
  reifyAU = const mempty
type Aside_' =
  ( tag :: String
  , attributes :: Array (Attribute Aside_)
  )
newtype Aside_ = Aside_ { | Aside_' }
unsafeUnAside_ :: Aside_ -> { | Aside_' }
unsafeUnAside_ (Aside_ unsafe) = unsafe

instance typeToSymAside_ ::
  TypeToSym Aside_ "aside"

aside
  :: forall children
   . Array (Attribute Aside_)
  -> { | children }
  -> Element Aside_ children
aside = makeElt Aside_ "aside"

aside'attr
  :: Array (Attribute Aside_)
  -> Array (Attribute Aside_)
aside'attr = identity

data TAside_ = TAside_

instance typeToSymTAside_ :: TypeToSym TAside_ "TAside_"

instance semigroupTAside_ :: Semigroup TAside_ where
  append _ _ = TAside_

instance monoidTAside_ :: Monoid TAside_ where
  mempty = TAside_

instance reifyTAside_ :: ReifyAU Aside_ TAside_ where
  reifyAU = const mempty
type Audio_' =
  ( tag :: String
  , attributes :: Array (Attribute Audio_)
  )
newtype Audio_ = Audio_ { | Audio_' }
unsafeUnAudio_ :: Audio_ -> { | Audio_' }
unsafeUnAudio_ (Audio_ unsafe) = unsafe

instance typeToSymAudio_ ::
  TypeToSym Audio_ "audio"

audio
  :: forall children
   . Array (Attribute Audio_)
  -> { | children }
  -> Element Audio_ children
audio = makeElt Audio_ "audio"

audio'attr
  :: Array (Attribute Audio_)
  -> Array (Attribute Audio_)
audio'attr = identity

data TAudio_ = TAudio_

instance typeToSymTAudio_ :: TypeToSym TAudio_ "TAudio_"

instance semigroupTAudio_ :: Semigroup TAudio_ where
  append _ _ = TAudio_

instance monoidTAudio_ :: Monoid TAudio_ where
  mempty = TAudio_

instance reifyTAudio_ :: ReifyAU Audio_ TAudio_ where
  reifyAU = const mempty
type B_' =
  ( tag :: String
  , attributes :: Array (Attribute B_)
  )
newtype B_ = B_ { | B_' }
unsafeUnB_ :: B_ -> { | B_' }
unsafeUnB_ (B_ unsafe) = unsafe

instance typeToSymB_ ::
  TypeToSym B_ "b"

b
  :: forall children
   . Array (Attribute B_)
  -> { | children }
  -> Element B_ children
b = makeElt B_ "b"

b'attr
  :: Array (Attribute B_)
  -> Array (Attribute B_)
b'attr = identity

data TB_ = TB_

instance typeToSymTB_ :: TypeToSym TB_ "TB_"

instance semigroupTB_ :: Semigroup TB_ where
  append _ _ = TB_

instance monoidTB_ :: Monoid TB_ where
  mempty = TB_

instance reifyTB_ :: ReifyAU B_ TB_ where
  reifyAU = const mempty
type Base_' =
  ( tag :: String
  , attributes :: Array (Attribute Base_)
  )
newtype Base_ = Base_ { | Base_' }
unsafeUnBase_ :: Base_ -> { | Base_' }
unsafeUnBase_ (Base_ unsafe) = unsafe

instance typeToSymBase_ ::
  TypeToSym Base_ "base"

base
  :: forall children
   . Array (Attribute Base_)
  -> { | children }
  -> Element Base_ children
base = makeElt Base_ "base"

base'attr
  :: Array (Attribute Base_)
  -> Array (Attribute Base_)
base'attr = identity

data TBase_ = TBase_

instance typeToSymTBase_ :: TypeToSym TBase_ "TBase_"

instance semigroupTBase_ :: Semigroup TBase_ where
  append _ _ = TBase_

instance monoidTBase_ :: Monoid TBase_ where
  mempty = TBase_

instance reifyTBase_ :: ReifyAU Base_ TBase_ where
  reifyAU = const mempty
type Basefont_' =
  ( tag :: String
  , attributes :: Array (Attribute Basefont_)
  )
newtype Basefont_ = Basefont_ { | Basefont_' }
unsafeUnBasefont_ :: Basefont_ -> { | Basefont_' }
unsafeUnBasefont_ (Basefont_ unsafe) = unsafe

instance typeToSymBasefont_ ::
  TypeToSym Basefont_ "basefont"

basefont
  :: forall children
   . Array (Attribute Basefont_)
  -> { | children }
  -> Element Basefont_ children
basefont = makeElt Basefont_ "basefont"

basefont'attr
  :: Array (Attribute Basefont_)
  -> Array (Attribute Basefont_)
basefont'attr = identity

data TBasefont_ = TBasefont_

instance typeToSymTBasefont_ :: TypeToSym TBasefont_ "TBasefont_"

instance semigroupTBasefont_ :: Semigroup TBasefont_ where
  append _ _ = TBasefont_

instance monoidTBasefont_ :: Monoid TBasefont_ where
  mempty = TBasefont_

instance reifyTBasefont_ :: ReifyAU Basefont_ TBasefont_ where
  reifyAU = const mempty
type Bdi_' =
  ( tag :: String
  , attributes :: Array (Attribute Bdi_)
  )
newtype Bdi_ = Bdi_ { | Bdi_' }
unsafeUnBdi_ :: Bdi_ -> { | Bdi_' }
unsafeUnBdi_ (Bdi_ unsafe) = unsafe

instance typeToSymBdi_ ::
  TypeToSym Bdi_ "bdi"

bdi
  :: forall children
   . Array (Attribute Bdi_)
  -> { | children }
  -> Element Bdi_ children
bdi = makeElt Bdi_ "bdi"

bdi'attr
  :: Array (Attribute Bdi_)
  -> Array (Attribute Bdi_)
bdi'attr = identity

data TBdi_ = TBdi_

instance typeToSymTBdi_ :: TypeToSym TBdi_ "TBdi_"

instance semigroupTBdi_ :: Semigroup TBdi_ where
  append _ _ = TBdi_

instance monoidTBdi_ :: Monoid TBdi_ where
  mempty = TBdi_

instance reifyTBdi_ :: ReifyAU Bdi_ TBdi_ where
  reifyAU = const mempty
type Bdo_' =
  ( tag :: String
  , attributes :: Array (Attribute Bdo_)
  )
newtype Bdo_ = Bdo_ { | Bdo_' }
unsafeUnBdo_ :: Bdo_ -> { | Bdo_' }
unsafeUnBdo_ (Bdo_ unsafe) = unsafe

instance typeToSymBdo_ ::
  TypeToSym Bdo_ "bdo"

bdo
  :: forall children
   . Array (Attribute Bdo_)
  -> { | children }
  -> Element Bdo_ children
bdo = makeElt Bdo_ "bdo"

bdo'attr
  :: Array (Attribute Bdo_)
  -> Array (Attribute Bdo_)
bdo'attr = identity

data TBdo_ = TBdo_

instance typeToSymTBdo_ :: TypeToSym TBdo_ "TBdo_"

instance semigroupTBdo_ :: Semigroup TBdo_ where
  append _ _ = TBdo_

instance monoidTBdo_ :: Monoid TBdo_ where
  mempty = TBdo_

instance reifyTBdo_ :: ReifyAU Bdo_ TBdo_ where
  reifyAU = const mempty
type Big_' =
  ( tag :: String
  , attributes :: Array (Attribute Big_)
  )
newtype Big_ = Big_ { | Big_' }
unsafeUnBig_ :: Big_ -> { | Big_' }
unsafeUnBig_ (Big_ unsafe) = unsafe

instance typeToSymBig_ ::
  TypeToSym Big_ "big"

big
  :: forall children
   . Array (Attribute Big_)
  -> { | children }
  -> Element Big_ children
big = makeElt Big_ "big"

big'attr
  :: Array (Attribute Big_)
  -> Array (Attribute Big_)
big'attr = identity

data TBig_ = TBig_

instance typeToSymTBig_ :: TypeToSym TBig_ "TBig_"

instance semigroupTBig_ :: Semigroup TBig_ where
  append _ _ = TBig_

instance monoidTBig_ :: Monoid TBig_ where
  mempty = TBig_

instance reifyTBig_ :: ReifyAU Big_ TBig_ where
  reifyAU = const mempty
type Blockquote_' =
  ( tag :: String
  , attributes :: Array (Attribute Blockquote_)
  )
newtype Blockquote_ = Blockquote_ { | Blockquote_' }
unsafeUnBlockquote_ :: Blockquote_ -> { | Blockquote_' }
unsafeUnBlockquote_ (Blockquote_ unsafe) = unsafe

instance typeToSymBlockquote_ ::
  TypeToSym Blockquote_ "blockquote"

blockquote
  :: forall children
   . Array (Attribute Blockquote_)
  -> { | children }
  -> Element Blockquote_ children
blockquote = makeElt Blockquote_ "blockquote"

blockquote'attr
  :: Array (Attribute Blockquote_)
  -> Array (Attribute Blockquote_)
blockquote'attr = identity

data TBlockquote_ = TBlockquote_

instance typeToSymTBlockquote_ :: TypeToSym TBlockquote_ "TBlockquote_"

instance semigroupTBlockquote_ :: Semigroup TBlockquote_ where
  append _ _ = TBlockquote_

instance monoidTBlockquote_ :: Monoid TBlockquote_ where
  mempty = TBlockquote_

instance reifyTBlockquote_ :: ReifyAU Blockquote_ TBlockquote_ where
  reifyAU = const mempty
type Body_' =
  ( tag :: String
  , attributes :: Array (Attribute Body_)
  )
newtype Body_ = Body_ { | Body_' }
unsafeUnBody_ :: Body_ -> { | Body_' }
unsafeUnBody_ (Body_ unsafe) = unsafe

instance typeToSymBody_ ::
  TypeToSym Body_ "body"

body
  :: forall children
   . Array (Attribute Body_)
  -> { | children }
  -> Element Body_ children
body = makeElt Body_ "body"

body'attr
  :: Array (Attribute Body_)
  -> Array (Attribute Body_)
body'attr = identity

data TBody_ = TBody_

instance typeToSymTBody_ :: TypeToSym TBody_ "TBody_"

instance semigroupTBody_ :: Semigroup TBody_ where
  append _ _ = TBody_

instance monoidTBody_ :: Monoid TBody_ where
  mempty = TBody_

instance reifyTBody_ :: ReifyAU Body_ TBody_ where
  reifyAU = const mempty
type Br_' =
  ( tag :: String
  , attributes :: Array (Attribute Br_)
  )
newtype Br_ = Br_ { | Br_' }
unsafeUnBr_ :: Br_ -> { | Br_' }
unsafeUnBr_ (Br_ unsafe) = unsafe

instance typeToSymBr_ ::
  TypeToSym Br_ "br"

br
  :: forall children
   . Array (Attribute Br_)
  -> { | children }
  -> Element Br_ children
br = makeElt Br_ "br"

br'attr
  :: Array (Attribute Br_)
  -> Array (Attribute Br_)
br'attr = identity

data TBr_ = TBr_

instance typeToSymTBr_ :: TypeToSym TBr_ "TBr_"

instance semigroupTBr_ :: Semigroup TBr_ where
  append _ _ = TBr_

instance monoidTBr_ :: Monoid TBr_ where
  mempty = TBr_

instance reifyTBr_ :: ReifyAU Br_ TBr_ where
  reifyAU = const mempty
type Button_' =
  ( tag :: String
  , attributes :: Array (Attribute Button_)
  )
newtype Button_ = Button_ { | Button_' }
unsafeUnButton_ :: Button_ -> { | Button_' }
unsafeUnButton_ (Button_ unsafe) = unsafe

instance typeToSymButton_ ::
  TypeToSym Button_ "button"

button
  :: forall children
   . Array (Attribute Button_)
  -> { | children }
  -> Element Button_ children
button = makeElt Button_ "button"

button'attr
  :: Array (Attribute Button_)
  -> Array (Attribute Button_)
button'attr = identity

data TButton_ = TButton_

instance typeToSymTButton_ :: TypeToSym TButton_ "TButton_"

instance semigroupTButton_ :: Semigroup TButton_ where
  append _ _ = TButton_

instance monoidTButton_ :: Monoid TButton_ where
  mempty = TButton_

instance reifyTButton_ :: ReifyAU Button_ TButton_ where
  reifyAU = const mempty
type Canvas_' =
  ( tag :: String
  , attributes :: Array (Attribute Canvas_)
  )
newtype Canvas_ = Canvas_ { | Canvas_' }
unsafeUnCanvas_ :: Canvas_ -> { | Canvas_' }
unsafeUnCanvas_ (Canvas_ unsafe) = unsafe

instance typeToSymCanvas_ ::
  TypeToSym Canvas_ "canvas"

canvas
  :: forall children
   . Array (Attribute Canvas_)
  -> { | children }
  -> Element Canvas_ children
canvas = makeElt Canvas_ "canvas"

canvas'attr
  :: Array (Attribute Canvas_)
  -> Array (Attribute Canvas_)
canvas'attr = identity

data TCanvas_ = TCanvas_

instance typeToSymTCanvas_ :: TypeToSym TCanvas_ "TCanvas_"

instance semigroupTCanvas_ :: Semigroup TCanvas_ where
  append _ _ = TCanvas_

instance monoidTCanvas_ :: Monoid TCanvas_ where
  mempty = TCanvas_

instance reifyTCanvas_ :: ReifyAU Canvas_ TCanvas_ where
  reifyAU = const mempty
type Caption_' =
  ( tag :: String
  , attributes :: Array (Attribute Caption_)
  )
newtype Caption_ = Caption_ { | Caption_' }
unsafeUnCaption_ :: Caption_ -> { | Caption_' }
unsafeUnCaption_ (Caption_ unsafe) = unsafe

instance typeToSymCaption_ ::
  TypeToSym Caption_ "caption"

caption
  :: forall children
   . Array (Attribute Caption_)
  -> { | children }
  -> Element Caption_ children
caption = makeElt Caption_ "caption"

caption'attr
  :: Array (Attribute Caption_)
  -> Array (Attribute Caption_)
caption'attr = identity

data TCaption_ = TCaption_

instance typeToSymTCaption_ :: TypeToSym TCaption_ "TCaption_"

instance semigroupTCaption_ :: Semigroup TCaption_ where
  append _ _ = TCaption_

instance monoidTCaption_ :: Monoid TCaption_ where
  mempty = TCaption_

instance reifyTCaption_ :: ReifyAU Caption_ TCaption_ where
  reifyAU = const mempty
type Center_' =
  ( tag :: String
  , attributes :: Array (Attribute Center_)
  )
newtype Center_ = Center_ { | Center_' }
unsafeUnCenter_ :: Center_ -> { | Center_' }
unsafeUnCenter_ (Center_ unsafe) = unsafe

instance typeToSymCenter_ ::
  TypeToSym Center_ "center"

center
  :: forall children
   . Array (Attribute Center_)
  -> { | children }
  -> Element Center_ children
center = makeElt Center_ "center"

center'attr
  :: Array (Attribute Center_)
  -> Array (Attribute Center_)
center'attr = identity

data TCenter_ = TCenter_

instance typeToSymTCenter_ :: TypeToSym TCenter_ "TCenter_"

instance semigroupTCenter_ :: Semigroup TCenter_ where
  append _ _ = TCenter_

instance monoidTCenter_ :: Monoid TCenter_ where
  mempty = TCenter_

instance reifyTCenter_ :: ReifyAU Center_ TCenter_ where
  reifyAU = const mempty
type Cite_' =
  ( tag :: String
  , attributes :: Array (Attribute Cite_)
  )
newtype Cite_ = Cite_ { | Cite_' }
unsafeUnCite_ :: Cite_ -> { | Cite_' }
unsafeUnCite_ (Cite_ unsafe) = unsafe

instance typeToSymCite_ ::
  TypeToSym Cite_ "cite"

cite
  :: forall children
   . Array (Attribute Cite_)
  -> { | children }
  -> Element Cite_ children
cite = makeElt Cite_ "cite"

cite'attr
  :: Array (Attribute Cite_)
  -> Array (Attribute Cite_)
cite'attr = identity

data TCite_ = TCite_

instance typeToSymTCite_ :: TypeToSym TCite_ "TCite_"

instance semigroupTCite_ :: Semigroup TCite_ where
  append _ _ = TCite_

instance monoidTCite_ :: Monoid TCite_ where
  mempty = TCite_

instance reifyTCite_ :: ReifyAU Cite_ TCite_ where
  reifyAU = const mempty
type Code_' =
  ( tag :: String
  , attributes :: Array (Attribute Code_)
  )
newtype Code_ = Code_ { | Code_' }
unsafeUnCode_ :: Code_ -> { | Code_' }
unsafeUnCode_ (Code_ unsafe) = unsafe

instance typeToSymCode_ ::
  TypeToSym Code_ "code"

code
  :: forall children
   . Array (Attribute Code_)
  -> { | children }
  -> Element Code_ children
code = makeElt Code_ "code"

code'attr
  :: Array (Attribute Code_)
  -> Array (Attribute Code_)
code'attr = identity

data TCode_ = TCode_

instance typeToSymTCode_ :: TypeToSym TCode_ "TCode_"

instance semigroupTCode_ :: Semigroup TCode_ where
  append _ _ = TCode_

instance monoidTCode_ :: Monoid TCode_ where
  mempty = TCode_

instance reifyTCode_ :: ReifyAU Code_ TCode_ where
  reifyAU = const mempty
type Col_' =
  ( tag :: String
  , attributes :: Array (Attribute Col_)
  )
newtype Col_ = Col_ { | Col_' }
unsafeUnCol_ :: Col_ -> { | Col_' }
unsafeUnCol_ (Col_ unsafe) = unsafe

instance typeToSymCol_ ::
  TypeToSym Col_ "col"

col
  :: forall children
   . Array (Attribute Col_)
  -> { | children }
  -> Element Col_ children
col = makeElt Col_ "col"

col'attr
  :: Array (Attribute Col_)
  -> Array (Attribute Col_)
col'attr = identity

data TCol_ = TCol_

instance typeToSymTCol_ :: TypeToSym TCol_ "TCol_"

instance semigroupTCol_ :: Semigroup TCol_ where
  append _ _ = TCol_

instance monoidTCol_ :: Monoid TCol_ where
  mempty = TCol_

instance reifyTCol_ :: ReifyAU Col_ TCol_ where
  reifyAU = const mempty
type Colgroup_' =
  ( tag :: String
  , attributes :: Array (Attribute Colgroup_)
  )
newtype Colgroup_ = Colgroup_ { | Colgroup_' }
unsafeUnColgroup_ :: Colgroup_ -> { | Colgroup_' }
unsafeUnColgroup_ (Colgroup_ unsafe) = unsafe

instance typeToSymColgroup_ ::
  TypeToSym Colgroup_ "colgroup"

colgroup
  :: forall children
   . Array (Attribute Colgroup_)
  -> { | children }
  -> Element Colgroup_ children
colgroup = makeElt Colgroup_ "colgroup"

colgroup'attr
  :: Array (Attribute Colgroup_)
  -> Array (Attribute Colgroup_)
colgroup'attr = identity

data TColgroup_ = TColgroup_

instance typeToSymTColgroup_ :: TypeToSym TColgroup_ "TColgroup_"

instance semigroupTColgroup_ :: Semigroup TColgroup_ where
  append _ _ = TColgroup_

instance monoidTColgroup_ :: Monoid TColgroup_ where
  mempty = TColgroup_

instance reifyTColgroup_ :: ReifyAU Colgroup_ TColgroup_ where
  reifyAU = const mempty
type Xdata_' =
  ( tag :: String
  , attributes :: Array (Attribute Xdata_)
  )
newtype Xdata_ = Xdata_ { | Xdata_' }
unsafeUnXdata_ :: Xdata_ -> { | Xdata_' }
unsafeUnXdata_ (Xdata_ unsafe) = unsafe

instance typeToSymXdata_ ::
  TypeToSym Xdata_ "data"

xdata
  :: forall children
   . Array (Attribute Xdata_)
  -> { | children }
  -> Element Xdata_ children
xdata = makeElt Xdata_ "data"

xdata'attr
  :: Array (Attribute Xdata_)
  -> Array (Attribute Xdata_)
xdata'attr = identity

data TXdata_ = TXdata_

instance typeToSymTXdata_ :: TypeToSym TXdata_ "TXdata_"

instance semigroupTXdata_ :: Semigroup TXdata_ where
  append _ _ = TXdata_

instance monoidTXdata_ :: Monoid TXdata_ where
  mempty = TXdata_

instance reifyTXdata_ :: ReifyAU Xdata_ TXdata_ where
  reifyAU = const mempty
type Datalist_' =
  ( tag :: String
  , attributes :: Array (Attribute Datalist_)
  )
newtype Datalist_ = Datalist_ { | Datalist_' }
unsafeUnDatalist_ :: Datalist_ -> { | Datalist_' }
unsafeUnDatalist_ (Datalist_ unsafe) = unsafe

instance typeToSymDatalist_ ::
  TypeToSym Datalist_ "datalist"

datalist
  :: forall children
   . Array (Attribute Datalist_)
  -> { | children }
  -> Element Datalist_ children
datalist = makeElt Datalist_ "datalist"

datalist'attr
  :: Array (Attribute Datalist_)
  -> Array (Attribute Datalist_)
datalist'attr = identity

data TDatalist_ = TDatalist_

instance typeToSymTDatalist_ :: TypeToSym TDatalist_ "TDatalist_"

instance semigroupTDatalist_ :: Semigroup TDatalist_ where
  append _ _ = TDatalist_

instance monoidTDatalist_ :: Monoid TDatalist_ where
  mempty = TDatalist_

instance reifyTDatalist_ :: ReifyAU Datalist_ TDatalist_ where
  reifyAU = const mempty
type Dd_' =
  ( tag :: String
  , attributes :: Array (Attribute Dd_)
  )
newtype Dd_ = Dd_ { | Dd_' }
unsafeUnDd_ :: Dd_ -> { | Dd_' }
unsafeUnDd_ (Dd_ unsafe) = unsafe

instance typeToSymDd_ ::
  TypeToSym Dd_ "dd"

dd
  :: forall children
   . Array (Attribute Dd_)
  -> { | children }
  -> Element Dd_ children
dd = makeElt Dd_ "dd"

dd'attr
  :: Array (Attribute Dd_)
  -> Array (Attribute Dd_)
dd'attr = identity

data TDd_ = TDd_

instance typeToSymTDd_ :: TypeToSym TDd_ "TDd_"

instance semigroupTDd_ :: Semigroup TDd_ where
  append _ _ = TDd_

instance monoidTDd_ :: Monoid TDd_ where
  mempty = TDd_

instance reifyTDd_ :: ReifyAU Dd_ TDd_ where
  reifyAU = const mempty
type Del_' =
  ( tag :: String
  , attributes :: Array (Attribute Del_)
  )
newtype Del_ = Del_ { | Del_' }
unsafeUnDel_ :: Del_ -> { | Del_' }
unsafeUnDel_ (Del_ unsafe) = unsafe

instance typeToSymDel_ ::
  TypeToSym Del_ "del"

del
  :: forall children
   . Array (Attribute Del_)
  -> { | children }
  -> Element Del_ children
del = makeElt Del_ "del"

del'attr
  :: Array (Attribute Del_)
  -> Array (Attribute Del_)
del'attr = identity

data TDel_ = TDel_

instance typeToSymTDel_ :: TypeToSym TDel_ "TDel_"

instance semigroupTDel_ :: Semigroup TDel_ where
  append _ _ = TDel_

instance monoidTDel_ :: Monoid TDel_ where
  mempty = TDel_

instance reifyTDel_ :: ReifyAU Del_ TDel_ where
  reifyAU = const mempty
type Details_' =
  ( tag :: String
  , attributes :: Array (Attribute Details_)
  )
newtype Details_ = Details_ { | Details_' }
unsafeUnDetails_ :: Details_ -> { | Details_' }
unsafeUnDetails_ (Details_ unsafe) = unsafe

instance typeToSymDetails_ ::
  TypeToSym Details_ "details"

details
  :: forall children
   . Array (Attribute Details_)
  -> { | children }
  -> Element Details_ children
details = makeElt Details_ "details"

details'attr
  :: Array (Attribute Details_)
  -> Array (Attribute Details_)
details'attr = identity

data TDetails_ = TDetails_

instance typeToSymTDetails_ :: TypeToSym TDetails_ "TDetails_"

instance semigroupTDetails_ :: Semigroup TDetails_ where
  append _ _ = TDetails_

instance monoidTDetails_ :: Monoid TDetails_ where
  mempty = TDetails_

instance reifyTDetails_ :: ReifyAU Details_ TDetails_ where
  reifyAU = const mempty
type Dfn_' =
  ( tag :: String
  , attributes :: Array (Attribute Dfn_)
  )
newtype Dfn_ = Dfn_ { | Dfn_' }
unsafeUnDfn_ :: Dfn_ -> { | Dfn_' }
unsafeUnDfn_ (Dfn_ unsafe) = unsafe

instance typeToSymDfn_ ::
  TypeToSym Dfn_ "dfn"

dfn
  :: forall children
   . Array (Attribute Dfn_)
  -> { | children }
  -> Element Dfn_ children
dfn = makeElt Dfn_ "dfn"

dfn'attr
  :: Array (Attribute Dfn_)
  -> Array (Attribute Dfn_)
dfn'attr = identity

data TDfn_ = TDfn_

instance typeToSymTDfn_ :: TypeToSym TDfn_ "TDfn_"

instance semigroupTDfn_ :: Semigroup TDfn_ where
  append _ _ = TDfn_

instance monoidTDfn_ :: Monoid TDfn_ where
  mempty = TDfn_

instance reifyTDfn_ :: ReifyAU Dfn_ TDfn_ where
  reifyAU = const mempty
type Dialog_' =
  ( tag :: String
  , attributes :: Array (Attribute Dialog_)
  )
newtype Dialog_ = Dialog_ { | Dialog_' }
unsafeUnDialog_ :: Dialog_ -> { | Dialog_' }
unsafeUnDialog_ (Dialog_ unsafe) = unsafe

instance typeToSymDialog_ ::
  TypeToSym Dialog_ "dialog"

dialog
  :: forall children
   . Array (Attribute Dialog_)
  -> { | children }
  -> Element Dialog_ children
dialog = makeElt Dialog_ "dialog"

dialog'attr
  :: Array (Attribute Dialog_)
  -> Array (Attribute Dialog_)
dialog'attr = identity

data TDialog_ = TDialog_

instance typeToSymTDialog_ :: TypeToSym TDialog_ "TDialog_"

instance semigroupTDialog_ :: Semigroup TDialog_ where
  append _ _ = TDialog_

instance monoidTDialog_ :: Monoid TDialog_ where
  mempty = TDialog_

instance reifyTDialog_ :: ReifyAU Dialog_ TDialog_ where
  reifyAU = const mempty
type Dir_' =
  ( tag :: String
  , attributes :: Array (Attribute Dir_)
  )
newtype Dir_ = Dir_ { | Dir_' }
unsafeUnDir_ :: Dir_ -> { | Dir_' }
unsafeUnDir_ (Dir_ unsafe) = unsafe

instance typeToSymDir_ ::
  TypeToSym Dir_ "dir"

dir
  :: forall children
   . Array (Attribute Dir_)
  -> { | children }
  -> Element Dir_ children
dir = makeElt Dir_ "dir"

dir'attr
  :: Array (Attribute Dir_)
  -> Array (Attribute Dir_)
dir'attr = identity

data TDir_ = TDir_

instance typeToSymTDir_ :: TypeToSym TDir_ "TDir_"

instance semigroupTDir_ :: Semigroup TDir_ where
  append _ _ = TDir_

instance monoidTDir_ :: Monoid TDir_ where
  mempty = TDir_

instance reifyTDir_ :: ReifyAU Dir_ TDir_ where
  reifyAU = const mempty
type Div_' =
  ( tag :: String
  , attributes :: Array (Attribute Div_)
  )
newtype Div_ = Div_ { | Div_' }
unsafeUnDiv_ :: Div_ -> { | Div_' }
unsafeUnDiv_ (Div_ unsafe) = unsafe

instance typeToSymDiv_ ::
  TypeToSym Div_ "div"

div
  :: forall children
   . Array (Attribute Div_)
  -> { | children }
  -> Element Div_ children
div = makeElt Div_ "div"

div'attr
  :: Array (Attribute Div_)
  -> Array (Attribute Div_)
div'attr = identity

data TDiv_ = TDiv_

instance typeToSymTDiv_ :: TypeToSym TDiv_ "TDiv_"

instance semigroupTDiv_ :: Semigroup TDiv_ where
  append _ _ = TDiv_

instance monoidTDiv_ :: Monoid TDiv_ where
  mempty = TDiv_

instance reifyTDiv_ :: ReifyAU Div_ TDiv_ where
  reifyAU = const mempty
type Dl_' =
  ( tag :: String
  , attributes :: Array (Attribute Dl_)
  )
newtype Dl_ = Dl_ { | Dl_' }
unsafeUnDl_ :: Dl_ -> { | Dl_' }
unsafeUnDl_ (Dl_ unsafe) = unsafe

instance typeToSymDl_ ::
  TypeToSym Dl_ "dl"

dl
  :: forall children
   . Array (Attribute Dl_)
  -> { | children }
  -> Element Dl_ children
dl = makeElt Dl_ "dl"

dl'attr
  :: Array (Attribute Dl_)
  -> Array (Attribute Dl_)
dl'attr = identity

data TDl_ = TDl_

instance typeToSymTDl_ :: TypeToSym TDl_ "TDl_"

instance semigroupTDl_ :: Semigroup TDl_ where
  append _ _ = TDl_

instance monoidTDl_ :: Monoid TDl_ where
  mempty = TDl_

instance reifyTDl_ :: ReifyAU Dl_ TDl_ where
  reifyAU = const mempty
type Dt_' =
  ( tag :: String
  , attributes :: Array (Attribute Dt_)
  )
newtype Dt_ = Dt_ { | Dt_' }
unsafeUnDt_ :: Dt_ -> { | Dt_' }
unsafeUnDt_ (Dt_ unsafe) = unsafe

instance typeToSymDt_ ::
  TypeToSym Dt_ "dt"

dt
  :: forall children
   . Array (Attribute Dt_)
  -> { | children }
  -> Element Dt_ children
dt = makeElt Dt_ "dt"

dt'attr
  :: Array (Attribute Dt_)
  -> Array (Attribute Dt_)
dt'attr = identity

data TDt_ = TDt_

instance typeToSymTDt_ :: TypeToSym TDt_ "TDt_"

instance semigroupTDt_ :: Semigroup TDt_ where
  append _ _ = TDt_

instance monoidTDt_ :: Monoid TDt_ where
  mempty = TDt_

instance reifyTDt_ :: ReifyAU Dt_ TDt_ where
  reifyAU = const mempty
type Em_' =
  ( tag :: String
  , attributes :: Array (Attribute Em_)
  )
newtype Em_ = Em_ { | Em_' }
unsafeUnEm_ :: Em_ -> { | Em_' }
unsafeUnEm_ (Em_ unsafe) = unsafe

instance typeToSymEm_ ::
  TypeToSym Em_ "em"

em
  :: forall children
   . Array (Attribute Em_)
  -> { | children }
  -> Element Em_ children
em = makeElt Em_ "em"

em'attr
  :: Array (Attribute Em_)
  -> Array (Attribute Em_)
em'attr = identity

data TEm_ = TEm_

instance typeToSymTEm_ :: TypeToSym TEm_ "TEm_"

instance semigroupTEm_ :: Semigroup TEm_ where
  append _ _ = TEm_

instance monoidTEm_ :: Monoid TEm_ where
  mempty = TEm_

instance reifyTEm_ :: ReifyAU Em_ TEm_ where
  reifyAU = const mempty
type Embed_' =
  ( tag :: String
  , attributes :: Array (Attribute Embed_)
  )
newtype Embed_ = Embed_ { | Embed_' }
unsafeUnEmbed_ :: Embed_ -> { | Embed_' }
unsafeUnEmbed_ (Embed_ unsafe) = unsafe

instance typeToSymEmbed_ ::
  TypeToSym Embed_ "embed"

embed
  :: forall children
   . Array (Attribute Embed_)
  -> { | children }
  -> Element Embed_ children
embed = makeElt Embed_ "embed"

embed'attr
  :: Array (Attribute Embed_)
  -> Array (Attribute Embed_)
embed'attr = identity

data TEmbed_ = TEmbed_

instance typeToSymTEmbed_ :: TypeToSym TEmbed_ "TEmbed_"

instance semigroupTEmbed_ :: Semigroup TEmbed_ where
  append _ _ = TEmbed_

instance monoidTEmbed_ :: Monoid TEmbed_ where
  mempty = TEmbed_

instance reifyTEmbed_ :: ReifyAU Embed_ TEmbed_ where
  reifyAU = const mempty
type Fieldset_' =
  ( tag :: String
  , attributes :: Array (Attribute Fieldset_)
  )
newtype Fieldset_ = Fieldset_ { | Fieldset_' }
unsafeUnFieldset_ :: Fieldset_ -> { | Fieldset_' }
unsafeUnFieldset_ (Fieldset_ unsafe) = unsafe

instance typeToSymFieldset_ ::
  TypeToSym Fieldset_ "fieldset"

fieldset
  :: forall children
   . Array (Attribute Fieldset_)
  -> { | children }
  -> Element Fieldset_ children
fieldset = makeElt Fieldset_ "fieldset"

fieldset'attr
  :: Array (Attribute Fieldset_)
  -> Array (Attribute Fieldset_)
fieldset'attr = identity

data TFieldset_ = TFieldset_

instance typeToSymTFieldset_ :: TypeToSym TFieldset_ "TFieldset_"

instance semigroupTFieldset_ :: Semigroup TFieldset_ where
  append _ _ = TFieldset_

instance monoidTFieldset_ :: Monoid TFieldset_ where
  mempty = TFieldset_

instance reifyTFieldset_ :: ReifyAU Fieldset_ TFieldset_ where
  reifyAU = const mempty
type Figcaption_' =
  ( tag :: String
  , attributes :: Array (Attribute Figcaption_)
  )
newtype Figcaption_ = Figcaption_ { | Figcaption_' }
unsafeUnFigcaption_ :: Figcaption_ -> { | Figcaption_' }
unsafeUnFigcaption_ (Figcaption_ unsafe) = unsafe

instance typeToSymFigcaption_ ::
  TypeToSym Figcaption_ "figcaption"

figcaption
  :: forall children
   . Array (Attribute Figcaption_)
  -> { | children }
  -> Element Figcaption_ children
figcaption = makeElt Figcaption_ "figcaption"

figcaption'attr
  :: Array (Attribute Figcaption_)
  -> Array (Attribute Figcaption_)
figcaption'attr = identity

data TFigcaption_ = TFigcaption_

instance typeToSymTFigcaption_ :: TypeToSym TFigcaption_ "TFigcaption_"

instance semigroupTFigcaption_ :: Semigroup TFigcaption_ where
  append _ _ = TFigcaption_

instance monoidTFigcaption_ :: Monoid TFigcaption_ where
  mempty = TFigcaption_

instance reifyTFigcaption_ :: ReifyAU Figcaption_ TFigcaption_ where
  reifyAU = const mempty
type Figure_' =
  ( tag :: String
  , attributes :: Array (Attribute Figure_)
  )
newtype Figure_ = Figure_ { | Figure_' }
unsafeUnFigure_ :: Figure_ -> { | Figure_' }
unsafeUnFigure_ (Figure_ unsafe) = unsafe

instance typeToSymFigure_ ::
  TypeToSym Figure_ "figure"

figure
  :: forall children
   . Array (Attribute Figure_)
  -> { | children }
  -> Element Figure_ children
figure = makeElt Figure_ "figure"

figure'attr
  :: Array (Attribute Figure_)
  -> Array (Attribute Figure_)
figure'attr = identity

data TFigure_ = TFigure_

instance typeToSymTFigure_ :: TypeToSym TFigure_ "TFigure_"

instance semigroupTFigure_ :: Semigroup TFigure_ where
  append _ _ = TFigure_

instance monoidTFigure_ :: Monoid TFigure_ where
  mempty = TFigure_

instance reifyTFigure_ :: ReifyAU Figure_ TFigure_ where
  reifyAU = const mempty
type Font_' =
  ( tag :: String
  , attributes :: Array (Attribute Font_)
  )
newtype Font_ = Font_ { | Font_' }
unsafeUnFont_ :: Font_ -> { | Font_' }
unsafeUnFont_ (Font_ unsafe) = unsafe

instance typeToSymFont_ ::
  TypeToSym Font_ "font"

font
  :: forall children
   . Array (Attribute Font_)
  -> { | children }
  -> Element Font_ children
font = makeElt Font_ "font"

font'attr
  :: Array (Attribute Font_)
  -> Array (Attribute Font_)
font'attr = identity

data TFont_ = TFont_

instance typeToSymTFont_ :: TypeToSym TFont_ "TFont_"

instance semigroupTFont_ :: Semigroup TFont_ where
  append _ _ = TFont_

instance monoidTFont_ :: Monoid TFont_ where
  mempty = TFont_

instance reifyTFont_ :: ReifyAU Font_ TFont_ where
  reifyAU = const mempty
type Footer_' =
  ( tag :: String
  , attributes :: Array (Attribute Footer_)
  )
newtype Footer_ = Footer_ { | Footer_' }
unsafeUnFooter_ :: Footer_ -> { | Footer_' }
unsafeUnFooter_ (Footer_ unsafe) = unsafe

instance typeToSymFooter_ ::
  TypeToSym Footer_ "footer"

footer
  :: forall children
   . Array (Attribute Footer_)
  -> { | children }
  -> Element Footer_ children
footer = makeElt Footer_ "footer"

footer'attr
  :: Array (Attribute Footer_)
  -> Array (Attribute Footer_)
footer'attr = identity

data TFooter_ = TFooter_

instance typeToSymTFooter_ :: TypeToSym TFooter_ "TFooter_"

instance semigroupTFooter_ :: Semigroup TFooter_ where
  append _ _ = TFooter_

instance monoidTFooter_ :: Monoid TFooter_ where
  mempty = TFooter_

instance reifyTFooter_ :: ReifyAU Footer_ TFooter_ where
  reifyAU = const mempty
type Form_' =
  ( tag :: String
  , attributes :: Array (Attribute Form_)
  )
newtype Form_ = Form_ { | Form_' }
unsafeUnForm_ :: Form_ -> { | Form_' }
unsafeUnForm_ (Form_ unsafe) = unsafe

instance typeToSymForm_ ::
  TypeToSym Form_ "form"

form
  :: forall children
   . Array (Attribute Form_)
  -> { | children }
  -> Element Form_ children
form = makeElt Form_ "form"

form'attr
  :: Array (Attribute Form_)
  -> Array (Attribute Form_)
form'attr = identity

data TForm_ = TForm_

instance typeToSymTForm_ :: TypeToSym TForm_ "TForm_"

instance semigroupTForm_ :: Semigroup TForm_ where
  append _ _ = TForm_

instance monoidTForm_ :: Monoid TForm_ where
  mempty = TForm_

instance reifyTForm_ :: ReifyAU Form_ TForm_ where
  reifyAU = const mempty
type Frame_' =
  ( tag :: String
  , attributes :: Array (Attribute Frame_)
  )
newtype Frame_ = Frame_ { | Frame_' }
unsafeUnFrame_ :: Frame_ -> { | Frame_' }
unsafeUnFrame_ (Frame_ unsafe) = unsafe

instance typeToSymFrame_ ::
  TypeToSym Frame_ "frame"

frame
  :: forall children
   . Array (Attribute Frame_)
  -> { | children }
  -> Element Frame_ children
frame = makeElt Frame_ "frame"

frame'attr
  :: Array (Attribute Frame_)
  -> Array (Attribute Frame_)
frame'attr = identity

data TFrame_ = TFrame_

instance typeToSymTFrame_ :: TypeToSym TFrame_ "TFrame_"

instance semigroupTFrame_ :: Semigroup TFrame_ where
  append _ _ = TFrame_

instance monoidTFrame_ :: Monoid TFrame_ where
  mempty = TFrame_

instance reifyTFrame_ :: ReifyAU Frame_ TFrame_ where
  reifyAU = const mempty
type Frameset_' =
  ( tag :: String
  , attributes :: Array (Attribute Frameset_)
  )
newtype Frameset_ = Frameset_ { | Frameset_' }
unsafeUnFrameset_ :: Frameset_ -> { | Frameset_' }
unsafeUnFrameset_ (Frameset_ unsafe) = unsafe

instance typeToSymFrameset_ ::
  TypeToSym Frameset_ "frameset"

frameset
  :: forall children
   . Array (Attribute Frameset_)
  -> { | children }
  -> Element Frameset_ children
frameset = makeElt Frameset_ "frameset"

frameset'attr
  :: Array (Attribute Frameset_)
  -> Array (Attribute Frameset_)
frameset'attr = identity

data TFrameset_ = TFrameset_

instance typeToSymTFrameset_ :: TypeToSym TFrameset_ "TFrameset_"

instance semigroupTFrameset_ :: Semigroup TFrameset_ where
  append _ _ = TFrameset_

instance monoidTFrameset_ :: Monoid TFrameset_ where
  mempty = TFrameset_

instance reifyTFrameset_ :: ReifyAU Frameset_ TFrameset_ where
  reifyAU = const mempty
type H1_' =
  ( tag :: String
  , attributes :: Array (Attribute H1_)
  )
newtype H1_ = H1_ { | H1_' }
unsafeUnH1_ :: H1_ -> { | H1_' }
unsafeUnH1_ (H1_ unsafe) = unsafe

instance typeToSymH1_ ::
  TypeToSym H1_ "h1"

h1
  :: forall children
   . Array (Attribute H1_)
  -> { | children }
  -> Element H1_ children
h1 = makeElt H1_ "h1"

h1'attr
  :: Array (Attribute H1_)
  -> Array (Attribute H1_)
h1'attr = identity

data TH1_ = TH1_

instance typeToSymTH1_ :: TypeToSym TH1_ "TH1_"

instance semigroupTH1_ :: Semigroup TH1_ where
  append _ _ = TH1_

instance monoidTH1_ :: Monoid TH1_ where
  mempty = TH1_

instance reifyTH1_ :: ReifyAU H1_ TH1_ where
  reifyAU = const mempty
type H2_' =
  ( tag :: String
  , attributes :: Array (Attribute H2_)
  )
newtype H2_ = H2_ { | H2_' }
unsafeUnH2_ :: H2_ -> { | H2_' }
unsafeUnH2_ (H2_ unsafe) = unsafe

instance typeToSymH2_ ::
  TypeToSym H2_ "h2"

h2
  :: forall children
   . Array (Attribute H2_)
  -> { | children }
  -> Element H2_ children
h2 = makeElt H2_ "h2"

h2'attr
  :: Array (Attribute H2_)
  -> Array (Attribute H2_)
h2'attr = identity

data TH2_ = TH2_

instance typeToSymTH2_ :: TypeToSym TH2_ "TH2_"

instance semigroupTH2_ :: Semigroup TH2_ where
  append _ _ = TH2_

instance monoidTH2_ :: Monoid TH2_ where
  mempty = TH2_

instance reifyTH2_ :: ReifyAU H2_ TH2_ where
  reifyAU = const mempty
type H3_' =
  ( tag :: String
  , attributes :: Array (Attribute H3_)
  )
newtype H3_ = H3_ { | H3_' }
unsafeUnH3_ :: H3_ -> { | H3_' }
unsafeUnH3_ (H3_ unsafe) = unsafe

instance typeToSymH3_ ::
  TypeToSym H3_ "h3"

h3
  :: forall children
   . Array (Attribute H3_)
  -> { | children }
  -> Element H3_ children
h3 = makeElt H3_ "h3"

h3'attr
  :: Array (Attribute H3_)
  -> Array (Attribute H3_)
h3'attr = identity

data TH3_ = TH3_

instance typeToSymTH3_ :: TypeToSym TH3_ "TH3_"

instance semigroupTH3_ :: Semigroup TH3_ where
  append _ _ = TH3_

instance monoidTH3_ :: Monoid TH3_ where
  mempty = TH3_

instance reifyTH3_ :: ReifyAU H3_ TH3_ where
  reifyAU = const mempty
type H4_' =
  ( tag :: String
  , attributes :: Array (Attribute H4_)
  )
newtype H4_ = H4_ { | H4_' }
unsafeUnH4_ :: H4_ -> { | H4_' }
unsafeUnH4_ (H4_ unsafe) = unsafe

instance typeToSymH4_ ::
  TypeToSym H4_ "h4"

h4
  :: forall children
   . Array (Attribute H4_)
  -> { | children }
  -> Element H4_ children
h4 = makeElt H4_ "h4"

h4'attr
  :: Array (Attribute H4_)
  -> Array (Attribute H4_)
h4'attr = identity

data TH4_ = TH4_

instance typeToSymTH4_ :: TypeToSym TH4_ "TH4_"

instance semigroupTH4_ :: Semigroup TH4_ where
  append _ _ = TH4_

instance monoidTH4_ :: Monoid TH4_ where
  mempty = TH4_

instance reifyTH4_ :: ReifyAU H4_ TH4_ where
  reifyAU = const mempty
type H5_' =
  ( tag :: String
  , attributes :: Array (Attribute H5_)
  )
newtype H5_ = H5_ { | H5_' }
unsafeUnH5_ :: H5_ -> { | H5_' }
unsafeUnH5_ (H5_ unsafe) = unsafe

instance typeToSymH5_ ::
  TypeToSym H5_ "h5"

h5
  :: forall children
   . Array (Attribute H5_)
  -> { | children }
  -> Element H5_ children
h5 = makeElt H5_ "h5"

h5'attr
  :: Array (Attribute H5_)
  -> Array (Attribute H5_)
h5'attr = identity

data TH5_ = TH5_

instance typeToSymTH5_ :: TypeToSym TH5_ "TH5_"

instance semigroupTH5_ :: Semigroup TH5_ where
  append _ _ = TH5_

instance monoidTH5_ :: Monoid TH5_ where
  mempty = TH5_

instance reifyTH5_ :: ReifyAU H5_ TH5_ where
  reifyAU = const mempty
type H6_' =
  ( tag :: String
  , attributes :: Array (Attribute H6_)
  )
newtype H6_ = H6_ { | H6_' }
unsafeUnH6_ :: H6_ -> { | H6_' }
unsafeUnH6_ (H6_ unsafe) = unsafe

instance typeToSymH6_ ::
  TypeToSym H6_ "h6"

h6
  :: forall children
   . Array (Attribute H6_)
  -> { | children }
  -> Element H6_ children
h6 = makeElt H6_ "h6"

h6'attr
  :: Array (Attribute H6_)
  -> Array (Attribute H6_)
h6'attr = identity

data TH6_ = TH6_

instance typeToSymTH6_ :: TypeToSym TH6_ "TH6_"

instance semigroupTH6_ :: Semigroup TH6_ where
  append _ _ = TH6_

instance monoidTH6_ :: Monoid TH6_ where
  mempty = TH6_

instance reifyTH6_ :: ReifyAU H6_ TH6_ where
  reifyAU = const mempty
type Head_' =
  ( tag :: String
  , attributes :: Array (Attribute Head_)
  )
newtype Head_ = Head_ { | Head_' }
unsafeUnHead_ :: Head_ -> { | Head_' }
unsafeUnHead_ (Head_ unsafe) = unsafe

instance typeToSymHead_ ::
  TypeToSym Head_ "head"

head
  :: forall children
   . Array (Attribute Head_)
  -> { | children }
  -> Element Head_ children
head = makeElt Head_ "head"

head'attr
  :: Array (Attribute Head_)
  -> Array (Attribute Head_)
head'attr = identity

data THead_ = THead_

instance typeToSymTHead_ :: TypeToSym THead_ "THead_"

instance semigroupTHead_ :: Semigroup THead_ where
  append _ _ = THead_

instance monoidTHead_ :: Monoid THead_ where
  mempty = THead_

instance reifyTHead_ :: ReifyAU Head_ THead_ where
  reifyAU = const mempty
type Header_' =
  ( tag :: String
  , attributes :: Array (Attribute Header_)
  )
newtype Header_ = Header_ { | Header_' }
unsafeUnHeader_ :: Header_ -> { | Header_' }
unsafeUnHeader_ (Header_ unsafe) = unsafe

instance typeToSymHeader_ ::
  TypeToSym Header_ "header"

header
  :: forall children
   . Array (Attribute Header_)
  -> { | children }
  -> Element Header_ children
header = makeElt Header_ "header"

header'attr
  :: Array (Attribute Header_)
  -> Array (Attribute Header_)
header'attr = identity

data THeader_ = THeader_

instance typeToSymTHeader_ :: TypeToSym THeader_ "THeader_"

instance semigroupTHeader_ :: Semigroup THeader_ where
  append _ _ = THeader_

instance monoidTHeader_ :: Monoid THeader_ where
  mempty = THeader_

instance reifyTHeader_ :: ReifyAU Header_ THeader_ where
  reifyAU = const mempty
type Hr_' =
  ( tag :: String
  , attributes :: Array (Attribute Hr_)
  )
newtype Hr_ = Hr_ { | Hr_' }
unsafeUnHr_ :: Hr_ -> { | Hr_' }
unsafeUnHr_ (Hr_ unsafe) = unsafe

instance typeToSymHr_ ::
  TypeToSym Hr_ "hr"

hr
  :: forall children
   . Array (Attribute Hr_)
  -> { | children }
  -> Element Hr_ children
hr = makeElt Hr_ "hr"

hr'attr
  :: Array (Attribute Hr_)
  -> Array (Attribute Hr_)
hr'attr = identity

data THr_ = THr_

instance typeToSymTHr_ :: TypeToSym THr_ "THr_"

instance semigroupTHr_ :: Semigroup THr_ where
  append _ _ = THr_

instance monoidTHr_ :: Monoid THr_ where
  mempty = THr_

instance reifyTHr_ :: ReifyAU Hr_ THr_ where
  reifyAU = const mempty
type Html_' =
  ( tag :: String
  , attributes :: Array (Attribute Html_)
  )
newtype Html_ = Html_ { | Html_' }
unsafeUnHtml_ :: Html_ -> { | Html_' }
unsafeUnHtml_ (Html_ unsafe) = unsafe

instance typeToSymHtml_ ::
  TypeToSym Html_ "html"

html
  :: forall children
   . Array (Attribute Html_)
  -> { | children }
  -> Element Html_ children
html = makeElt Html_ "html"

html'attr
  :: Array (Attribute Html_)
  -> Array (Attribute Html_)
html'attr = identity

data THtml_ = THtml_

instance typeToSymTHtml_ :: TypeToSym THtml_ "THtml_"

instance semigroupTHtml_ :: Semigroup THtml_ where
  append _ _ = THtml_

instance monoidTHtml_ :: Monoid THtml_ where
  mempty = THtml_

instance reifyTHtml_ :: ReifyAU Html_ THtml_ where
  reifyAU = const mempty
type I_' =
  ( tag :: String
  , attributes :: Array (Attribute I_)
  )
newtype I_ = I_ { | I_' }
unsafeUnI_ :: I_ -> { | I_' }
unsafeUnI_ (I_ unsafe) = unsafe

instance typeToSymI_ ::
  TypeToSym I_ "i"

i
  :: forall children
   . Array (Attribute I_)
  -> { | children }
  -> Element I_ children
i = makeElt I_ "i"

i'attr
  :: Array (Attribute I_)
  -> Array (Attribute I_)
i'attr = identity

data TI_ = TI_

instance typeToSymTI_ :: TypeToSym TI_ "TI_"

instance semigroupTI_ :: Semigroup TI_ where
  append _ _ = TI_

instance monoidTI_ :: Monoid TI_ where
  mempty = TI_

instance reifyTI_ :: ReifyAU I_ TI_ where
  reifyAU = const mempty
type Iframe_' =
  ( tag :: String
  , attributes :: Array (Attribute Iframe_)
  )
newtype Iframe_ = Iframe_ { | Iframe_' }
unsafeUnIframe_ :: Iframe_ -> { | Iframe_' }
unsafeUnIframe_ (Iframe_ unsafe) = unsafe

instance typeToSymIframe_ ::
  TypeToSym Iframe_ "iframe"

iframe
  :: forall children
   . Array (Attribute Iframe_)
  -> { | children }
  -> Element Iframe_ children
iframe = makeElt Iframe_ "iframe"

iframe'attr
  :: Array (Attribute Iframe_)
  -> Array (Attribute Iframe_)
iframe'attr = identity

data TIframe_ = TIframe_

instance typeToSymTIframe_ :: TypeToSym TIframe_ "TIframe_"

instance semigroupTIframe_ :: Semigroup TIframe_ where
  append _ _ = TIframe_

instance monoidTIframe_ :: Monoid TIframe_ where
  mempty = TIframe_

instance reifyTIframe_ :: ReifyAU Iframe_ TIframe_ where
  reifyAU = const mempty
type Img_' =
  ( tag :: String
  , attributes :: Array (Attribute Img_)
  )
newtype Img_ = Img_ { | Img_' }
unsafeUnImg_ :: Img_ -> { | Img_' }
unsafeUnImg_ (Img_ unsafe) = unsafe

instance typeToSymImg_ ::
  TypeToSym Img_ "img"

img
  :: forall children
   . Array (Attribute Img_)
  -> { | children }
  -> Element Img_ children
img = makeElt Img_ "img"

img'attr
  :: Array (Attribute Img_)
  -> Array (Attribute Img_)
img'attr = identity

data TImg_ = TImg_

instance typeToSymTImg_ :: TypeToSym TImg_ "TImg_"

instance semigroupTImg_ :: Semigroup TImg_ where
  append _ _ = TImg_

instance monoidTImg_ :: Monoid TImg_ where
  mempty = TImg_

instance reifyTImg_ :: ReifyAU Img_ TImg_ where
  reifyAU = const mempty
type Input_' =
  ( tag :: String
  , attributes :: Array (Attribute Input_)
  )
newtype Input_ = Input_ { | Input_' }
unsafeUnInput_ :: Input_ -> { | Input_' }
unsafeUnInput_ (Input_ unsafe) = unsafe

instance typeToSymInput_ ::
  TypeToSym Input_ "input"

input
  :: forall children
   . Array (Attribute Input_)
  -> { | children }
  -> Element Input_ children
input = makeElt Input_ "input"

input'attr
  :: Array (Attribute Input_)
  -> Array (Attribute Input_)
input'attr = identity

data TInput_ = TInput_

instance typeToSymTInput_ :: TypeToSym TInput_ "TInput_"

instance semigroupTInput_ :: Semigroup TInput_ where
  append _ _ = TInput_

instance monoidTInput_ :: Monoid TInput_ where
  mempty = TInput_

instance reifyTInput_ :: ReifyAU Input_ TInput_ where
  reifyAU = const mempty
type Ins_' =
  ( tag :: String
  , attributes :: Array (Attribute Ins_)
  )
newtype Ins_ = Ins_ { | Ins_' }
unsafeUnIns_ :: Ins_ -> { | Ins_' }
unsafeUnIns_ (Ins_ unsafe) = unsafe

instance typeToSymIns_ ::
  TypeToSym Ins_ "ins"

ins
  :: forall children
   . Array (Attribute Ins_)
  -> { | children }
  -> Element Ins_ children
ins = makeElt Ins_ "ins"

ins'attr
  :: Array (Attribute Ins_)
  -> Array (Attribute Ins_)
ins'attr = identity

data TIns_ = TIns_

instance typeToSymTIns_ :: TypeToSym TIns_ "TIns_"

instance semigroupTIns_ :: Semigroup TIns_ where
  append _ _ = TIns_

instance monoidTIns_ :: Monoid TIns_ where
  mempty = TIns_

instance reifyTIns_ :: ReifyAU Ins_ TIns_ where
  reifyAU = const mempty
type Kbd_' =
  ( tag :: String
  , attributes :: Array (Attribute Kbd_)
  )
newtype Kbd_ = Kbd_ { | Kbd_' }
unsafeUnKbd_ :: Kbd_ -> { | Kbd_' }
unsafeUnKbd_ (Kbd_ unsafe) = unsafe

instance typeToSymKbd_ ::
  TypeToSym Kbd_ "kbd"

kbd
  :: forall children
   . Array (Attribute Kbd_)
  -> { | children }
  -> Element Kbd_ children
kbd = makeElt Kbd_ "kbd"

kbd'attr
  :: Array (Attribute Kbd_)
  -> Array (Attribute Kbd_)
kbd'attr = identity

data TKbd_ = TKbd_

instance typeToSymTKbd_ :: TypeToSym TKbd_ "TKbd_"

instance semigroupTKbd_ :: Semigroup TKbd_ where
  append _ _ = TKbd_

instance monoidTKbd_ :: Monoid TKbd_ where
  mempty = TKbd_

instance reifyTKbd_ :: ReifyAU Kbd_ TKbd_ where
  reifyAU = const mempty
type Label_' =
  ( tag :: String
  , attributes :: Array (Attribute Label_)
  )
newtype Label_ = Label_ { | Label_' }
unsafeUnLabel_ :: Label_ -> { | Label_' }
unsafeUnLabel_ (Label_ unsafe) = unsafe

instance typeToSymLabel_ ::
  TypeToSym Label_ "label"

label
  :: forall children
   . Array (Attribute Label_)
  -> { | children }
  -> Element Label_ children
label = makeElt Label_ "label"

label'attr
  :: Array (Attribute Label_)
  -> Array (Attribute Label_)
label'attr = identity

data TLabel_ = TLabel_

instance typeToSymTLabel_ :: TypeToSym TLabel_ "TLabel_"

instance semigroupTLabel_ :: Semigroup TLabel_ where
  append _ _ = TLabel_

instance monoidTLabel_ :: Monoid TLabel_ where
  mempty = TLabel_

instance reifyTLabel_ :: ReifyAU Label_ TLabel_ where
  reifyAU = const mempty
type Legend_' =
  ( tag :: String
  , attributes :: Array (Attribute Legend_)
  )
newtype Legend_ = Legend_ { | Legend_' }
unsafeUnLegend_ :: Legend_ -> { | Legend_' }
unsafeUnLegend_ (Legend_ unsafe) = unsafe

instance typeToSymLegend_ ::
  TypeToSym Legend_ "legend"

legend
  :: forall children
   . Array (Attribute Legend_)
  -> { | children }
  -> Element Legend_ children
legend = makeElt Legend_ "legend"

legend'attr
  :: Array (Attribute Legend_)
  -> Array (Attribute Legend_)
legend'attr = identity

data TLegend_ = TLegend_

instance typeToSymTLegend_ :: TypeToSym TLegend_ "TLegend_"

instance semigroupTLegend_ :: Semigroup TLegend_ where
  append _ _ = TLegend_

instance monoidTLegend_ :: Monoid TLegend_ where
  mempty = TLegend_

instance reifyTLegend_ :: ReifyAU Legend_ TLegend_ where
  reifyAU = const mempty
type Li_' =
  ( tag :: String
  , attributes :: Array (Attribute Li_)
  )
newtype Li_ = Li_ { | Li_' }
unsafeUnLi_ :: Li_ -> { | Li_' }
unsafeUnLi_ (Li_ unsafe) = unsafe

instance typeToSymLi_ ::
  TypeToSym Li_ "li"

li
  :: forall children
   . Array (Attribute Li_)
  -> { | children }
  -> Element Li_ children
li = makeElt Li_ "li"

li'attr
  :: Array (Attribute Li_)
  -> Array (Attribute Li_)
li'attr = identity

data TLi_ = TLi_

instance typeToSymTLi_ :: TypeToSym TLi_ "TLi_"

instance semigroupTLi_ :: Semigroup TLi_ where
  append _ _ = TLi_

instance monoidTLi_ :: Monoid TLi_ where
  mempty = TLi_

instance reifyTLi_ :: ReifyAU Li_ TLi_ where
  reifyAU = const mempty
type Link_' =
  ( tag :: String
  , attributes :: Array (Attribute Link_)
  )
newtype Link_ = Link_ { | Link_' }
unsafeUnLink_ :: Link_ -> { | Link_' }
unsafeUnLink_ (Link_ unsafe) = unsafe

instance typeToSymLink_ ::
  TypeToSym Link_ "link"

link
  :: forall children
   . Array (Attribute Link_)
  -> { | children }
  -> Element Link_ children
link = makeElt Link_ "link"

link'attr
  :: Array (Attribute Link_)
  -> Array (Attribute Link_)
link'attr = identity

data TLink_ = TLink_

instance typeToSymTLink_ :: TypeToSym TLink_ "TLink_"

instance semigroupTLink_ :: Semigroup TLink_ where
  append _ _ = TLink_

instance monoidTLink_ :: Monoid TLink_ where
  mempty = TLink_

instance reifyTLink_ :: ReifyAU Link_ TLink_ where
  reifyAU = const mempty
type Main_' =
  ( tag :: String
  , attributes :: Array (Attribute Main_)
  )
newtype Main_ = Main_ { | Main_' }
unsafeUnMain_ :: Main_ -> { | Main_' }
unsafeUnMain_ (Main_ unsafe) = unsafe

instance typeToSymMain_ ::
  TypeToSym Main_ "main"

main
  :: forall children
   . Array (Attribute Main_)
  -> { | children }
  -> Element Main_ children
main = makeElt Main_ "main"

main'attr
  :: Array (Attribute Main_)
  -> Array (Attribute Main_)
main'attr = identity

data TMain_ = TMain_

instance typeToSymTMain_ :: TypeToSym TMain_ "TMain_"

instance semigroupTMain_ :: Semigroup TMain_ where
  append _ _ = TMain_

instance monoidTMain_ :: Monoid TMain_ where
  mempty = TMain_

instance reifyTMain_ :: ReifyAU Main_ TMain_ where
  reifyAU = const mempty
type Map_' =
  ( tag :: String
  , attributes :: Array (Attribute Map_)
  )
newtype Map_ = Map_ { | Map_' }
unsafeUnMap_ :: Map_ -> { | Map_' }
unsafeUnMap_ (Map_ unsafe) = unsafe

instance typeToSymMap_ ::
  TypeToSym Map_ "map"

map
  :: forall children
   . Array (Attribute Map_)
  -> { | children }
  -> Element Map_ children
map = makeElt Map_ "map"

map'attr
  :: Array (Attribute Map_)
  -> Array (Attribute Map_)
map'attr = identity

data TMap_ = TMap_

instance typeToSymTMap_ :: TypeToSym TMap_ "TMap_"

instance semigroupTMap_ :: Semigroup TMap_ where
  append _ _ = TMap_

instance monoidTMap_ :: Monoid TMap_ where
  mempty = TMap_

instance reifyTMap_ :: ReifyAU Map_ TMap_ where
  reifyAU = const mempty
type Mark_' =
  ( tag :: String
  , attributes :: Array (Attribute Mark_)
  )
newtype Mark_ = Mark_ { | Mark_' }
unsafeUnMark_ :: Mark_ -> { | Mark_' }
unsafeUnMark_ (Mark_ unsafe) = unsafe

instance typeToSymMark_ ::
  TypeToSym Mark_ "mark"

mark
  :: forall children
   . Array (Attribute Mark_)
  -> { | children }
  -> Element Mark_ children
mark = makeElt Mark_ "mark"

mark'attr
  :: Array (Attribute Mark_)
  -> Array (Attribute Mark_)
mark'attr = identity

data TMark_ = TMark_

instance typeToSymTMark_ :: TypeToSym TMark_ "TMark_"

instance semigroupTMark_ :: Semigroup TMark_ where
  append _ _ = TMark_

instance monoidTMark_ :: Monoid TMark_ where
  mempty = TMark_

instance reifyTMark_ :: ReifyAU Mark_ TMark_ where
  reifyAU = const mempty
type Meta_' =
  ( tag :: String
  , attributes :: Array (Attribute Meta_)
  )
newtype Meta_ = Meta_ { | Meta_' }
unsafeUnMeta_ :: Meta_ -> { | Meta_' }
unsafeUnMeta_ (Meta_ unsafe) = unsafe

instance typeToSymMeta_ ::
  TypeToSym Meta_ "meta"

meta
  :: forall children
   . Array (Attribute Meta_)
  -> { | children }
  -> Element Meta_ children
meta = makeElt Meta_ "meta"

meta'attr
  :: Array (Attribute Meta_)
  -> Array (Attribute Meta_)
meta'attr = identity

data TMeta_ = TMeta_

instance typeToSymTMeta_ :: TypeToSym TMeta_ "TMeta_"

instance semigroupTMeta_ :: Semigroup TMeta_ where
  append _ _ = TMeta_

instance monoidTMeta_ :: Monoid TMeta_ where
  mempty = TMeta_

instance reifyTMeta_ :: ReifyAU Meta_ TMeta_ where
  reifyAU = const mempty
type Meter_' =
  ( tag :: String
  , attributes :: Array (Attribute Meter_)
  )
newtype Meter_ = Meter_ { | Meter_' }
unsafeUnMeter_ :: Meter_ -> { | Meter_' }
unsafeUnMeter_ (Meter_ unsafe) = unsafe

instance typeToSymMeter_ ::
  TypeToSym Meter_ "meter"

meter
  :: forall children
   . Array (Attribute Meter_)
  -> { | children }
  -> Element Meter_ children
meter = makeElt Meter_ "meter"

meter'attr
  :: Array (Attribute Meter_)
  -> Array (Attribute Meter_)
meter'attr = identity

data TMeter_ = TMeter_

instance typeToSymTMeter_ :: TypeToSym TMeter_ "TMeter_"

instance semigroupTMeter_ :: Semigroup TMeter_ where
  append _ _ = TMeter_

instance monoidTMeter_ :: Monoid TMeter_ where
  mempty = TMeter_

instance reifyTMeter_ :: ReifyAU Meter_ TMeter_ where
  reifyAU = const mempty
type Nav_' =
  ( tag :: String
  , attributes :: Array (Attribute Nav_)
  )
newtype Nav_ = Nav_ { | Nav_' }
unsafeUnNav_ :: Nav_ -> { | Nav_' }
unsafeUnNav_ (Nav_ unsafe) = unsafe

instance typeToSymNav_ ::
  TypeToSym Nav_ "nav"

nav
  :: forall children
   . Array (Attribute Nav_)
  -> { | children }
  -> Element Nav_ children
nav = makeElt Nav_ "nav"

nav'attr
  :: Array (Attribute Nav_)
  -> Array (Attribute Nav_)
nav'attr = identity

data TNav_ = TNav_

instance typeToSymTNav_ :: TypeToSym TNav_ "TNav_"

instance semigroupTNav_ :: Semigroup TNav_ where
  append _ _ = TNav_

instance monoidTNav_ :: Monoid TNav_ where
  mempty = TNav_

instance reifyTNav_ :: ReifyAU Nav_ TNav_ where
  reifyAU = const mempty
type Noframes_' =
  ( tag :: String
  , attributes :: Array (Attribute Noframes_)
  )
newtype Noframes_ = Noframes_ { | Noframes_' }
unsafeUnNoframes_ :: Noframes_ -> { | Noframes_' }
unsafeUnNoframes_ (Noframes_ unsafe) = unsafe

instance typeToSymNoframes_ ::
  TypeToSym Noframes_ "noframes"

noframes
  :: forall children
   . Array (Attribute Noframes_)
  -> { | children }
  -> Element Noframes_ children
noframes = makeElt Noframes_ "noframes"

noframes'attr
  :: Array (Attribute Noframes_)
  -> Array (Attribute Noframes_)
noframes'attr = identity

data TNoframes_ = TNoframes_

instance typeToSymTNoframes_ :: TypeToSym TNoframes_ "TNoframes_"

instance semigroupTNoframes_ :: Semigroup TNoframes_ where
  append _ _ = TNoframes_

instance monoidTNoframes_ :: Monoid TNoframes_ where
  mempty = TNoframes_

instance reifyTNoframes_ :: ReifyAU Noframes_ TNoframes_ where
  reifyAU = const mempty
type Noscript_' =
  ( tag :: String
  , attributes :: Array (Attribute Noscript_)
  )
newtype Noscript_ = Noscript_ { | Noscript_' }
unsafeUnNoscript_ :: Noscript_ -> { | Noscript_' }
unsafeUnNoscript_ (Noscript_ unsafe) = unsafe

instance typeToSymNoscript_ ::
  TypeToSym Noscript_ "noscript"

noscript
  :: forall children
   . Array (Attribute Noscript_)
  -> { | children }
  -> Element Noscript_ children
noscript = makeElt Noscript_ "noscript"

noscript'attr
  :: Array (Attribute Noscript_)
  -> Array (Attribute Noscript_)
noscript'attr = identity

data TNoscript_ = TNoscript_

instance typeToSymTNoscript_ :: TypeToSym TNoscript_ "TNoscript_"

instance semigroupTNoscript_ :: Semigroup TNoscript_ where
  append _ _ = TNoscript_

instance monoidTNoscript_ :: Monoid TNoscript_ where
  mempty = TNoscript_

instance reifyTNoscript_ :: ReifyAU Noscript_ TNoscript_ where
  reifyAU = const mempty
type Object_' =
  ( tag :: String
  , attributes :: Array (Attribute Object_)
  )
newtype Object_ = Object_ { | Object_' }
unsafeUnObject_ :: Object_ -> { | Object_' }
unsafeUnObject_ (Object_ unsafe) = unsafe

instance typeToSymObject_ ::
  TypeToSym Object_ "object"

object
  :: forall children
   . Array (Attribute Object_)
  -> { | children }
  -> Element Object_ children
object = makeElt Object_ "object"

object'attr
  :: Array (Attribute Object_)
  -> Array (Attribute Object_)
object'attr = identity

data TObject_ = TObject_

instance typeToSymTObject_ :: TypeToSym TObject_ "TObject_"

instance semigroupTObject_ :: Semigroup TObject_ where
  append _ _ = TObject_

instance monoidTObject_ :: Monoid TObject_ where
  mempty = TObject_

instance reifyTObject_ :: ReifyAU Object_ TObject_ where
  reifyAU = const mempty
type Ol_' =
  ( tag :: String
  , attributes :: Array (Attribute Ol_)
  )
newtype Ol_ = Ol_ { | Ol_' }
unsafeUnOl_ :: Ol_ -> { | Ol_' }
unsafeUnOl_ (Ol_ unsafe) = unsafe

instance typeToSymOl_ ::
  TypeToSym Ol_ "ol"

ol
  :: forall children
   . Array (Attribute Ol_)
  -> { | children }
  -> Element Ol_ children
ol = makeElt Ol_ "ol"

ol'attr
  :: Array (Attribute Ol_)
  -> Array (Attribute Ol_)
ol'attr = identity

data TOl_ = TOl_

instance typeToSymTOl_ :: TypeToSym TOl_ "TOl_"

instance semigroupTOl_ :: Semigroup TOl_ where
  append _ _ = TOl_

instance monoidTOl_ :: Monoid TOl_ where
  mempty = TOl_

instance reifyTOl_ :: ReifyAU Ol_ TOl_ where
  reifyAU = const mempty
type Optgroup_' =
  ( tag :: String
  , attributes :: Array (Attribute Optgroup_)
  )
newtype Optgroup_ = Optgroup_ { | Optgroup_' }
unsafeUnOptgroup_ :: Optgroup_ -> { | Optgroup_' }
unsafeUnOptgroup_ (Optgroup_ unsafe) = unsafe

instance typeToSymOptgroup_ ::
  TypeToSym Optgroup_ "optgroup"

optgroup
  :: forall children
   . Array (Attribute Optgroup_)
  -> { | children }
  -> Element Optgroup_ children
optgroup = makeElt Optgroup_ "optgroup"

optgroup'attr
  :: Array (Attribute Optgroup_)
  -> Array (Attribute Optgroup_)
optgroup'attr = identity

data TOptgroup_ = TOptgroup_

instance typeToSymTOptgroup_ :: TypeToSym TOptgroup_ "TOptgroup_"

instance semigroupTOptgroup_ :: Semigroup TOptgroup_ where
  append _ _ = TOptgroup_

instance monoidTOptgroup_ :: Monoid TOptgroup_ where
  mempty = TOptgroup_

instance reifyTOptgroup_ :: ReifyAU Optgroup_ TOptgroup_ where
  reifyAU = const mempty
type Option_' =
  ( tag :: String
  , attributes :: Array (Attribute Option_)
  )
newtype Option_ = Option_ { | Option_' }
unsafeUnOption_ :: Option_ -> { | Option_' }
unsafeUnOption_ (Option_ unsafe) = unsafe

instance typeToSymOption_ ::
  TypeToSym Option_ "option"

option
  :: forall children
   . Array (Attribute Option_)
  -> { | children }
  -> Element Option_ children
option = makeElt Option_ "option"

option'attr
  :: Array (Attribute Option_)
  -> Array (Attribute Option_)
option'attr = identity

data TOption_ = TOption_

instance typeToSymTOption_ :: TypeToSym TOption_ "TOption_"

instance semigroupTOption_ :: Semigroup TOption_ where
  append _ _ = TOption_

instance monoidTOption_ :: Monoid TOption_ where
  mempty = TOption_

instance reifyTOption_ :: ReifyAU Option_ TOption_ where
  reifyAU = const mempty
type Output_' =
  ( tag :: String
  , attributes :: Array (Attribute Output_)
  )
newtype Output_ = Output_ { | Output_' }
unsafeUnOutput_ :: Output_ -> { | Output_' }
unsafeUnOutput_ (Output_ unsafe) = unsafe

instance typeToSymOutput_ ::
  TypeToSym Output_ "output"

output
  :: forall children
   . Array (Attribute Output_)
  -> { | children }
  -> Element Output_ children
output = makeElt Output_ "output"

output'attr
  :: Array (Attribute Output_)
  -> Array (Attribute Output_)
output'attr = identity

data TOutput_ = TOutput_

instance typeToSymTOutput_ :: TypeToSym TOutput_ "TOutput_"

instance semigroupTOutput_ :: Semigroup TOutput_ where
  append _ _ = TOutput_

instance monoidTOutput_ :: Monoid TOutput_ where
  mempty = TOutput_

instance reifyTOutput_ :: ReifyAU Output_ TOutput_ where
  reifyAU = const mempty
type P_' =
  ( tag :: String
  , attributes :: Array (Attribute P_)
  )
newtype P_ = P_ { | P_' }
unsafeUnP_ :: P_ -> { | P_' }
unsafeUnP_ (P_ unsafe) = unsafe

instance typeToSymP_ ::
  TypeToSym P_ "p"

p
  :: forall children
   . Array (Attribute P_)
  -> { | children }
  -> Element P_ children
p = makeElt P_ "p"

p'attr
  :: Array (Attribute P_)
  -> Array (Attribute P_)
p'attr = identity

data TP_ = TP_

instance typeToSymTP_ :: TypeToSym TP_ "TP_"

instance semigroupTP_ :: Semigroup TP_ where
  append _ _ = TP_

instance monoidTP_ :: Monoid TP_ where
  mempty = TP_

instance reifyTP_ :: ReifyAU P_ TP_ where
  reifyAU = const mempty
type Param_' =
  ( tag :: String
  , attributes :: Array (Attribute Param_)
  )
newtype Param_ = Param_ { | Param_' }
unsafeUnParam_ :: Param_ -> { | Param_' }
unsafeUnParam_ (Param_ unsafe) = unsafe

instance typeToSymParam_ ::
  TypeToSym Param_ "param"

param
  :: forall children
   . Array (Attribute Param_)
  -> { | children }
  -> Element Param_ children
param = makeElt Param_ "param"

param'attr
  :: Array (Attribute Param_)
  -> Array (Attribute Param_)
param'attr = identity

data TParam_ = TParam_

instance typeToSymTParam_ :: TypeToSym TParam_ "TParam_"

instance semigroupTParam_ :: Semigroup TParam_ where
  append _ _ = TParam_

instance monoidTParam_ :: Monoid TParam_ where
  mempty = TParam_

instance reifyTParam_ :: ReifyAU Param_ TParam_ where
  reifyAU = const mempty
type Picture_' =
  ( tag :: String
  , attributes :: Array (Attribute Picture_)
  )
newtype Picture_ = Picture_ { | Picture_' }
unsafeUnPicture_ :: Picture_ -> { | Picture_' }
unsafeUnPicture_ (Picture_ unsafe) = unsafe

instance typeToSymPicture_ ::
  TypeToSym Picture_ "picture"

picture
  :: forall children
   . Array (Attribute Picture_)
  -> { | children }
  -> Element Picture_ children
picture = makeElt Picture_ "picture"

picture'attr
  :: Array (Attribute Picture_)
  -> Array (Attribute Picture_)
picture'attr = identity

data TPicture_ = TPicture_

instance typeToSymTPicture_ :: TypeToSym TPicture_ "TPicture_"

instance semigroupTPicture_ :: Semigroup TPicture_ where
  append _ _ = TPicture_

instance monoidTPicture_ :: Monoid TPicture_ where
  mempty = TPicture_

instance reifyTPicture_ :: ReifyAU Picture_ TPicture_ where
  reifyAU = const mempty
type Pre_' =
  ( tag :: String
  , attributes :: Array (Attribute Pre_)
  )
newtype Pre_ = Pre_ { | Pre_' }
unsafeUnPre_ :: Pre_ -> { | Pre_' }
unsafeUnPre_ (Pre_ unsafe) = unsafe

instance typeToSymPre_ ::
  TypeToSym Pre_ "pre"

pre
  :: forall children
   . Array (Attribute Pre_)
  -> { | children }
  -> Element Pre_ children
pre = makeElt Pre_ "pre"

pre'attr
  :: Array (Attribute Pre_)
  -> Array (Attribute Pre_)
pre'attr = identity

data TPre_ = TPre_

instance typeToSymTPre_ :: TypeToSym TPre_ "TPre_"

instance semigroupTPre_ :: Semigroup TPre_ where
  append _ _ = TPre_

instance monoidTPre_ :: Monoid TPre_ where
  mempty = TPre_

instance reifyTPre_ :: ReifyAU Pre_ TPre_ where
  reifyAU = const mempty
type Progress_' =
  ( tag :: String
  , attributes :: Array (Attribute Progress_)
  )
newtype Progress_ = Progress_ { | Progress_' }
unsafeUnProgress_ :: Progress_ -> { | Progress_' }
unsafeUnProgress_ (Progress_ unsafe) = unsafe

instance typeToSymProgress_ ::
  TypeToSym Progress_ "progress"

progress
  :: forall children
   . Array (Attribute Progress_)
  -> { | children }
  -> Element Progress_ children
progress = makeElt Progress_ "progress"

progress'attr
  :: Array (Attribute Progress_)
  -> Array (Attribute Progress_)
progress'attr = identity

data TProgress_ = TProgress_

instance typeToSymTProgress_ :: TypeToSym TProgress_ "TProgress_"

instance semigroupTProgress_ :: Semigroup TProgress_ where
  append _ _ = TProgress_

instance monoidTProgress_ :: Monoid TProgress_ where
  mempty = TProgress_

instance reifyTProgress_ :: ReifyAU Progress_ TProgress_ where
  reifyAU = const mempty
type Q_' =
  ( tag :: String
  , attributes :: Array (Attribute Q_)
  )
newtype Q_ = Q_ { | Q_' }
unsafeUnQ_ :: Q_ -> { | Q_' }
unsafeUnQ_ (Q_ unsafe) = unsafe

instance typeToSymQ_ ::
  TypeToSym Q_ "q"

q
  :: forall children
   . Array (Attribute Q_)
  -> { | children }
  -> Element Q_ children
q = makeElt Q_ "q"

q'attr
  :: Array (Attribute Q_)
  -> Array (Attribute Q_)
q'attr = identity

data TQ_ = TQ_

instance typeToSymTQ_ :: TypeToSym TQ_ "TQ_"

instance semigroupTQ_ :: Semigroup TQ_ where
  append _ _ = TQ_

instance monoidTQ_ :: Monoid TQ_ where
  mempty = TQ_

instance reifyTQ_ :: ReifyAU Q_ TQ_ where
  reifyAU = const mempty
type Rp_' =
  ( tag :: String
  , attributes :: Array (Attribute Rp_)
  )
newtype Rp_ = Rp_ { | Rp_' }
unsafeUnRp_ :: Rp_ -> { | Rp_' }
unsafeUnRp_ (Rp_ unsafe) = unsafe

instance typeToSymRp_ ::
  TypeToSym Rp_ "rp"

rp
  :: forall children
   . Array (Attribute Rp_)
  -> { | children }
  -> Element Rp_ children
rp = makeElt Rp_ "rp"

rp'attr
  :: Array (Attribute Rp_)
  -> Array (Attribute Rp_)
rp'attr = identity

data TRp_ = TRp_

instance typeToSymTRp_ :: TypeToSym TRp_ "TRp_"

instance semigroupTRp_ :: Semigroup TRp_ where
  append _ _ = TRp_

instance monoidTRp_ :: Monoid TRp_ where
  mempty = TRp_

instance reifyTRp_ :: ReifyAU Rp_ TRp_ where
  reifyAU = const mempty
type Rt_' =
  ( tag :: String
  , attributes :: Array (Attribute Rt_)
  )
newtype Rt_ = Rt_ { | Rt_' }
unsafeUnRt_ :: Rt_ -> { | Rt_' }
unsafeUnRt_ (Rt_ unsafe) = unsafe

instance typeToSymRt_ ::
  TypeToSym Rt_ "rt"

rt
  :: forall children
   . Array (Attribute Rt_)
  -> { | children }
  -> Element Rt_ children
rt = makeElt Rt_ "rt"

rt'attr
  :: Array (Attribute Rt_)
  -> Array (Attribute Rt_)
rt'attr = identity

data TRt_ = TRt_

instance typeToSymTRt_ :: TypeToSym TRt_ "TRt_"

instance semigroupTRt_ :: Semigroup TRt_ where
  append _ _ = TRt_

instance monoidTRt_ :: Monoid TRt_ where
  mempty = TRt_

instance reifyTRt_ :: ReifyAU Rt_ TRt_ where
  reifyAU = const mempty
type Ruby_' =
  ( tag :: String
  , attributes :: Array (Attribute Ruby_)
  )
newtype Ruby_ = Ruby_ { | Ruby_' }
unsafeUnRuby_ :: Ruby_ -> { | Ruby_' }
unsafeUnRuby_ (Ruby_ unsafe) = unsafe

instance typeToSymRuby_ ::
  TypeToSym Ruby_ "ruby"

ruby
  :: forall children
   . Array (Attribute Ruby_)
  -> { | children }
  -> Element Ruby_ children
ruby = makeElt Ruby_ "ruby"

ruby'attr
  :: Array (Attribute Ruby_)
  -> Array (Attribute Ruby_)
ruby'attr = identity

data TRuby_ = TRuby_

instance typeToSymTRuby_ :: TypeToSym TRuby_ "TRuby_"

instance semigroupTRuby_ :: Semigroup TRuby_ where
  append _ _ = TRuby_

instance monoidTRuby_ :: Monoid TRuby_ where
  mempty = TRuby_

instance reifyTRuby_ :: ReifyAU Ruby_ TRuby_ where
  reifyAU = const mempty
type S_' =
  ( tag :: String
  , attributes :: Array (Attribute S_)
  )
newtype S_ = S_ { | S_' }
unsafeUnS_ :: S_ -> { | S_' }
unsafeUnS_ (S_ unsafe) = unsafe

instance typeToSymS_ ::
  TypeToSym S_ "s"

s
  :: forall children
   . Array (Attribute S_)
  -> { | children }
  -> Element S_ children
s = makeElt S_ "s"

s'attr
  :: Array (Attribute S_)
  -> Array (Attribute S_)
s'attr = identity

data TS_ = TS_

instance typeToSymTS_ :: TypeToSym TS_ "TS_"

instance semigroupTS_ :: Semigroup TS_ where
  append _ _ = TS_

instance monoidTS_ :: Monoid TS_ where
  mempty = TS_

instance reifyTS_ :: ReifyAU S_ TS_ where
  reifyAU = const mempty
type Samp_' =
  ( tag :: String
  , attributes :: Array (Attribute Samp_)
  )
newtype Samp_ = Samp_ { | Samp_' }
unsafeUnSamp_ :: Samp_ -> { | Samp_' }
unsafeUnSamp_ (Samp_ unsafe) = unsafe

instance typeToSymSamp_ ::
  TypeToSym Samp_ "samp"

samp
  :: forall children
   . Array (Attribute Samp_)
  -> { | children }
  -> Element Samp_ children
samp = makeElt Samp_ "samp"

samp'attr
  :: Array (Attribute Samp_)
  -> Array (Attribute Samp_)
samp'attr = identity

data TSamp_ = TSamp_

instance typeToSymTSamp_ :: TypeToSym TSamp_ "TSamp_"

instance semigroupTSamp_ :: Semigroup TSamp_ where
  append _ _ = TSamp_

instance monoidTSamp_ :: Monoid TSamp_ where
  mempty = TSamp_

instance reifyTSamp_ :: ReifyAU Samp_ TSamp_ where
  reifyAU = const mempty
type Script_' =
  ( tag :: String
  , attributes :: Array (Attribute Script_)
  )
newtype Script_ = Script_ { | Script_' }
unsafeUnScript_ :: Script_ -> { | Script_' }
unsafeUnScript_ (Script_ unsafe) = unsafe

instance typeToSymScript_ ::
  TypeToSym Script_ "script"

script
  :: forall children
   . Array (Attribute Script_)
  -> { | children }
  -> Element Script_ children
script = makeElt Script_ "script"

script'attr
  :: Array (Attribute Script_)
  -> Array (Attribute Script_)
script'attr = identity

data TScript_ = TScript_

instance typeToSymTScript_ :: TypeToSym TScript_ "TScript_"

instance semigroupTScript_ :: Semigroup TScript_ where
  append _ _ = TScript_

instance monoidTScript_ :: Monoid TScript_ where
  mempty = TScript_

instance reifyTScript_ :: ReifyAU Script_ TScript_ where
  reifyAU = const mempty
type Section_' =
  ( tag :: String
  , attributes :: Array (Attribute Section_)
  )
newtype Section_ = Section_ { | Section_' }
unsafeUnSection_ :: Section_ -> { | Section_' }
unsafeUnSection_ (Section_ unsafe) = unsafe

instance typeToSymSection_ ::
  TypeToSym Section_ "section"

section
  :: forall children
   . Array (Attribute Section_)
  -> { | children }
  -> Element Section_ children
section = makeElt Section_ "section"

section'attr
  :: Array (Attribute Section_)
  -> Array (Attribute Section_)
section'attr = identity

data TSection_ = TSection_

instance typeToSymTSection_ :: TypeToSym TSection_ "TSection_"

instance semigroupTSection_ :: Semigroup TSection_ where
  append _ _ = TSection_

instance monoidTSection_ :: Monoid TSection_ where
  mempty = TSection_

instance reifyTSection_ :: ReifyAU Section_ TSection_ where
  reifyAU = const mempty
type Select_' =
  ( tag :: String
  , attributes :: Array (Attribute Select_)
  )
newtype Select_ = Select_ { | Select_' }
unsafeUnSelect_ :: Select_ -> { | Select_' }
unsafeUnSelect_ (Select_ unsafe) = unsafe

instance typeToSymSelect_ ::
  TypeToSym Select_ "select"

select
  :: forall children
   . Array (Attribute Select_)
  -> { | children }
  -> Element Select_ children
select = makeElt Select_ "select"

select'attr
  :: Array (Attribute Select_)
  -> Array (Attribute Select_)
select'attr = identity

data TSelect_ = TSelect_

instance typeToSymTSelect_ :: TypeToSym TSelect_ "TSelect_"

instance semigroupTSelect_ :: Semigroup TSelect_ where
  append _ _ = TSelect_

instance monoidTSelect_ :: Monoid TSelect_ where
  mempty = TSelect_

instance reifyTSelect_ :: ReifyAU Select_ TSelect_ where
  reifyAU = const mempty
type Small_' =
  ( tag :: String
  , attributes :: Array (Attribute Small_)
  )
newtype Small_ = Small_ { | Small_' }
unsafeUnSmall_ :: Small_ -> { | Small_' }
unsafeUnSmall_ (Small_ unsafe) = unsafe

instance typeToSymSmall_ ::
  TypeToSym Small_ "small"

small
  :: forall children
   . Array (Attribute Small_)
  -> { | children }
  -> Element Small_ children
small = makeElt Small_ "small"

small'attr
  :: Array (Attribute Small_)
  -> Array (Attribute Small_)
small'attr = identity

data TSmall_ = TSmall_

instance typeToSymTSmall_ :: TypeToSym TSmall_ "TSmall_"

instance semigroupTSmall_ :: Semigroup TSmall_ where
  append _ _ = TSmall_

instance monoidTSmall_ :: Monoid TSmall_ where
  mempty = TSmall_

instance reifyTSmall_ :: ReifyAU Small_ TSmall_ where
  reifyAU = const mempty
type Source_' =
  ( tag :: String
  , attributes :: Array (Attribute Source_)
  )
newtype Source_ = Source_ { | Source_' }
unsafeUnSource_ :: Source_ -> { | Source_' }
unsafeUnSource_ (Source_ unsafe) = unsafe

instance typeToSymSource_ ::
  TypeToSym Source_ "source"

source
  :: forall children
   . Array (Attribute Source_)
  -> { | children }
  -> Element Source_ children
source = makeElt Source_ "source"

source'attr
  :: Array (Attribute Source_)
  -> Array (Attribute Source_)
source'attr = identity

data TSource_ = TSource_

instance typeToSymTSource_ :: TypeToSym TSource_ "TSource_"

instance semigroupTSource_ :: Semigroup TSource_ where
  append _ _ = TSource_

instance monoidTSource_ :: Monoid TSource_ where
  mempty = TSource_

instance reifyTSource_ :: ReifyAU Source_ TSource_ where
  reifyAU = const mempty
type Span_' =
  ( tag :: String
  , attributes :: Array (Attribute Span_)
  )
newtype Span_ = Span_ { | Span_' }
unsafeUnSpan_ :: Span_ -> { | Span_' }
unsafeUnSpan_ (Span_ unsafe) = unsafe

instance typeToSymSpan_ ::
  TypeToSym Span_ "span"

span
  :: forall children
   . Array (Attribute Span_)
  -> { | children }
  -> Element Span_ children
span = makeElt Span_ "span"

span'attr
  :: Array (Attribute Span_)
  -> Array (Attribute Span_)
span'attr = identity

data TSpan_ = TSpan_

instance typeToSymTSpan_ :: TypeToSym TSpan_ "TSpan_"

instance semigroupTSpan_ :: Semigroup TSpan_ where
  append _ _ = TSpan_

instance monoidTSpan_ :: Monoid TSpan_ where
  mempty = TSpan_

instance reifyTSpan_ :: ReifyAU Span_ TSpan_ where
  reifyAU = const mempty
type Strike_' =
  ( tag :: String
  , attributes :: Array (Attribute Strike_)
  )
newtype Strike_ = Strike_ { | Strike_' }
unsafeUnStrike_ :: Strike_ -> { | Strike_' }
unsafeUnStrike_ (Strike_ unsafe) = unsafe

instance typeToSymStrike_ ::
  TypeToSym Strike_ "strike"

strike
  :: forall children
   . Array (Attribute Strike_)
  -> { | children }
  -> Element Strike_ children
strike = makeElt Strike_ "strike"

strike'attr
  :: Array (Attribute Strike_)
  -> Array (Attribute Strike_)
strike'attr = identity

data TStrike_ = TStrike_

instance typeToSymTStrike_ :: TypeToSym TStrike_ "TStrike_"

instance semigroupTStrike_ :: Semigroup TStrike_ where
  append _ _ = TStrike_

instance monoidTStrike_ :: Monoid TStrike_ where
  mempty = TStrike_

instance reifyTStrike_ :: ReifyAU Strike_ TStrike_ where
  reifyAU = const mempty
type Strong_' =
  ( tag :: String
  , attributes :: Array (Attribute Strong_)
  )
newtype Strong_ = Strong_ { | Strong_' }
unsafeUnStrong_ :: Strong_ -> { | Strong_' }
unsafeUnStrong_ (Strong_ unsafe) = unsafe

instance typeToSymStrong_ ::
  TypeToSym Strong_ "strong"

strong
  :: forall children
   . Array (Attribute Strong_)
  -> { | children }
  -> Element Strong_ children
strong = makeElt Strong_ "strong"

strong'attr
  :: Array (Attribute Strong_)
  -> Array (Attribute Strong_)
strong'attr = identity

data TStrong_ = TStrong_

instance typeToSymTStrong_ :: TypeToSym TStrong_ "TStrong_"

instance semigroupTStrong_ :: Semigroup TStrong_ where
  append _ _ = TStrong_

instance monoidTStrong_ :: Monoid TStrong_ where
  mempty = TStrong_

instance reifyTStrong_ :: ReifyAU Strong_ TStrong_ where
  reifyAU = const mempty
type Style_' =
  ( tag :: String
  , attributes :: Array (Attribute Style_)
  )
newtype Style_ = Style_ { | Style_' }
unsafeUnStyle_ :: Style_ -> { | Style_' }
unsafeUnStyle_ (Style_ unsafe) = unsafe

instance typeToSymStyle_ ::
  TypeToSym Style_ "style"

style
  :: forall children
   . Array (Attribute Style_)
  -> { | children }
  -> Element Style_ children
style = makeElt Style_ "style"

style'attr
  :: Array (Attribute Style_)
  -> Array (Attribute Style_)
style'attr = identity

data TStyle_ = TStyle_

instance typeToSymTStyle_ :: TypeToSym TStyle_ "TStyle_"

instance semigroupTStyle_ :: Semigroup TStyle_ where
  append _ _ = TStyle_

instance monoidTStyle_ :: Monoid TStyle_ where
  mempty = TStyle_

instance reifyTStyle_ :: ReifyAU Style_ TStyle_ where
  reifyAU = const mempty
type Sub_' =
  ( tag :: String
  , attributes :: Array (Attribute Sub_)
  )
newtype Sub_ = Sub_ { | Sub_' }
unsafeUnSub_ :: Sub_ -> { | Sub_' }
unsafeUnSub_ (Sub_ unsafe) = unsafe

instance typeToSymSub_ ::
  TypeToSym Sub_ "sub"

sub
  :: forall children
   . Array (Attribute Sub_)
  -> { | children }
  -> Element Sub_ children
sub = makeElt Sub_ "sub"

sub'attr
  :: Array (Attribute Sub_)
  -> Array (Attribute Sub_)
sub'attr = identity

data TSub_ = TSub_

instance typeToSymTSub_ :: TypeToSym TSub_ "TSub_"

instance semigroupTSub_ :: Semigroup TSub_ where
  append _ _ = TSub_

instance monoidTSub_ :: Monoid TSub_ where
  mempty = TSub_

instance reifyTSub_ :: ReifyAU Sub_ TSub_ where
  reifyAU = const mempty
type Summary_' =
  ( tag :: String
  , attributes :: Array (Attribute Summary_)
  )
newtype Summary_ = Summary_ { | Summary_' }
unsafeUnSummary_ :: Summary_ -> { | Summary_' }
unsafeUnSummary_ (Summary_ unsafe) = unsafe

instance typeToSymSummary_ ::
  TypeToSym Summary_ "summary"

summary
  :: forall children
   . Array (Attribute Summary_)
  -> { | children }
  -> Element Summary_ children
summary = makeElt Summary_ "summary"

summary'attr
  :: Array (Attribute Summary_)
  -> Array (Attribute Summary_)
summary'attr = identity

data TSummary_ = TSummary_

instance typeToSymTSummary_ :: TypeToSym TSummary_ "TSummary_"

instance semigroupTSummary_ :: Semigroup TSummary_ where
  append _ _ = TSummary_

instance monoidTSummary_ :: Monoid TSummary_ where
  mempty = TSummary_

instance reifyTSummary_ :: ReifyAU Summary_ TSummary_ where
  reifyAU = const mempty
type Sup_' =
  ( tag :: String
  , attributes :: Array (Attribute Sup_)
  )
newtype Sup_ = Sup_ { | Sup_' }
unsafeUnSup_ :: Sup_ -> { | Sup_' }
unsafeUnSup_ (Sup_ unsafe) = unsafe

instance typeToSymSup_ ::
  TypeToSym Sup_ "sup"

sup
  :: forall children
   . Array (Attribute Sup_)
  -> { | children }
  -> Element Sup_ children
sup = makeElt Sup_ "sup"

sup'attr
  :: Array (Attribute Sup_)
  -> Array (Attribute Sup_)
sup'attr = identity

data TSup_ = TSup_

instance typeToSymTSup_ :: TypeToSym TSup_ "TSup_"

instance semigroupTSup_ :: Semigroup TSup_ where
  append _ _ = TSup_

instance monoidTSup_ :: Monoid TSup_ where
  mempty = TSup_

instance reifyTSup_ :: ReifyAU Sup_ TSup_ where
  reifyAU = const mempty
type Svg_' =
  ( tag :: String
  , attributes :: Array (Attribute Svg_)
  )
newtype Svg_ = Svg_ { | Svg_' }
unsafeUnSvg_ :: Svg_ -> { | Svg_' }
unsafeUnSvg_ (Svg_ unsafe) = unsafe

instance typeToSymSvg_ ::
  TypeToSym Svg_ "svg"

svg
  :: forall children
   . Array (Attribute Svg_)
  -> { | children }
  -> Element Svg_ children
svg = makeElt Svg_ "svg"

svg'attr
  :: Array (Attribute Svg_)
  -> Array (Attribute Svg_)
svg'attr = identity

data TSvg_ = TSvg_

instance typeToSymTSvg_ :: TypeToSym TSvg_ "TSvg_"

instance semigroupTSvg_ :: Semigroup TSvg_ where
  append _ _ = TSvg_

instance monoidTSvg_ :: Monoid TSvg_ where
  mempty = TSvg_

instance reifyTSvg_ :: ReifyAU Svg_ TSvg_ where
  reifyAU = const mempty
type Table_' =
  ( tag :: String
  , attributes :: Array (Attribute Table_)
  )
newtype Table_ = Table_ { | Table_' }
unsafeUnTable_ :: Table_ -> { | Table_' }
unsafeUnTable_ (Table_ unsafe) = unsafe

instance typeToSymTable_ ::
  TypeToSym Table_ "table"

table
  :: forall children
   . Array (Attribute Table_)
  -> { | children }
  -> Element Table_ children
table = makeElt Table_ "table"

table'attr
  :: Array (Attribute Table_)
  -> Array (Attribute Table_)
table'attr = identity

data TTable_ = TTable_

instance typeToSymTTable_ :: TypeToSym TTable_ "TTable_"

instance semigroupTTable_ :: Semigroup TTable_ where
  append _ _ = TTable_

instance monoidTTable_ :: Monoid TTable_ where
  mempty = TTable_

instance reifyTTable_ :: ReifyAU Table_ TTable_ where
  reifyAU = const mempty
type Tbody_' =
  ( tag :: String
  , attributes :: Array (Attribute Tbody_)
  )
newtype Tbody_ = Tbody_ { | Tbody_' }
unsafeUnTbody_ :: Tbody_ -> { | Tbody_' }
unsafeUnTbody_ (Tbody_ unsafe) = unsafe

instance typeToSymTbody_ ::
  TypeToSym Tbody_ "tbody"

tbody
  :: forall children
   . Array (Attribute Tbody_)
  -> { | children }
  -> Element Tbody_ children
tbody = makeElt Tbody_ "tbody"

tbody'attr
  :: Array (Attribute Tbody_)
  -> Array (Attribute Tbody_)
tbody'attr = identity

data TTbody_ = TTbody_

instance typeToSymTTbody_ :: TypeToSym TTbody_ "TTbody_"

instance semigroupTTbody_ :: Semigroup TTbody_ where
  append _ _ = TTbody_

instance monoidTTbody_ :: Monoid TTbody_ where
  mempty = TTbody_

instance reifyTTbody_ :: ReifyAU Tbody_ TTbody_ where
  reifyAU = const mempty
type Td_' =
  ( tag :: String
  , attributes :: Array (Attribute Td_)
  )
newtype Td_ = Td_ { | Td_' }
unsafeUnTd_ :: Td_ -> { | Td_' }
unsafeUnTd_ (Td_ unsafe) = unsafe

instance typeToSymTd_ ::
  TypeToSym Td_ "td"

td
  :: forall children
   . Array (Attribute Td_)
  -> { | children }
  -> Element Td_ children
td = makeElt Td_ "td"

td'attr
  :: Array (Attribute Td_)
  -> Array (Attribute Td_)
td'attr = identity

data TTd_ = TTd_

instance typeToSymTTd_ :: TypeToSym TTd_ "TTd_"

instance semigroupTTd_ :: Semigroup TTd_ where
  append _ _ = TTd_

instance monoidTTd_ :: Monoid TTd_ where
  mempty = TTd_

instance reifyTTd_ :: ReifyAU Td_ TTd_ where
  reifyAU = const mempty
type Template_' =
  ( tag :: String
  , attributes :: Array (Attribute Template_)
  )
newtype Template_ = Template_ { | Template_' }
unsafeUnTemplate_ :: Template_ -> { | Template_' }
unsafeUnTemplate_ (Template_ unsafe) = unsafe

instance typeToSymTemplate_ ::
  TypeToSym Template_ "template"

template
  :: forall children
   . Array (Attribute Template_)
  -> { | children }
  -> Element Template_ children
template = makeElt Template_ "template"

template'attr
  :: Array (Attribute Template_)
  -> Array (Attribute Template_)
template'attr = identity

data TTemplate_ = TTemplate_

instance typeToSymTTemplate_ :: TypeToSym TTemplate_ "TTemplate_"

instance semigroupTTemplate_ :: Semigroup TTemplate_ where
  append _ _ = TTemplate_

instance monoidTTemplate_ :: Monoid TTemplate_ where
  mempty = TTemplate_

instance reifyTTemplate_ :: ReifyAU Template_ TTemplate_ where
  reifyAU = const mempty
type Textarea_' =
  ( tag :: String
  , attributes :: Array (Attribute Textarea_)
  )
newtype Textarea_ = Textarea_ { | Textarea_' }
unsafeUnTextarea_ :: Textarea_ -> { | Textarea_' }
unsafeUnTextarea_ (Textarea_ unsafe) = unsafe

instance typeToSymTextarea_ ::
  TypeToSym Textarea_ "textarea"

textarea
  :: forall children
   . Array (Attribute Textarea_)
  -> { | children }
  -> Element Textarea_ children
textarea = makeElt Textarea_ "textarea"

textarea'attr
  :: Array (Attribute Textarea_)
  -> Array (Attribute Textarea_)
textarea'attr = identity

data TTextarea_ = TTextarea_

instance typeToSymTTextarea_ :: TypeToSym TTextarea_ "TTextarea_"

instance semigroupTTextarea_ :: Semigroup TTextarea_ where
  append _ _ = TTextarea_

instance monoidTTextarea_ :: Monoid TTextarea_ where
  mempty = TTextarea_

instance reifyTTextarea_ :: ReifyAU Textarea_ TTextarea_ where
  reifyAU = const mempty
type Tfoot_' =
  ( tag :: String
  , attributes :: Array (Attribute Tfoot_)
  )
newtype Tfoot_ = Tfoot_ { | Tfoot_' }
unsafeUnTfoot_ :: Tfoot_ -> { | Tfoot_' }
unsafeUnTfoot_ (Tfoot_ unsafe) = unsafe

instance typeToSymTfoot_ ::
  TypeToSym Tfoot_ "tfoot"

tfoot
  :: forall children
   . Array (Attribute Tfoot_)
  -> { | children }
  -> Element Tfoot_ children
tfoot = makeElt Tfoot_ "tfoot"

tfoot'attr
  :: Array (Attribute Tfoot_)
  -> Array (Attribute Tfoot_)
tfoot'attr = identity

data TTfoot_ = TTfoot_

instance typeToSymTTfoot_ :: TypeToSym TTfoot_ "TTfoot_"

instance semigroupTTfoot_ :: Semigroup TTfoot_ where
  append _ _ = TTfoot_

instance monoidTTfoot_ :: Monoid TTfoot_ where
  mempty = TTfoot_

instance reifyTTfoot_ :: ReifyAU Tfoot_ TTfoot_ where
  reifyAU = const mempty
type Th_' =
  ( tag :: String
  , attributes :: Array (Attribute Th_)
  )
newtype Th_ = Th_ { | Th_' }
unsafeUnTh_ :: Th_ -> { | Th_' }
unsafeUnTh_ (Th_ unsafe) = unsafe

instance typeToSymTh_ ::
  TypeToSym Th_ "th"

th
  :: forall children
   . Array (Attribute Th_)
  -> { | children }
  -> Element Th_ children
th = makeElt Th_ "th"

th'attr
  :: Array (Attribute Th_)
  -> Array (Attribute Th_)
th'attr = identity

data TTh_ = TTh_

instance typeToSymTTh_ :: TypeToSym TTh_ "TTh_"

instance semigroupTTh_ :: Semigroup TTh_ where
  append _ _ = TTh_

instance monoidTTh_ :: Monoid TTh_ where
  mempty = TTh_

instance reifyTTh_ :: ReifyAU Th_ TTh_ where
  reifyAU = const mempty
type Thead_' =
  ( tag :: String
  , attributes :: Array (Attribute Thead_)
  )
newtype Thead_ = Thead_ { | Thead_' }
unsafeUnThead_ :: Thead_ -> { | Thead_' }
unsafeUnThead_ (Thead_ unsafe) = unsafe

instance typeToSymThead_ ::
  TypeToSym Thead_ "thead"

thead
  :: forall children
   . Array (Attribute Thead_)
  -> { | children }
  -> Element Thead_ children
thead = makeElt Thead_ "thead"

thead'attr
  :: Array (Attribute Thead_)
  -> Array (Attribute Thead_)
thead'attr = identity

data TThead_ = TThead_

instance typeToSymTThead_ :: TypeToSym TThead_ "TThead_"

instance semigroupTThead_ :: Semigroup TThead_ where
  append _ _ = TThead_

instance monoidTThead_ :: Monoid TThead_ where
  mempty = TThead_

instance reifyTThead_ :: ReifyAU Thead_ TThead_ where
  reifyAU = const mempty
type Time_' =
  ( tag :: String
  , attributes :: Array (Attribute Time_)
  )
newtype Time_ = Time_ { | Time_' }
unsafeUnTime_ :: Time_ -> { | Time_' }
unsafeUnTime_ (Time_ unsafe) = unsafe

instance typeToSymTime_ ::
  TypeToSym Time_ "time"

time
  :: forall children
   . Array (Attribute Time_)
  -> { | children }
  -> Element Time_ children
time = makeElt Time_ "time"

time'attr
  :: Array (Attribute Time_)
  -> Array (Attribute Time_)
time'attr = identity

data TTime_ = TTime_

instance typeToSymTTime_ :: TypeToSym TTime_ "TTime_"

instance semigroupTTime_ :: Semigroup TTime_ where
  append _ _ = TTime_

instance monoidTTime_ :: Monoid TTime_ where
  mempty = TTime_

instance reifyTTime_ :: ReifyAU Time_ TTime_ where
  reifyAU = const mempty
type Title_' =
  ( tag :: String
  , attributes :: Array (Attribute Title_)
  )
newtype Title_ = Title_ { | Title_' }
unsafeUnTitle_ :: Title_ -> { | Title_' }
unsafeUnTitle_ (Title_ unsafe) = unsafe

instance typeToSymTitle_ ::
  TypeToSym Title_ "title"

title
  :: forall children
   . Array (Attribute Title_)
  -> { | children }
  -> Element Title_ children
title = makeElt Title_ "title"

title'attr
  :: Array (Attribute Title_)
  -> Array (Attribute Title_)
title'attr = identity

data TTitle_ = TTitle_

instance typeToSymTTitle_ :: TypeToSym TTitle_ "TTitle_"

instance semigroupTTitle_ :: Semigroup TTitle_ where
  append _ _ = TTitle_

instance monoidTTitle_ :: Monoid TTitle_ where
  mempty = TTitle_

instance reifyTTitle_ :: ReifyAU Title_ TTitle_ where
  reifyAU = const mempty
type Tr_' =
  ( tag :: String
  , attributes :: Array (Attribute Tr_)
  )
newtype Tr_ = Tr_ { | Tr_' }
unsafeUnTr_ :: Tr_ -> { | Tr_' }
unsafeUnTr_ (Tr_ unsafe) = unsafe

instance typeToSymTr_ ::
  TypeToSym Tr_ "tr"

tr
  :: forall children
   . Array (Attribute Tr_)
  -> { | children }
  -> Element Tr_ children
tr = makeElt Tr_ "tr"

tr'attr
  :: Array (Attribute Tr_)
  -> Array (Attribute Tr_)
tr'attr = identity

data TTr_ = TTr_

instance typeToSymTTr_ :: TypeToSym TTr_ "TTr_"

instance semigroupTTr_ :: Semigroup TTr_ where
  append _ _ = TTr_

instance monoidTTr_ :: Monoid TTr_ where
  mempty = TTr_

instance reifyTTr_ :: ReifyAU Tr_ TTr_ where
  reifyAU = const mempty
type Track_' =
  ( tag :: String
  , attributes :: Array (Attribute Track_)
  )
newtype Track_ = Track_ { | Track_' }
unsafeUnTrack_ :: Track_ -> { | Track_' }
unsafeUnTrack_ (Track_ unsafe) = unsafe

instance typeToSymTrack_ ::
  TypeToSym Track_ "track"

track
  :: forall children
   . Array (Attribute Track_)
  -> { | children }
  -> Element Track_ children
track = makeElt Track_ "track"

track'attr
  :: Array (Attribute Track_)
  -> Array (Attribute Track_)
track'attr = identity

data TTrack_ = TTrack_

instance typeToSymTTrack_ :: TypeToSym TTrack_ "TTrack_"

instance semigroupTTrack_ :: Semigroup TTrack_ where
  append _ _ = TTrack_

instance monoidTTrack_ :: Monoid TTrack_ where
  mempty = TTrack_

instance reifyTTrack_ :: ReifyAU Track_ TTrack_ where
  reifyAU = const mempty
type Tt_' =
  ( tag :: String
  , attributes :: Array (Attribute Tt_)
  )
newtype Tt_ = Tt_ { | Tt_' }
unsafeUnTt_ :: Tt_ -> { | Tt_' }
unsafeUnTt_ (Tt_ unsafe) = unsafe

instance typeToSymTt_ ::
  TypeToSym Tt_ "tt"

tt
  :: forall children
   . Array (Attribute Tt_)
  -> { | children }
  -> Element Tt_ children
tt = makeElt Tt_ "tt"

tt'attr
  :: Array (Attribute Tt_)
  -> Array (Attribute Tt_)
tt'attr = identity

data TTt_ = TTt_

instance typeToSymTTt_ :: TypeToSym TTt_ "TTt_"

instance semigroupTTt_ :: Semigroup TTt_ where
  append _ _ = TTt_

instance monoidTTt_ :: Monoid TTt_ where
  mempty = TTt_

instance reifyTTt_ :: ReifyAU Tt_ TTt_ where
  reifyAU = const mempty
type U_' =
  ( tag :: String
  , attributes :: Array (Attribute U_)
  )
newtype U_ = U_ { | U_' }
unsafeUnU_ :: U_ -> { | U_' }
unsafeUnU_ (U_ unsafe) = unsafe

instance typeToSymU_ ::
  TypeToSym U_ "u"

u
  :: forall children
   . Array (Attribute U_)
  -> { | children }
  -> Element U_ children
u = makeElt U_ "u"

u'attr
  :: Array (Attribute U_)
  -> Array (Attribute U_)
u'attr = identity

data TU_ = TU_

instance typeToSymTU_ :: TypeToSym TU_ "TU_"

instance semigroupTU_ :: Semigroup TU_ where
  append _ _ = TU_

instance monoidTU_ :: Monoid TU_ where
  mempty = TU_

instance reifyTU_ :: ReifyAU U_ TU_ where
  reifyAU = const mempty
type Ul_' =
  ( tag :: String
  , attributes :: Array (Attribute Ul_)
  )
newtype Ul_ = Ul_ { | Ul_' }
unsafeUnUl_ :: Ul_ -> { | Ul_' }
unsafeUnUl_ (Ul_ unsafe) = unsafe

instance typeToSymUl_ ::
  TypeToSym Ul_ "ul"

ul
  :: forall children
   . Array (Attribute Ul_)
  -> { | children }
  -> Element Ul_ children
ul = makeElt Ul_ "ul"

ul'attr
  :: Array (Attribute Ul_)
  -> Array (Attribute Ul_)
ul'attr = identity

data TUl_ = TUl_

instance typeToSymTUl_ :: TypeToSym TUl_ "TUl_"

instance semigroupTUl_ :: Semigroup TUl_ where
  append _ _ = TUl_

instance monoidTUl_ :: Monoid TUl_ where
  mempty = TUl_

instance reifyTUl_ :: ReifyAU Ul_ TUl_ where
  reifyAU = const mempty
type Var_' =
  ( tag :: String
  , attributes :: Array (Attribute Var_)
  )
newtype Var_ = Var_ { | Var_' }
unsafeUnVar_ :: Var_ -> { | Var_' }
unsafeUnVar_ (Var_ unsafe) = unsafe

instance typeToSymVar_ ::
  TypeToSym Var_ "var"

var
  :: forall children
   . Array (Attribute Var_)
  -> { | children }
  -> Element Var_ children
var = makeElt Var_ "var"

var'attr
  :: Array (Attribute Var_)
  -> Array (Attribute Var_)
var'attr = identity

data TVar_ = TVar_

instance typeToSymTVar_ :: TypeToSym TVar_ "TVar_"

instance semigroupTVar_ :: Semigroup TVar_ where
  append _ _ = TVar_

instance monoidTVar_ :: Monoid TVar_ where
  mempty = TVar_

instance reifyTVar_ :: ReifyAU Var_ TVar_ where
  reifyAU = const mempty
type Video_' =
  ( tag :: String
  , attributes :: Array (Attribute Video_)
  )
newtype Video_ = Video_ { | Video_' }
unsafeUnVideo_ :: Video_ -> { | Video_' }
unsafeUnVideo_ (Video_ unsafe) = unsafe

instance typeToSymVideo_ ::
  TypeToSym Video_ "video"

video
  :: forall children
   . Array (Attribute Video_)
  -> { | children }
  -> Element Video_ children
video = makeElt Video_ "video"

video'attr
  :: Array (Attribute Video_)
  -> Array (Attribute Video_)
video'attr = identity

data TVideo_ = TVideo_

instance typeToSymTVideo_ :: TypeToSym TVideo_ "TVideo_"

instance semigroupTVideo_ :: Semigroup TVideo_ where
  append _ _ = TVideo_

instance monoidTVideo_ :: Monoid TVideo_ where
  mempty = TVideo_

instance reifyTVideo_ :: ReifyAU Video_ TVideo_ where
  reifyAU = const mempty
type Wbr_' =
  ( tag :: String
  , attributes :: Array (Attribute Wbr_)
  )
newtype Wbr_ = Wbr_ { | Wbr_' }
unsafeUnWbr_ :: Wbr_ -> { | Wbr_' }
unsafeUnWbr_ (Wbr_ unsafe) = unsafe

instance typeToSymWbr_ ::
  TypeToSym Wbr_ "wbr"

wbr
  :: forall children
   . Array (Attribute Wbr_)
  -> { | children }
  -> Element Wbr_ children
wbr = makeElt Wbr_ "wbr"

wbr'attr
  :: Array (Attribute Wbr_)
  -> Array (Attribute Wbr_)
wbr'attr = identity

data TWbr_ = TWbr_

instance typeToSymTWbr_ :: TypeToSym TWbr_ "TWbr_"

instance semigroupTWbr_ :: Semigroup TWbr_ where
  append _ _ = TWbr_

instance monoidTWbr_ :: Monoid TWbr_ where
  mempty = TWbr_

instance reifyTWbr_ :: ReifyAU Wbr_ TWbr_ where
  reifyAU = const mempty
-- codegen 1