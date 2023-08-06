module Deku.DOM.Attr.Cx where

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

data Cx = Cx

instance Attr Circle_ Cx  String  where
  attr Cx value = unsafeAttribute $ Left $  { key: "cx", value: prop' value }
instance Attr Circle_ Cx (Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "cx", value: prop' value }


instance Attr Ellipse_ Cx  String  where
  attr Cx value = unsafeAttribute $ Left $  { key: "cx", value: prop' value }
instance Attr Ellipse_ Cx (Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "cx", value: prop' value }


instance Attr RadialGradient_ Cx  String  where
  attr Cx value = unsafeAttribute $ Left $  { key: "cx", value: prop' value }
instance Attr RadialGradient_ Cx (Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "cx", value: prop' value }


instance Attr everything Cx  Unit  where
  attr Cx _ = unsafeAttribute $ Left $  { key: "cx", value: unset' }
instance Attr everything Cx (Event.Event  Unit ) where
  attr Cx eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "cx", value: unset' }
