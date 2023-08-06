module Deku.DOM.Attr.AutoReverse where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AutoReverse = AutoReverse

instance Attr AnimateTransform_ AutoReverse  String  where
  attr AutoReverse value = unsafeAttribute $ Left $  
    { key: "autoReverse", value: prop' value }
instance Attr AnimateTransform_ AutoReverse (Event.Event  String ) where
  attr AutoReverse eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "autoReverse", value: prop' value }


instance Attr everything AutoReverse  Unit  where
  attr AutoReverse _ = unsafeAttribute $ Left $  
    { key: "autoReverse", value: unset' }
instance Attr everything AutoReverse (Event.Event  Unit ) where
  attr AutoReverse eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "autoReverse", value: unset' }
