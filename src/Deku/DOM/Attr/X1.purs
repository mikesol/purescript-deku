module Deku.DOM.Attr.X1 where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data X1 = X1

instance Attr Line_ X1  String  where
  attr X1 value = unsafeAttribute $ Left $  { key: "x1", value: prop' value }
instance Attr Line_ X1 (Event.Event  String ) where
  attr X1 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "x1", value: prop' value }


instance Attr LinearGradient_ X1  String  where
  attr X1 value = unsafeAttribute $ Left $  { key: "x1", value: prop' value }
instance Attr LinearGradient_ X1 (Event.Event  String ) where
  attr X1 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "x1", value: prop' value }


instance Attr everything X1  Unit  where
  attr X1 _ = unsafeAttribute $ Left $  { key: "x1", value: unset' }
instance Attr everything X1 (Event.Event  Unit ) where
  attr X1 eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "x1", value: unset' }
