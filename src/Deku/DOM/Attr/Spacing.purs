module Deku.DOM.Attr.Spacing where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Spacing = Spacing

instance Attr TextPath_ Spacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr Spacing bothValues = unsafeAttribute $ Both (pure 
    { key: "spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "spacing", value: prop' value })
instance Attr TextPath_ Spacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Spacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "spacing", value: prop' value })
instance Attr TextPath_ Spacing  String  where
  attr Spacing value = unsafeAttribute $ This $ pure $
    { key: "spacing", value: prop' value }
instance Attr TextPath_ Spacing (Event.Event  String ) where
  attr Spacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "spacing", value: prop' value }

instance Attr TextPath_ Spacing (ST.ST Global.Global  String ) where
  attr Spacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "spacing", value: prop' value }

instance Attr everything Spacing (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Spacing bothValues = unsafeAttribute $ Both (pure 
    { key: "spacing", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "spacing", value: unset' })
instance Attr everything Spacing (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Spacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "spacing", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "spacing", value: unset' })
instance Attr everything Spacing  Unit  where
  attr Spacing _ = unsafeAttribute $ This $ pure $ { key: "spacing", value: unset' }
instance Attr everything Spacing (Event.Event  Unit ) where
  attr Spacing eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "spacing", value: unset' }

instance Attr everything Spacing (ST.ST Global.Global  Unit ) where
  attr Spacing stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "spacing", value: unset' }
