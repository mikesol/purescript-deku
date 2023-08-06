module Deku.DOM.Attr.Cy where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cy = Cy

instance Attr Circle_ Cy  String  where
  attr Cy value = unsafeAttribute $ Left $  { key: "cy", value: prop' value }
instance Attr Circle_ Cy (Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "cy", value: prop' value }


instance Attr Ellipse_ Cy  String  where
  attr Cy value = unsafeAttribute $ Left $  { key: "cy", value: prop' value }
instance Attr Ellipse_ Cy (Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "cy", value: prop' value }


instance Attr RadialGradient_ Cy  String  where
  attr Cy value = unsafeAttribute $ Left $  { key: "cy", value: prop' value }
instance Attr RadialGradient_ Cy (Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "cy", value: prop' value }


instance Attr everything Cy  Unit  where
  attr Cy _ = unsafeAttribute $ Left $  { key: "cy", value: unset' }
instance Attr everything Cy (Event.Event  Unit ) where
  attr Cy eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "cy", value: unset' }
