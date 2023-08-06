module Deku.DOM.Attr.K2 where

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

data K2 = K2

instance Attr FeComposite_ K2  String  where
  attr K2 value = unsafeAttribute $ Left $  { key: "k2", value: prop' value }
instance Attr FeComposite_ K2 (Event.Event  String ) where
  attr K2 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "k2", value: prop' value }


instance Attr everything K2  Unit  where
  attr K2 _ = unsafeAttribute $ Left $  { key: "k2", value: unset' }
instance Attr everything K2 (Event.Event  Unit ) where
  attr K2 eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "k2", value: unset' }
