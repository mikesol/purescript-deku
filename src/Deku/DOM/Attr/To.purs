module Deku.DOM.Attr.To where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data To = To

instance Attr Animate_ To  String  where
  attr To value = unsafeAttribute $ Left $  { key: "to", value: prop' value }
instance Attr Animate_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "to", value: prop' value }


instance Attr AnimateMotion_ To  String  where
  attr To value = unsafeAttribute $ Left $  { key: "to", value: prop' value }
instance Attr AnimateMotion_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "to", value: prop' value }


instance Attr AnimateTransform_ To  String  where
  attr To value = unsafeAttribute $ Left $  { key: "to", value: prop' value }
instance Attr AnimateTransform_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "to", value: prop' value }


instance Attr Set_ To  String  where
  attr To value = unsafeAttribute $ Left $  { key: "to", value: prop' value }
instance Attr Set_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "to", value: prop' value }


instance Attr everything To  Unit  where
  attr To _ = unsafeAttribute $ Left $  { key: "to", value: unset' }
instance Attr everything To (Event.Event  Unit ) where
  attr To eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "to", value: unset' }
