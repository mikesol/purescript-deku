module Deku.DOM.Attr.AriaAtomic where

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

data AriaAtomic = AriaAtomic

instance Attr Circle_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Circle_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Ellipse_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Ellipse_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr ForeignObject_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr ForeignObject_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr G_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr G_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Line_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Line_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Marker_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Marker_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Path_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Path_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Polygon_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Polygon_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Polyline_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Polyline_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Rect_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Rect_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Svg_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Svg_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Symbol_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Symbol_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Text_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Text_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr TextPath_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr TextPath_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Tspan_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Tspan_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr Use_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr Use_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr View_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: prop' value }
instance Attr View_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }


instance Attr everything AriaAtomic  Unit  where
  attr AriaAtomic _ = unsafeAttribute $ Left $  
    { key: "aria-atomic", value: unset' }
instance Attr everything AriaAtomic (Event.Event  Unit ) where
  attr AriaAtomic eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "aria-atomic", value: unset' }
