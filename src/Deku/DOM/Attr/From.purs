module Deku.DOM.Attr.From where

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

data From = From

instance Attr Animate_ From  String  where
  attr From value = unsafeAttribute $ Left $  
    { key: "from", value: prop' value }
instance Attr Animate_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "from", value: prop' value }


instance Attr AnimateMotion_ From  String  where
  attr From value = unsafeAttribute $ Left $  
    { key: "from", value: prop' value }
instance Attr AnimateMotion_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "from", value: prop' value }


instance Attr AnimateTransform_ From  String  where
  attr From value = unsafeAttribute $ Left $  
    { key: "from", value: prop' value }
instance Attr AnimateTransform_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "from", value: prop' value }


instance Attr everything From  Unit  where
  attr From _ = unsafeAttribute $ Left $  { key: "from", value: unset' }
instance Attr everything From (Event.Event  Unit ) where
  attr From eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "from", value: unset' }
