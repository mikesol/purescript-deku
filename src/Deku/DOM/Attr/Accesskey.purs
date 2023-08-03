module Deku.DOM.Attr.Accesskey where

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

data Accesskey = Accesskey

instance Attr A_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr A_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr A_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr A_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr A_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Abbr_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Abbr_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Abbr_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Abbr_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Abbr_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Acronym_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Acronym_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Acronym_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Acronym_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Acronym_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Address_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Address_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Address_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Address_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Address_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Applet_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Applet_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Applet_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Applet_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Applet_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Area_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Area_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Area_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Area_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Area_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Article_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Article_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Article_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Article_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Article_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Aside_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Aside_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Aside_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Aside_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Aside_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Audio_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Audio_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Audio_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Audio_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Audio_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr B_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr B_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr B_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr B_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr B_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Base_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Base_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Base_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Base_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Base_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Basefont_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Basefont_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Basefont_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Basefont_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Basefont_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Bdi_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Bdi_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Bdi_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Bdi_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Bdi_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Bdo_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Bdo_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Bdo_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Bdo_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Bdo_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Big_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Big_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Big_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Big_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Big_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Blockquote_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Blockquote_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Blockquote_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Blockquote_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Blockquote_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Body_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Body_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Body_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Body_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Body_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Br_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Br_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Br_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Br_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Br_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Button_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Button_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Button_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Button_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Button_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Canvas_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Canvas_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Canvas_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Canvas_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Canvas_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Caption_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Caption_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Caption_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Caption_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Caption_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Center_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Center_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Center_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Center_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Center_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Cite_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Cite_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Cite_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Cite_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Cite_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Code_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Code_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Code_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Code_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Code_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Col_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Col_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Col_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Col_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Col_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Colgroup_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Colgroup_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Colgroup_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Colgroup_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Colgroup_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Xdata_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Xdata_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Xdata_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Xdata_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Xdata_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Datalist_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Datalist_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Datalist_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Datalist_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Datalist_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dd_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dd_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dd_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Dd_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dd_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Del_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Del_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Del_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Del_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Del_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Details_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Details_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Details_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Details_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Details_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dfn_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dfn_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dfn_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Dfn_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dfn_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dialog_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dialog_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dialog_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Dialog_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dialog_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dir_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dir_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dir_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Dir_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dir_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Div_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Div_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Div_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Div_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Div_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dl_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dl_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dl_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Dl_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dl_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dt_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dt_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Dt_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Dt_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Dt_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Em_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Em_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Em_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Em_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Em_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Embed_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Embed_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Embed_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Embed_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Embed_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Fieldset_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Fieldset_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Fieldset_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Fieldset_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Fieldset_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Figcaption_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Figcaption_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Figcaption_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Figcaption_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Figcaption_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Figure_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Figure_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Figure_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Figure_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Figure_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Font_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Font_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Font_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Font_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Font_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Footer_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Footer_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Footer_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Footer_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Footer_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Form_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Form_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Form_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Form_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Form_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Frame_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Frame_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Frame_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Frame_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Frame_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Frameset_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Frameset_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Frameset_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Frameset_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Frameset_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H1_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H1_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H1_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr H1_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H1_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H2_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H2_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H2_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr H2_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H2_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H3_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H3_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H3_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr H3_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H3_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H4_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H4_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H4_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr H4_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H4_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H5_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H5_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H5_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr H5_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H5_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H6_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H6_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr H6_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr H6_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr H6_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Head_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Head_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Head_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Head_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Head_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Header_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Header_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Header_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Header_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Header_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Hr_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Hr_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Hr_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Hr_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Hr_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Html_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Html_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Html_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Html_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Html_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr I_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr I_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr I_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr I_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr I_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Iframe_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Iframe_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Iframe_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Iframe_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Iframe_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Img_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Img_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Img_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Img_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Img_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Input_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Input_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Input_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Input_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Input_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Ins_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Ins_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Ins_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Ins_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Ins_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Kbd_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Kbd_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Kbd_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Kbd_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Kbd_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Label_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Label_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Label_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Label_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Label_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Legend_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Legend_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Legend_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Legend_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Legend_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Li_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Li_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Li_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Li_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Li_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Link_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Link_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Link_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Link_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Link_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Main_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Main_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Main_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Main_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Main_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Map_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Map_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Map_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Map_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Map_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Mark_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Mark_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Mark_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Mark_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Mark_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Meta_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Meta_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Meta_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Meta_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Meta_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Meter_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Meter_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Meter_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Meter_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Meter_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Nav_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Nav_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Nav_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Nav_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Nav_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Noframes_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Noframes_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Noframes_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Noframes_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Noframes_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Noscript_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Noscript_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Noscript_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Noscript_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Noscript_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Object_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Object_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Object_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Object_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Object_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Ol_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Ol_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Ol_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Ol_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Ol_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Optgroup_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Optgroup_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Optgroup_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Optgroup_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Optgroup_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Option_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Option_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Option_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Option_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Option_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Output_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Output_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Output_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Output_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Output_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr P_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr P_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr P_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr P_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr P_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Param_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Param_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Param_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Param_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Param_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Picture_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Picture_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Picture_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Picture_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Picture_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Pre_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Pre_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Pre_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Pre_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Pre_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Progress_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Progress_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Progress_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Progress_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Progress_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Q_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Q_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Q_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Q_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Q_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Rp_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Rp_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Rp_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Rp_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Rp_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Rt_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Rt_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Rt_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Rt_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Rt_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Ruby_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Ruby_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Ruby_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Ruby_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Ruby_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr S_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr S_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr S_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr S_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr S_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Samp_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Samp_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Samp_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Samp_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Samp_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Script_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Script_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Script_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Script_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Script_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Section_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Section_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Section_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Section_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Section_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Select_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Select_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Select_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Select_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Select_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Small_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Small_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Small_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Small_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Small_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Source_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Source_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Source_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Source_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Source_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Span_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Span_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Span_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Span_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Span_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Strike_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Strike_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Strike_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Strike_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Strike_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Strong_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Strong_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Strong_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Strong_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Strong_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Style_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Style_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Style_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Style_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Style_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Sub_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Sub_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Sub_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Sub_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Sub_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Summary_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Summary_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Summary_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Summary_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Summary_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Sup_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Sup_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Sup_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Sup_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Sup_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Svg_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Svg_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Svg_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Svg_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Svg_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Table_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Table_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Table_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Table_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Table_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Tbody_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Tbody_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Tbody_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Tbody_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Tbody_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Td_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Td_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Td_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Td_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Td_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Template_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Template_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Template_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Template_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Template_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Textarea_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Textarea_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Textarea_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Textarea_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Textarea_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Tfoot_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Tfoot_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Tfoot_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Tfoot_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Tfoot_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Th_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Th_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Th_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Th_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Th_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Thead_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Thead_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Thead_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Thead_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Thead_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Time_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Time_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Time_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Time_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Time_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Title_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Title_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Title_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Title_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Title_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Tr_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Tr_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Tr_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Tr_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Tr_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Track_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Track_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Track_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Track_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Track_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Tt_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Tt_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Tt_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Tt_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Tt_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr U_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr U_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr U_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr U_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr U_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Ul_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Ul_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Ul_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Ul_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Ul_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Var_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Var_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Var_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Var_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Var_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Video_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Video_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Video_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Video_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Video_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Wbr_ Accesskey (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Wbr_ Accesskey (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accesskey", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accesskey", value: prop' value })
instance Attr Wbr_ Accesskey  String  where
  attr Accesskey value = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: prop' value }
instance Attr Wbr_ Accesskey (Event.Event  String ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr Wbr_ Accesskey (ST.ST Global.Global  String ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accesskey", value: prop' value }

instance Attr everything Accesskey (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Accesskey bothValues = unsafeAttribute $ Both (pure 
    { key: "accesskey", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "accesskey", value: unset' })
instance Attr everything Accesskey (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Accesskey (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "accesskey", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "accesskey", value: unset' })
instance Attr everything Accesskey  Unit  where
  attr Accesskey _ = unsafeAttribute $ This $ pure $
    { key: "accesskey", value: unset' }
instance Attr everything Accesskey (Event.Event  Unit ) where
  attr Accesskey eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "accesskey", value: unset' }

instance Attr everything Accesskey (ST.ST Global.Global  Unit ) where
  attr Accesskey stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "accesskey", value: unset' }
