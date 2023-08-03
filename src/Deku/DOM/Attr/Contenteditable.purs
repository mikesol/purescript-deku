module Deku.DOM.Attr.Contenteditable where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Abbr (Abbr_)
import Deku.DOM.Elt.Acronym (Acronym_)
import Deku.DOM.Elt.Address (Address_)
import Deku.DOM.Elt.Applet (Applet_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Article (Article_)
import Deku.DOM.Elt.Aside (Aside_)
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.B (B_)
import Deku.DOM.Elt.Base (Base_)
import Deku.DOM.Elt.Basefont (Basefont_)
import Deku.DOM.Elt.Bdi (Bdi_)
import Deku.DOM.Elt.Bdo (Bdo_)
import Deku.DOM.Elt.Big (Big_)
import Deku.DOM.Elt.Blockquote (Blockquote_)
import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Br (Br_)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Canvas (Canvas_)
import Deku.DOM.Elt.Caption (Caption_)
import Deku.DOM.Elt.Center (Center_)
import Deku.DOM.Elt.Cite (Cite_)
import Deku.DOM.Elt.Code (Code_)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.DOM.Elt.Xdata (Xdata_)
import Deku.DOM.Elt.Datalist (Datalist_)
import Deku.DOM.Elt.Dd (Dd_)
import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Details (Details_)
import Deku.DOM.Elt.Dfn (Dfn_)
import Deku.DOM.Elt.Dialog (Dialog_)
import Deku.DOM.Elt.Dir (Dir_)
import Deku.DOM.Elt.Div (Div_)
import Deku.DOM.Elt.Dl (Dl_)
import Deku.DOM.Elt.Dt (Dt_)
import Deku.DOM.Elt.Em (Em_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Figcaption (Figcaption_)
import Deku.DOM.Elt.Figure (Figure_)
import Deku.DOM.Elt.Font (Font_)
import Deku.DOM.Elt.Footer (Footer_)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Frame (Frame_)
import Deku.DOM.Elt.Frameset (Frameset_)
import Deku.DOM.Elt.H1 (H1_)
import Deku.DOM.Elt.H2 (H2_)
import Deku.DOM.Elt.H3 (H3_)
import Deku.DOM.Elt.H4 (H4_)
import Deku.DOM.Elt.H5 (H5_)
import Deku.DOM.Elt.H6 (H6_)
import Deku.DOM.Elt.Head (Head_)
import Deku.DOM.Elt.Header (Header_)
import Deku.DOM.Elt.Hr (Hr_)
import Deku.DOM.Elt.Html (Html_)
import Deku.DOM.Elt.I (I_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Kbd (Kbd_)
import Deku.DOM.Elt.Label (Label_)
import Deku.DOM.Elt.Legend (Legend_)
import Deku.DOM.Elt.Li (Li_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Main (Main_)
import Deku.DOM.Elt.Map (Map_)
import Deku.DOM.Elt.Mark (Mark_)
import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Nav (Nav_)
import Deku.DOM.Elt.Noframes (Noframes_)
import Deku.DOM.Elt.Noscript (Noscript_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Ol (Ol_)
import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.P (P_)
import Deku.DOM.Elt.Param (Param_)
import Deku.DOM.Elt.Picture (Picture_)
import Deku.DOM.Elt.Pre (Pre_)
import Deku.DOM.Elt.Progress (Progress_)
import Deku.DOM.Elt.Q (Q_)
import Deku.DOM.Elt.Rp (Rp_)
import Deku.DOM.Elt.Rt (Rt_)
import Deku.DOM.Elt.Ruby (Ruby_)
import Deku.DOM.Elt.S (S_)
import Deku.DOM.Elt.Samp (Samp_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Section (Section_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Small (Small_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Span (Span_)
import Deku.DOM.Elt.Strike (Strike_)
import Deku.DOM.Elt.Strong (Strong_)
import Deku.DOM.Elt.Style (Style_)
import Deku.DOM.Elt.Sub (Sub_)
import Deku.DOM.Elt.Summary (Summary_)
import Deku.DOM.Elt.Sup (Sup_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Template (Template_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Thead (Thead_)
import Deku.DOM.Elt.Time (Time_)
import Deku.DOM.Elt.Title (Title_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.DOM.Elt.Track (Track_)
import Deku.DOM.Elt.Tt (Tt_)
import Deku.DOM.Elt.U (U_)
import Deku.DOM.Elt.Ul (Ul_)
import Deku.DOM.Elt.Var (Var_)
import Deku.DOM.Elt.Video (Video_)
import Deku.DOM.Elt.Wbr (Wbr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Contenteditable = Contenteditable

instance Attr A_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr A_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr A_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr A_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr A_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Abbr_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Abbr_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Abbr_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Abbr_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Abbr_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Acronym_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Acronym_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Acronym_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Acronym_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Acronym_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Address_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Address_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Address_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Address_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Address_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Applet_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Applet_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Applet_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Applet_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Applet_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Area_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Area_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Area_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Area_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Area_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Article_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Article_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Article_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Article_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Article_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Aside_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Aside_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Aside_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Aside_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Aside_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Audio_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Audio_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Audio_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Audio_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Audio_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr B_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr B_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr B_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr B_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr B_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Base_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Base_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Base_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Base_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Base_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Basefont_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Basefont_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Basefont_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Basefont_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Basefont_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Bdi_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Bdi_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Bdi_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Bdi_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Bdi_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Bdo_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Bdo_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Bdo_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Bdo_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Bdo_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Big_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Big_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Big_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Big_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Big_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Blockquote_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Blockquote_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Blockquote_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Blockquote_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Blockquote_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Body_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Body_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Body_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Body_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Body_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Br_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Br_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Br_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Br_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Br_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Button_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Button_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Button_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Button_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Button_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Canvas_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Canvas_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Canvas_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Canvas_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Canvas_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Caption_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Caption_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Caption_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Caption_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Caption_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Center_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Center_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Center_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Center_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Center_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Cite_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Cite_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Cite_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Cite_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Cite_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Code_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Code_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Code_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Code_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Code_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Col_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Col_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Col_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Col_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Col_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Colgroup_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Colgroup_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Colgroup_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Colgroup_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Colgroup_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Xdata_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Xdata_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Xdata_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Xdata_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Xdata_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Datalist_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Datalist_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Datalist_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Datalist_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Datalist_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dd_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dd_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dd_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Dd_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dd_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Del_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Del_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Del_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Del_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Del_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Details_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Details_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Details_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Details_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Details_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dfn_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dfn_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dfn_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Dfn_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dfn_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dialog_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dialog_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dialog_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Dialog_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dialog_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dir_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dir_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dir_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Dir_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dir_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Div_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Div_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Div_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Div_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Div_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dl_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dl_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dl_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Dl_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dl_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dt_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dt_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Dt_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Dt_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Dt_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Em_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Em_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Em_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Em_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Em_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Embed_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Embed_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Embed_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Embed_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Embed_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Fieldset_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Fieldset_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Fieldset_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Fieldset_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Fieldset_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Figcaption_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Figcaption_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Figcaption_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Figcaption_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Figcaption_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Figure_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Figure_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Figure_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Figure_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Figure_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Font_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Font_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Font_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Font_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Font_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Footer_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Footer_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Footer_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Footer_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Footer_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Form_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Form_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Form_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Form_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Form_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Frame_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Frame_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Frame_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Frame_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Frame_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Frameset_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Frameset_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Frameset_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Frameset_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Frameset_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H1_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H1_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H1_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr H1_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H1_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H2_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H2_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H2_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr H2_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H2_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H3_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H3_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H3_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr H3_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H3_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H4_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H4_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H4_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr H4_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H4_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H5_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H5_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H5_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr H5_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H5_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H6_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H6_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr H6_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr H6_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr H6_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Head_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Head_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Head_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Head_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Head_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Header_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Header_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Header_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Header_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Header_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Hr_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Hr_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Hr_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Hr_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Hr_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Html_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Html_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Html_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Html_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Html_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr I_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr I_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr I_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr I_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr I_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Iframe_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Iframe_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Iframe_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Iframe_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Iframe_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Img_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Img_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Img_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Img_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Img_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Input_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Input_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Input_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Input_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Input_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Ins_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Ins_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Ins_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Ins_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Ins_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Kbd_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Kbd_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Kbd_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Kbd_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Kbd_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Label_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Label_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Label_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Label_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Label_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Legend_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Legend_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Legend_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Legend_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Legend_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Li_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Li_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Li_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Li_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Li_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Link_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Link_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Link_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Link_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Link_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Main_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Main_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Main_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Main_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Main_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Map_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Map_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Map_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Map_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Map_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Mark_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Mark_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Mark_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Mark_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Mark_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Meta_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Meta_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Meta_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Meta_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Meta_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Meter_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Meter_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Meter_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Meter_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Meter_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Nav_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Nav_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Nav_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Nav_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Nav_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Noframes_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Noframes_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Noframes_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Noframes_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Noframes_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Noscript_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Noscript_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Noscript_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Noscript_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Noscript_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Object_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Object_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Object_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Object_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Object_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Ol_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Ol_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Ol_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Ol_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Ol_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Optgroup_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Optgroup_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Optgroup_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Optgroup_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Optgroup_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Option_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Option_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Option_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Option_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Option_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Output_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Output_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Output_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Output_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Output_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr P_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr P_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr P_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr P_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr P_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Param_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Param_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Param_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Param_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Param_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Picture_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Picture_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Picture_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Picture_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Picture_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Pre_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Pre_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Pre_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Pre_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Pre_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Progress_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Progress_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Progress_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Progress_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Progress_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Q_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Q_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Q_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Q_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Q_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Rp_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Rp_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Rp_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Rp_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Rp_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Rt_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Rt_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Rt_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Rt_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Rt_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Ruby_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Ruby_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Ruby_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Ruby_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Ruby_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr S_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr S_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr S_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr S_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr S_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Samp_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Samp_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Samp_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Samp_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Samp_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Script_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Script_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Script_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Script_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Script_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Section_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Section_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Section_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Section_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Section_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Select_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Select_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Select_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Select_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Select_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Small_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Small_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Small_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Small_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Small_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Source_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Source_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Source_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Source_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Source_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Span_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Span_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Span_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Span_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Span_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Strike_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Strike_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Strike_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Strike_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Strike_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Strong_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Strong_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Strong_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Strong_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Strong_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Style_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Style_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Style_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Style_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Style_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Sub_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Sub_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Sub_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Sub_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Sub_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Summary_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Summary_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Summary_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Summary_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Summary_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Sup_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Sup_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Sup_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Sup_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Sup_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Svg_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Svg_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Svg_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Svg_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Svg_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Table_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Table_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Table_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Table_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Table_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Tbody_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Tbody_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Tbody_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Tbody_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Tbody_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Td_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Td_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Td_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Td_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Td_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Template_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Template_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Template_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Template_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Template_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Textarea_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Textarea_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Textarea_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Textarea_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Textarea_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Tfoot_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Tfoot_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Tfoot_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Tfoot_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Tfoot_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Th_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Th_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Th_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Th_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Th_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Thead_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Thead_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Thead_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Thead_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Thead_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Time_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Time_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Time_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Time_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Time_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Title_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Title_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Title_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Title_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Title_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Tr_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Tr_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Tr_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Tr_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Tr_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Track_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Track_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Track_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Track_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Track_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Tt_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Tt_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Tt_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Tt_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Tt_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr U_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr U_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr U_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr U_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr U_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Ul_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Ul_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Ul_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Ul_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Ul_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Var_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Var_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Var_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Var_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Var_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Video_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Video_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Video_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Video_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Video_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Wbr_ Contenteditable (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Wbr_ Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contenteditable", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contenteditable", value: prop' value }
    )
instance Attr Wbr_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: prop' value }
instance Attr Wbr_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr Wbr_ Contenteditable (ST.ST Global.Global  String ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "contenteditable", value: prop' value }

instance Attr everything Contenteditable (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Contenteditable bothValues = unsafeAttribute $ Both (pure 
    { key: "contenteditable", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "contenteditable", value: unset' })
instance Attr everything Contenteditable (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Contenteditable (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "contenteditable", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "contenteditable", value: unset' })
instance Attr everything Contenteditable  Unit  where
  attr Contenteditable _ = unsafeAttribute $ This $ pure $
    { key: "contenteditable", value: unset' }
instance Attr everything Contenteditable (Event.Event  Unit ) where
  attr Contenteditable eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "contenteditable", value: unset' }

instance Attr everything Contenteditable (ST.ST Global.Global  Unit ) where
  attr Contenteditable stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "contenteditable", value: unset' }
