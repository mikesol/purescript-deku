module Deku.DOM.Attr.YChannelSelector where

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

data YChannelSelector = YChannelSelector

instance Attr FeDisplacementMap_ YChannelSelector (NonEmpty.NonEmpty Event.Event  String ) where
  attr YChannelSelector bothValues = unsafeAttribute $ Both (pure 
    { key: "yChannelSelector", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "yChannelSelector", value: prop' value }
    )
instance Attr FeDisplacementMap_ YChannelSelector (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr YChannelSelector (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "yChannelSelector", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "yChannelSelector", value: prop' value }
    )
instance Attr FeDisplacementMap_ YChannelSelector  String  where
  attr YChannelSelector value = unsafeAttribute $ This $ pure $
    { key: "yChannelSelector", value: prop' value }
instance Attr FeDisplacementMap_ YChannelSelector (Event.Event  String ) where
  attr YChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "yChannelSelector", value: prop' value }

instance Attr FeDisplacementMap_ YChannelSelector (ST.ST Global.Global  String ) where
  attr YChannelSelector iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "yChannelSelector", value: prop' value }

instance Attr everything YChannelSelector (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr YChannelSelector bothValues = unsafeAttribute $ Both (pure 
    { key: "yChannelSelector", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "yChannelSelector", value: unset' })
instance Attr everything YChannelSelector (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr YChannelSelector (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "yChannelSelector", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "yChannelSelector", value: unset' })
instance Attr everything YChannelSelector  Unit  where
  attr YChannelSelector _ = unsafeAttribute $ This $ pure $
    { key: "yChannelSelector", value: unset' }
instance Attr everything YChannelSelector (Event.Event  Unit ) where
  attr YChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "yChannelSelector", value: unset' }

instance Attr everything YChannelSelector (ST.ST Global.Global  Unit ) where
  attr YChannelSelector iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "yChannelSelector", value: unset' }
