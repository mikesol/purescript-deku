module Deku.DOM.Attr.AriaLabelledby where

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

data AriaLabelledby = AriaLabelledby

instance Attr Circle_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Circle_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Ellipse_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Ellipse_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr ForeignObject_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr ForeignObject_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr G_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr G_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Line_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Line_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Marker_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Marker_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Path_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Path_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Polygon_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Polygon_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Polyline_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Polyline_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Rect_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Rect_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Svg_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Svg_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Symbol_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Symbol_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Text_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Text_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr TextPath_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr TextPath_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Tspan_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Tspan_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr Use_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr Use_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr View_ AriaLabelledby  String  where
  attr AriaLabelledby value = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: prop' value }
instance Attr View_ AriaLabelledby (Event.Event  String ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-labelledby", value: prop' value }


instance Attr everything AriaLabelledby  Unit  where
  attr AriaLabelledby _ = unsafeAttribute $ Left $  
    { key: "aria-labelledby", value: unset' }
instance Attr everything AriaLabelledby (Event.Event  Unit ) where
  attr AriaLabelledby eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "aria-labelledby", value: unset' }
