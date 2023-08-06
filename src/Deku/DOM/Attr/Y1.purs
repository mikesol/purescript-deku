module Deku.DOM.Attr.Y1 where

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

data Y1 = Y1

instance Attr Line_ Y1  String  where
  attr Y1 value = unsafeAttribute $ Left $  { key: "y1", value: prop' value }
instance Attr Line_ Y1 (Event.Event  String ) where
  attr Y1 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "y1", value: prop' value }


instance Attr LinearGradient_ Y1  String  where
  attr Y1 value = unsafeAttribute $ Left $  { key: "y1", value: prop' value }
instance Attr LinearGradient_ Y1 (Event.Event  String ) where
  attr Y1 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "y1", value: prop' value }


instance Attr everything Y1  Unit  where
  attr Y1 _ = unsafeAttribute $ Left $  { key: "y1", value: unset' }
instance Attr everything Y1 (Event.Event  Unit ) where
  attr Y1 eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "y1", value: unset' }
