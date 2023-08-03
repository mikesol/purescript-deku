module Deku.DOM.Attr.Class where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Title (Title_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Stop (Stop_)
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Desc (Desc_)
import Deku.DOM.Elt.Defs (Defs_)
import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
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
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Template (Template_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Thead (Thead_)
import Deku.DOM.Elt.Time (Time_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.DOM.Elt.Track (Track_)
import Deku.DOM.Elt.Tt (Tt_)
import Deku.DOM.Elt.U (U_)
import Deku.DOM.Elt.Ul (Ul_)
import Deku.DOM.Elt.Var (Var_)
import Deku.DOM.Elt.Video (Video_)
import Deku.DOM.Elt.Wbr (Wbr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Class = Class

instance Attr A_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr A_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr A_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr A_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr A_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Abbr_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Abbr_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Abbr_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Abbr_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Abbr_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Acronym_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Acronym_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Acronym_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Acronym_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Acronym_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Address_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Address_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Address_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Address_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Address_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Applet_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Applet_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Applet_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Applet_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Applet_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Area_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Area_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Area_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Area_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Area_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Article_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Article_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Article_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Article_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Article_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Aside_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Aside_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Aside_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Aside_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Aside_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Audio_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Audio_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Audio_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Audio_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Audio_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr B_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr B_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr B_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr B_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr B_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Base_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Base_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Base_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Base_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Base_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Basefont_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Basefont_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Basefont_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Basefont_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Basefont_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Bdi_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Bdi_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Bdi_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Bdi_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Bdi_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Bdo_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Bdo_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Bdo_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Bdo_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Bdo_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Big_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Big_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Big_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Big_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Big_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Blockquote_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Blockquote_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Blockquote_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Blockquote_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Blockquote_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Body_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Body_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Body_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Body_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Body_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Br_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Br_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Br_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Br_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Br_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Button_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Button_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Button_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Button_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Button_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Canvas_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Canvas_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Canvas_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Canvas_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Canvas_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Caption_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Caption_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Caption_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Caption_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Caption_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Center_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Center_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Center_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Center_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Center_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Cite_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Cite_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Cite_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Cite_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Cite_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Code_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Code_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Code_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Code_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Code_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Col_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Col_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Col_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Col_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Col_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Colgroup_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Colgroup_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Colgroup_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Colgroup_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Colgroup_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Xdata_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Xdata_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Xdata_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Xdata_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Xdata_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Datalist_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Datalist_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Datalist_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Datalist_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Datalist_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dd_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dd_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dd_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Dd_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dd_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Del_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Del_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Del_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Del_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Del_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Details_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Details_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Details_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Details_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Details_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dfn_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dfn_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dfn_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Dfn_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dfn_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dialog_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dialog_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dialog_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Dialog_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dialog_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dir_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dir_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dir_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Dir_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dir_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Div_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Div_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Div_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Div_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Div_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dl_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dl_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dl_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Dl_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dl_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dt_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dt_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Dt_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Dt_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Dt_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Em_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Em_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Em_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Em_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Em_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Embed_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Embed_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Embed_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Embed_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Embed_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Fieldset_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Fieldset_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Fieldset_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Fieldset_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Fieldset_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Figcaption_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Figcaption_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Figcaption_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Figcaption_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Figcaption_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Figure_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Figure_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Figure_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Figure_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Figure_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Font_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Font_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Font_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Font_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Font_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Footer_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Footer_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Footer_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Footer_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Footer_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Form_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Form_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Form_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Form_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Form_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Frame_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Frame_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Frame_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Frame_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Frame_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Frameset_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Frameset_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Frameset_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Frameset_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Frameset_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H1_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H1_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H1_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr H1_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H1_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H2_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H2_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H2_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr H2_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H2_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H3_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H3_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H3_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr H3_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H3_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H4_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H4_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H4_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr H4_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H4_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H5_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H5_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H5_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr H5_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H5_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H6_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H6_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr H6_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr H6_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr H6_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Head_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Head_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Head_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Head_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Head_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Header_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Header_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Header_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Header_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Header_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Hr_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Hr_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Hr_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Hr_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Hr_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Html_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Html_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Html_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Html_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Html_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr I_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr I_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr I_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr I_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr I_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Iframe_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Iframe_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Iframe_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Iframe_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Iframe_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Img_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Img_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Img_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Img_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Img_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Input_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Input_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Input_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Input_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Input_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Ins_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Ins_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Ins_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Ins_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Ins_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Kbd_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Kbd_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Kbd_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Kbd_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Kbd_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Label_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Label_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Label_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Label_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Label_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Legend_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Legend_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Legend_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Legend_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Legend_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Li_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Li_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Li_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Li_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Li_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Link_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Link_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Link_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Link_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Link_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Main_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Main_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Main_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Main_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Main_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Map_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Map_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Map_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Map_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Map_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Mark_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Mark_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Mark_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Mark_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Mark_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Meta_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Meta_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Meta_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Meta_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Meta_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Meter_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Meter_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Meter_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Meter_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Meter_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Nav_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Nav_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Nav_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Nav_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Nav_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Noframes_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Noframes_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Noframes_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Noframes_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Noframes_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Noscript_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Noscript_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Noscript_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Noscript_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Noscript_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Object_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Object_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Object_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Object_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Object_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Ol_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Ol_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Ol_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Ol_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Ol_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Optgroup_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Optgroup_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Optgroup_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Optgroup_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Optgroup_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Option_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Option_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Option_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Option_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Option_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Output_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Output_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Output_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Output_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Output_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr P_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr P_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr P_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr P_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr P_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Param_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Param_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Param_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Param_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Param_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Picture_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Picture_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Picture_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Picture_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Picture_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Pre_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Pre_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Pre_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Pre_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Pre_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Progress_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Progress_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Progress_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Progress_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Progress_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Q_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Q_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Q_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Q_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Q_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Rp_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Rp_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Rp_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Rp_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Rp_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Rt_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Rt_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Rt_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Rt_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Rt_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Ruby_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Ruby_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Ruby_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Ruby_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Ruby_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr S_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr S_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr S_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr S_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr S_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Samp_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Samp_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Samp_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Samp_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Samp_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Script_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Script_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Script_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Script_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Script_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Section_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Section_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Section_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Section_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Section_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Select_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Select_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Select_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Select_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Select_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Small_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Small_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Small_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Small_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Small_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Source_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Source_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Source_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Source_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Source_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Span_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Span_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Span_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Span_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Span_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Strike_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Strike_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Strike_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Strike_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Strike_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Strong_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Strong_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Strong_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Strong_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Strong_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Style_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Style_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Style_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Style_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Style_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Sub_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Sub_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Sub_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Sub_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Sub_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Summary_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Summary_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Summary_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Summary_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Summary_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Sup_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Sup_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Sup_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Sup_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Sup_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Svg_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Svg_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Svg_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Svg_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Svg_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Table_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Table_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Table_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Table_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Table_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Tbody_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Tbody_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Tbody_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Tbody_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Tbody_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Td_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Td_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Td_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Td_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Td_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Template_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Template_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Template_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Template_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Template_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Textarea_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Textarea_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Textarea_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Textarea_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Textarea_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Tfoot_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Tfoot_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Tfoot_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Tfoot_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Tfoot_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Th_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Th_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Th_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Th_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Th_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Thead_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Thead_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Thead_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Thead_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Thead_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Time_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Time_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Time_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Time_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Time_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Title_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Title_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Title_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Title_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Title_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Tr_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Tr_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Tr_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Tr_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Tr_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Track_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Track_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Track_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Track_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Track_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Tt_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Tt_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Tt_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Tt_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Tt_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr U_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr U_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr U_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr U_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr U_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Ul_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Ul_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Ul_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Ul_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Ul_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Var_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Var_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Var_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Var_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Var_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Video_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Video_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Video_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Video_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Video_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Wbr_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Wbr_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Wbr_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Wbr_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Wbr_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Animate_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Animate_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Animate_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Animate_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Animate_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr AnimateMotion_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr AnimateMotion_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr AnimateMotion_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr AnimateMotion_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr AnimateMotion_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Circle_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Circle_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Circle_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Circle_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Circle_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr ClipPath_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr ClipPath_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr ClipPath_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr ClipPath_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr ClipPath_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Defs_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Defs_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Defs_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Defs_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Defs_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Desc_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Desc_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Desc_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Desc_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Desc_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Ellipse_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Ellipse_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Ellipse_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Ellipse_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Ellipse_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeBlend_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeBlend_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeBlend_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeBlend_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeBlend_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeColorMatrix_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeColorMatrix_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeColorMatrix_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeColorMatrix_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeColorMatrix_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeComponentTransfer_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeComponentTransfer_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeComponentTransfer_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeComponentTransfer_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeComponentTransfer_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeComposite_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeComposite_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeComposite_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeComposite_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeComposite_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeConvolveMatrix_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeConvolveMatrix_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeConvolveMatrix_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeConvolveMatrix_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeConvolveMatrix_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeDiffuseLighting_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeDiffuseLighting_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeDiffuseLighting_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeDiffuseLighting_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeDiffuseLighting_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeDisplacementMap_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeDisplacementMap_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeDisplacementMap_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeDisplacementMap_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeDisplacementMap_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeDropShadow_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeDropShadow_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeDropShadow_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeDropShadow_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeDropShadow_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeFlood_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeFlood_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeFlood_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeFlood_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeFlood_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeGaussianBlur_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeGaussianBlur_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeGaussianBlur_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeGaussianBlur_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeGaussianBlur_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeImage_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeImage_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeImage_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeImage_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeImage_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeMerge_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeMerge_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeMerge_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeMerge_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeMerge_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeMorphology_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeMorphology_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeMorphology_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeMorphology_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeMorphology_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeOffset_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeOffset_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeOffset_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeOffset_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeOffset_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeSpecularLighting_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeSpecularLighting_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeSpecularLighting_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeSpecularLighting_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeSpecularLighting_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeTile_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeTile_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeTile_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeTile_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeTile_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeTurbulence_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeTurbulence_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr FeTurbulence_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr FeTurbulence_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr FeTurbulence_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Filter_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Filter_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Filter_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Filter_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Filter_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr ForeignObject_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr ForeignObject_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr ForeignObject_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr ForeignObject_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr ForeignObject_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr G_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr G_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr G_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr G_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr G_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Image_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Image_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Image_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Image_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Image_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Line_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Line_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Line_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Line_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Line_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr LinearGradient_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr LinearGradient_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr LinearGradient_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr LinearGradient_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr LinearGradient_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Marker_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Marker_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Marker_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Marker_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Marker_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Mask_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Mask_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Mask_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Mask_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Mask_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Path_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Path_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Path_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Path_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Path_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Pattern_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Pattern_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Pattern_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Pattern_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Pattern_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Polygon_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Polygon_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Polygon_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Polygon_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Polygon_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Polyline_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Polyline_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Polyline_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Polyline_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Polyline_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr RadialGradient_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr RadialGradient_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr RadialGradient_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr RadialGradient_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr RadialGradient_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Rect_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Rect_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Rect_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Rect_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Rect_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Set_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Set_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Set_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Set_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Set_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Stop_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Stop_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Stop_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Stop_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Stop_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Switch_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Switch_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Switch_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Switch_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Switch_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Symbol_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Symbol_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Symbol_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Symbol_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Symbol_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Text_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Text_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Text_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Text_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Text_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr TextPath_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr TextPath_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr TextPath_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr TextPath_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr TextPath_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Tspan_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Tspan_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Tspan_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Tspan_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Tspan_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Use_ Class (NonEmpty.NonEmpty Event.Event  String ) where
  attr Class bothValues = unsafeAttribute $ Both (pure 
    { key: "class", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Use_ Class (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "class", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "class", value: prop' value })
instance Attr Use_ Class  String  where
  attr Class value = unsafeAttribute $ This $ pure $
    { key: "class", value: prop' value }
instance Attr Use_ Class (Event.Event  String ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr Use_ Class (ST.ST Global.Global  String ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "class", value: prop' value }

instance Attr everything Class (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Class bothValues = unsafeAttribute $ Both (pure  { key: "class", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "class", value: unset' })
instance Attr everything Class (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Class (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "class", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "class", value: unset' })
instance Attr everything Class  Unit  where
  attr Class _ = unsafeAttribute $ This $ pure $ { key: "class", value: unset' }
instance Attr everything Class (Event.Event  Unit ) where
  attr Class eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "class", value: unset' }

instance Attr everything Class (ST.ST Global.Global  Unit ) where
  attr Class stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "class", value: unset' }
