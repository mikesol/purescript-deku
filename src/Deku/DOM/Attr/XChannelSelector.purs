module Deku.DOM.Attr.XChannelSelector where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XChannelSelector = XChannelSelector

instance Attr FeDisplacementMap_ XChannelSelector (NonEmpty.NonEmpty Event.Event  String ) where
  attr XChannelSelector bothValues = unsafeAttribute $ Both (pure 
    { key: "xChannelSelector", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "xChannelSelector", value: prop' value }
    )
instance Attr FeDisplacementMap_ XChannelSelector (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XChannelSelector (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "xChannelSelector", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "xChannelSelector", value: prop' value }
    )
instance Attr FeDisplacementMap_ XChannelSelector  String  where
  attr XChannelSelector value = unsafeAttribute $ This $ pure $
    { key: "xChannelSelector", value: prop' value }
instance Attr FeDisplacementMap_ XChannelSelector (Event.Event  String ) where
  attr XChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "xChannelSelector", value: prop' value }

instance Attr FeDisplacementMap_ XChannelSelector (ST.ST Global.Global  String ) where
  attr XChannelSelector stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "xChannelSelector", value: prop' value }

instance Attr everything XChannelSelector (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr XChannelSelector bothValues = unsafeAttribute $ Both (pure 
    { key: "xChannelSelector", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "xChannelSelector", value: unset' })
instance Attr everything XChannelSelector (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr XChannelSelector (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "xChannelSelector", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "xChannelSelector", value: unset' })
instance Attr everything XChannelSelector  Unit  where
  attr XChannelSelector _ = unsafeAttribute $ This $ pure $
    { key: "xChannelSelector", value: unset' }
instance Attr everything XChannelSelector (Event.Event  Unit ) where
  attr XChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "xChannelSelector", value: unset' }

instance Attr everything XChannelSelector (ST.ST Global.Global  Unit ) where
  attr XChannelSelector stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "xChannelSelector", value: unset' }
