module Deku.DOM.Attr.ClipPathUnits where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ClipPathUnits = ClipPathUnits

instance Attr ClipPath_ ClipPathUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr ClipPathUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "clipPathUnits", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clipPathUnits", value: prop' value })
instance Attr ClipPath_ ClipPathUnits (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ClipPathUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "clipPathUnits", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clipPathUnits", value: prop' value })
instance Attr ClipPath_ ClipPathUnits  String  where
  attr ClipPathUnits value = unsafeAttribute $ This $ pure $
    { key: "clipPathUnits", value: prop' value }
instance Attr ClipPath_ ClipPathUnits (Event.Event  String ) where
  attr ClipPathUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "clipPathUnits", value: prop' value }

instance Attr ClipPath_ ClipPathUnits (ST.ST Global.Global  String ) where
  attr ClipPathUnits stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "clipPathUnits", value: prop' value }

instance Attr everything ClipPathUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr ClipPathUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "clipPathUnits", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "clipPathUnits", value: unset' })
instance Attr everything ClipPathUnits (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr ClipPathUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "clipPathUnits", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "clipPathUnits", value: unset' })
instance Attr everything ClipPathUnits  Unit  where
  attr ClipPathUnits _ = unsafeAttribute $ This $ pure $
    { key: "clipPathUnits", value: unset' }
instance Attr everything ClipPathUnits (Event.Event  Unit ) where
  attr ClipPathUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "clipPathUnits", value: unset' }

instance Attr everything ClipPathUnits (ST.ST Global.Global  Unit ) where
  attr ClipPathUnits stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "clipPathUnits", value: unset' }
