module Deku.DOM.Attr.Y2 where

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

data Y2 = Y2

instance Attr Line_ Y2  String  where
  attr Y2 value = unsafeAttribute $ Left $  { key: "y2", value: prop' value }
instance Attr Line_ Y2 (Event.Event  String ) where
  attr Y2 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "y2", value: prop' value }


instance Attr LinearGradient_ Y2  String  where
  attr Y2 value = unsafeAttribute $ Left $  { key: "y2", value: prop' value }
instance Attr LinearGradient_ Y2 (Event.Event  String ) where
  attr Y2 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "y2", value: prop' value }


instance Attr everything Y2  Unit  where
  attr Y2 _ = unsafeAttribute $ Left $  { key: "y2", value: unset' }
instance Attr everything Y2 (Event.Event  Unit ) where
  attr Y2 eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "y2", value: unset' }
