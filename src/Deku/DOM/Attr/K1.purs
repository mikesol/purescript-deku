module Deku.DOM.Attr.K1 where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K1 = K1

instance Attr FeComposite_ K1  String  where
  attr K1 value = unsafeAttribute $ Left $  { key: "k1", value: prop' value }
instance Attr FeComposite_ K1 (Event.Event  String ) where
  attr K1 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "k1", value: prop' value }


instance Attr everything K1  Unit  where
  attr K1 _ = unsafeAttribute $ Left $  { key: "k1", value: unset' }
instance Attr everything K1 (Event.Event  Unit ) where
  attr K1 eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "k1", value: unset' }
