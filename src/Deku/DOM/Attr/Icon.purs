module Deku.DOM.Attr.Icon where

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

data Icon = Icon

instance Attr A_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr A_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr A_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr A_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr A_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Abbr_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Abbr_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Abbr_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Abbr_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Abbr_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Acronym_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Acronym_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Acronym_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Acronym_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Acronym_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Address_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Address_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Address_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Address_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Address_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Applet_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Applet_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Applet_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Applet_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Applet_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Area_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Area_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Area_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Area_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Area_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Article_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Article_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Article_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Article_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Article_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Aside_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Aside_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Aside_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Aside_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Aside_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Audio_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Audio_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Audio_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Audio_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Audio_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr B_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr B_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr B_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr B_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr B_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Base_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Base_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Base_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Base_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Base_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Basefont_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Basefont_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Basefont_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Basefont_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Basefont_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Bdi_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Bdi_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Bdi_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Bdi_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Bdi_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Bdo_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Bdo_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Bdo_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Bdo_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Bdo_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Big_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Big_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Big_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Big_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Big_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Blockquote_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Blockquote_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Blockquote_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Blockquote_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Blockquote_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Body_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Body_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Body_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Body_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Body_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Br_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Br_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Br_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Br_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Br_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Button_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Button_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Button_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Button_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Button_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Canvas_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Canvas_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Canvas_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Canvas_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Canvas_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Caption_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Caption_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Caption_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Caption_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Caption_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Center_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Center_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Center_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Center_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Center_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Cite_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Cite_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Cite_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Cite_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Cite_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Code_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Code_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Code_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Code_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Code_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Col_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Col_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Col_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Col_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Col_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Colgroup_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Colgroup_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Colgroup_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Colgroup_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Colgroup_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Xdata_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Xdata_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Xdata_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Xdata_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Xdata_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Datalist_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Datalist_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Datalist_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Datalist_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Datalist_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dd_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dd_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dd_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Dd_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dd_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Del_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Del_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Del_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Del_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Del_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Details_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Details_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Details_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Details_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Details_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dfn_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dfn_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dfn_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Dfn_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dfn_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dialog_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dialog_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dialog_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Dialog_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dialog_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dir_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dir_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dir_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Dir_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dir_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Div_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Div_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Div_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Div_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Div_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dl_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dl_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dl_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Dl_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dl_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dt_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dt_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Dt_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Dt_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Dt_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Em_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Em_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Em_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Em_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Em_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Embed_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Embed_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Embed_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Embed_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Embed_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Fieldset_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Fieldset_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Fieldset_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Fieldset_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Fieldset_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Figcaption_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Figcaption_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Figcaption_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Figcaption_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Figcaption_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Figure_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Figure_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Figure_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Figure_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Figure_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Font_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Font_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Font_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Font_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Font_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Footer_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Footer_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Footer_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Footer_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Footer_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Form_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Form_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Form_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Form_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Form_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Frame_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Frame_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Frame_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Frame_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Frame_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Frameset_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Frameset_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Frameset_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Frameset_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Frameset_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H1_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H1_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H1_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr H1_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H1_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H2_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H2_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H2_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr H2_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H2_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H3_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H3_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H3_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr H3_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H3_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H4_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H4_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H4_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr H4_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H4_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H5_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H5_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H5_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr H5_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H5_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H6_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H6_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr H6_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr H6_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr H6_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Head_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Head_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Head_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Head_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Head_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Header_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Header_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Header_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Header_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Header_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Hr_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Hr_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Hr_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Hr_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Hr_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Html_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Html_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Html_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Html_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Html_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr I_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr I_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr I_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr I_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr I_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Iframe_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Iframe_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Iframe_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Iframe_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Iframe_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Img_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Img_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Img_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Img_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Img_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Input_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Input_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Input_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Input_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Input_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Ins_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Ins_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Ins_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Ins_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Ins_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Kbd_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Kbd_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Kbd_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Kbd_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Kbd_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Label_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Label_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Label_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Label_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Label_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Legend_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Legend_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Legend_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Legend_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Legend_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Li_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Li_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Li_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Li_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Li_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Link_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Link_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Link_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Link_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Link_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Main_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Main_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Main_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Main_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Main_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Map_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Map_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Map_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Map_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Map_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Mark_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Mark_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Mark_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Mark_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Mark_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Meta_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Meta_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Meta_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Meta_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Meta_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Meter_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Meter_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Meter_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Meter_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Meter_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Nav_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Nav_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Nav_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Nav_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Nav_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Noframes_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Noframes_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Noframes_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Noframes_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Noframes_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Noscript_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Noscript_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Noscript_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Noscript_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Noscript_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Object_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Object_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Object_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Object_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Object_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Ol_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Ol_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Ol_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Ol_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Ol_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Optgroup_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Optgroup_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Optgroup_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Optgroup_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Optgroup_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Option_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Option_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Option_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Option_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Option_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Output_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Output_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Output_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Output_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Output_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr P_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr P_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr P_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr P_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr P_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Param_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Param_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Param_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Param_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Param_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Picture_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Picture_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Picture_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Picture_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Picture_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Pre_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Pre_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Pre_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Pre_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Pre_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Progress_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Progress_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Progress_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Progress_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Progress_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Q_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Q_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Q_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Q_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Q_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Rp_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Rp_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Rp_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Rp_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Rp_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Rt_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Rt_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Rt_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Rt_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Rt_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Ruby_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Ruby_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Ruby_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Ruby_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Ruby_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr S_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr S_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr S_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr S_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr S_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Samp_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Samp_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Samp_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Samp_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Samp_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Script_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Script_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Script_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Script_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Script_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Section_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Section_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Section_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Section_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Section_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Select_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Select_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Select_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Select_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Select_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Small_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Small_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Small_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Small_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Small_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Source_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Source_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Source_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Source_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Source_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Span_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Span_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Span_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Span_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Span_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Strike_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Strike_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Strike_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Strike_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Strike_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Strong_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Strong_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Strong_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Strong_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Strong_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Style_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Style_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Style_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Style_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Style_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Sub_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Sub_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Sub_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Sub_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Sub_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Summary_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Summary_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Summary_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Summary_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Summary_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Sup_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Sup_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Sup_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Sup_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Sup_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Svg_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Svg_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Svg_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Svg_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Svg_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Table_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Table_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Table_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Table_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Table_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Tbody_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Tbody_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Tbody_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Tbody_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Tbody_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Td_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Td_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Td_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Td_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Td_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Template_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Template_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Template_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Template_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Template_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Textarea_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Textarea_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Textarea_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Textarea_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Textarea_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Tfoot_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Tfoot_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Tfoot_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Tfoot_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Tfoot_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Th_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Th_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Th_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Th_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Th_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Thead_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Thead_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Thead_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Thead_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Thead_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Time_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Time_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Time_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Time_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Time_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Title_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Title_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Title_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Title_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Title_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Tr_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Tr_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Tr_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Tr_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Tr_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Track_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Track_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Track_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Track_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Track_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Tt_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Tt_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Tt_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Tt_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Tt_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr U_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr U_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr U_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr U_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr U_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Ul_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Ul_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Ul_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Ul_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Ul_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Var_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Var_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Var_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Var_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Var_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Video_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Video_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Video_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Video_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Video_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Wbr_ Icon (NonEmpty.NonEmpty Event.Event  String ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure 
    { key: "icon", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Wbr_ Icon (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "icon", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "icon", value: prop' value })
instance Attr Wbr_ Icon  String  where
  attr Icon value = unsafeAttribute $ This $ pure $
    { key: "icon", value: prop' value }
instance Attr Wbr_ Icon (Event.Event  String ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr Wbr_ Icon (ST.ST Global.Global  String ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "icon", value: prop' value }

instance Attr everything Icon (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Icon bothValues = unsafeAttribute $ Both (pure  { key: "icon", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "icon", value: unset' })
instance Attr everything Icon (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Icon (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "icon", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "icon", value: unset' })
instance Attr everything Icon  Unit  where
  attr Icon _ = unsafeAttribute $ This $ pure $ { key: "icon", value: unset' }
instance Attr everything Icon (Event.Event  Unit ) where
  attr Icon eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "icon", value: unset' }

instance Attr everything Icon (ST.ST Global.Global  Unit ) where
  attr Icon stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "icon", value: unset' }
