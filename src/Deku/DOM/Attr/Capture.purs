module Deku.DOM.Attr.Capture where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Capture = Capture

instance Attr Input_ Capture  String  where
  attr Capture value = unsafeAttribute $ Left $  
    { key: "capture", value: prop' value }
instance Attr Input_ Capture (Event.Event  String ) where
  attr Capture eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "capture", value: prop' value }


instance Attr everything Capture  Unit  where
  attr Capture _ = unsafeAttribute $ Left $  { key: "capture", value: unset' }
instance Attr everything Capture (Event.Event  Unit ) where
  attr Capture eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "capture", value: unset' }
