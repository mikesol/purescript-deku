module Deku.DOM.Attr.AriaValuenow where

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

data AriaValuenow = AriaValuenow

instance Attr Circle_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Circle_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Ellipse_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Ellipse_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr ForeignObject_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr ForeignObject_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr G_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr G_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Line_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Line_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Marker_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Marker_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Path_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Path_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Polygon_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Polygon_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Polyline_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Polyline_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Rect_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Rect_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Svg_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Svg_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Symbol_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Symbol_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Text_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Text_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr TextPath_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr TextPath_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Tspan_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Tspan_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr Use_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr Use_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr View_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: prop' value }
instance Attr View_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }


instance Attr everything AriaValuenow  Unit  where
  attr AriaValuenow _ = unsafeAttribute $ Left $  
    { key: "aria-valuenow", value: unset' }
instance Attr everything AriaValuenow (Event.Event  Unit ) where
  attr AriaValuenow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "aria-valuenow", value: unset' }
