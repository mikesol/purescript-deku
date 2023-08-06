module Deku.DOM.Attr.Accelerate where

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

data Accelerate = Accelerate

instance Attr AnimateTransform_ Accelerate  String  where
  attr Accelerate value = unsafeAttribute $ Left $  
    { key: "accelerate", value: prop' value }
instance Attr AnimateTransform_ Accelerate (Event.Event  String ) where
  attr Accelerate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "accelerate", value: prop' value }


instance Attr everything Accelerate  Unit  where
  attr Accelerate _ = unsafeAttribute $ Left $  
    { key: "accelerate", value: unset' }
instance Attr everything Accelerate (Event.Event  Unit ) where
  attr Accelerate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "accelerate", value: unset' }
