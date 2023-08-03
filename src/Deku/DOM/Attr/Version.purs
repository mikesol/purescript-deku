module Deku.DOM.Attr.Version where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Version = Version

instance Attr Svg_ Version (NonEmpty.NonEmpty Event.Event  String ) where
  attr Version bothValues = unsafeAttribute $ Both (pure 
    { key: "version", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "version", value: prop' value })
instance Attr Svg_ Version (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Version (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "version", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "version", value: prop' value })
instance Attr Svg_ Version  String  where
  attr Version value = unsafeAttribute $ This $ pure $
    { key: "version", value: prop' value }
instance Attr Svg_ Version (Event.Event  String ) where
  attr Version eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "version", value: prop' value }

instance Attr Svg_ Version (ST.ST Global.Global  String ) where
  attr Version stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "version", value: prop' value }

instance Attr everything Version (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Version bothValues = unsafeAttribute $ Both (pure 
    { key: "version", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "version", value: unset' })
instance Attr everything Version (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Version (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "version", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "version", value: unset' })
instance Attr everything Version  Unit  where
  attr Version _ = unsafeAttribute $ This $ pure $ { key: "version", value: unset' }
instance Attr everything Version (Event.Event  Unit ) where
  attr Version eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "version", value: unset' }

instance Attr everything Version (ST.ST Global.Global  Unit ) where
  attr Version stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "version", value: unset' }
