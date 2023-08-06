module Deku.DOM.Attr.AriaValuemin where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AriaValuemin = AriaValuemin

instance Attr Circle_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Circle_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Ellipse_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Ellipse_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr ForeignObject_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr ForeignObject_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr G_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr G_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Line_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Line_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Marker_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Marker_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Path_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Path_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Polygon_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Polygon_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Polyline_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Polyline_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Rect_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Rect_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Svg_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Svg_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Symbol_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Symbol_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Text_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Text_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr TextPath_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr TextPath_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Tspan_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Tspan_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr Use_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr Use_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr View_ AriaValuemin  String  where
  attr AriaValuemin value = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: prop' value }
instance Attr View_ AriaValuemin (Event.Event  String ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuemin", value: prop' value }


instance Attr everything AriaValuemin  Unit  where
  attr AriaValuemin _ = unsafeAttribute $ Left $  
    { key: "aria-valuemin", value: unset' }
instance Attr everything AriaValuemin (Event.Event  Unit ) where
  attr AriaValuemin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "aria-valuemin", value: unset' }
