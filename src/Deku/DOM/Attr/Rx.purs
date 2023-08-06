module Deku.DOM.Attr.Rx where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rx = Rx

instance Attr Ellipse_ Rx  String  where
  attr Rx value = unsafeAttribute $ Left $  { key: "rx", value: prop' value }
instance Attr Ellipse_ Rx (Event.Event  String ) where
  attr Rx eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "rx", value: prop' value }


instance Attr Rect_ Rx  String  where
  attr Rx value = unsafeAttribute $ Left $  { key: "rx", value: prop' value }
instance Attr Rect_ Rx (Event.Event  String ) where
  attr Rx eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "rx", value: prop' value }


instance Attr everything Rx  Unit  where
  attr Rx _ = unsafeAttribute $ Left $  { key: "rx", value: unset' }
instance Attr everything Rx (Event.Event  Unit ) where
  attr Rx eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "rx", value: unset' }
