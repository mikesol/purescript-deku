module Deku.DOM.Attr.Additive where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Additive = Additive

instance Attr Animate_ Additive  String  where
  attr Additive value = unsafeAttribute $ Left $  
    { key: "additive", value: prop' value }
instance Attr Animate_ Additive (Event.Event  String ) where
  attr Additive eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "additive", value: prop' value }


instance Attr AnimateMotion_ Additive  String  where
  attr Additive value = unsafeAttribute $ Left $  
    { key: "additive", value: prop' value }
instance Attr AnimateMotion_ Additive (Event.Event  String ) where
  attr Additive eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "additive", value: prop' value }


instance Attr AnimateTransform_ Additive  String  where
  attr Additive value = unsafeAttribute $ Left $  
    { key: "additive", value: prop' value }
instance Attr AnimateTransform_ Additive (Event.Event  String ) where
  attr Additive eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "additive", value: prop' value }


instance Attr everything Additive  Unit  where
  attr Additive _ = unsafeAttribute $ Left $  
    { key: "additive", value: unset' }
instance Attr everything Additive (Event.Event  Unit ) where
  attr Additive eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "additive", value: unset' }
