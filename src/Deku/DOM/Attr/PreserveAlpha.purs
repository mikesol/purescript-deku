module Deku.DOM.Attr.PreserveAlpha where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PreserveAlpha = PreserveAlpha

instance Attr FeConvolveMatrix_ PreserveAlpha  String  where
  attr PreserveAlpha value = unsafeAttribute $ Left $  
    { key: "preserveAlpha", value: prop' value }
instance Attr FeConvolveMatrix_ PreserveAlpha (Event.Event  String ) where
  attr PreserveAlpha eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "preserveAlpha", value: prop' value }


instance Attr everything PreserveAlpha  Unit  where
  attr PreserveAlpha _ = unsafeAttribute $ Left $  
    { key: "preserveAlpha", value: unset' }
instance Attr everything PreserveAlpha (Event.Event  Unit ) where
  attr PreserveAlpha eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "preserveAlpha", value: unset' }
