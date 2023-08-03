module Deku.DOM.Attr.BaseProfile where

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

data BaseProfile = BaseProfile

instance Attr Svg_ BaseProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaseProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "baseProfile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseProfile", value: prop' value })
instance Attr Svg_ BaseProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaseProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "baseProfile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseProfile", value: prop' value })
instance Attr Svg_ BaseProfile  String  where
  attr BaseProfile value = unsafeAttribute $ This $ pure $
    { key: "baseProfile", value: prop' value }
instance Attr Svg_ BaseProfile (Event.Event  String ) where
  attr BaseProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseProfile", value: prop' value }

instance Attr Svg_ BaseProfile (ST.ST Global.Global  String ) where
  attr BaseProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "baseProfile", value: prop' value }

instance Attr everything BaseProfile (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr BaseProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "baseProfile", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "baseProfile", value: unset' })
instance Attr everything BaseProfile (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr BaseProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "baseProfile", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "baseProfile", value: unset' })
instance Attr everything BaseProfile  Unit  where
  attr BaseProfile _ = unsafeAttribute $ This $ pure $
    { key: "baseProfile", value: unset' }
instance Attr everything BaseProfile (Event.Event  Unit ) where
  attr BaseProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "baseProfile", value: unset' }

instance Attr everything BaseProfile (ST.ST Global.Global  Unit ) where
  attr BaseProfile stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "baseProfile", value: unset' }
