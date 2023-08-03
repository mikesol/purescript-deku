module Deku.DOM.Attr.Shape where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Shape = Shape

instance Attr A_ Shape (NonEmpty.NonEmpty Event.Event  String ) where
  attr Shape bothValues = unsafeAttribute $ Both (pure 
    { key: "shape", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "shape", value: prop' value })
instance Attr A_ Shape (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Shape (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "shape", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "shape", value: prop' value })
instance Attr A_ Shape  String  where
  attr Shape value = unsafeAttribute $ This $ pure $
    { key: "shape", value: prop' value }
instance Attr A_ Shape (Event.Event  String ) where
  attr Shape eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "shape", value: prop' value }

instance Attr A_ Shape (ST.ST Global.Global  String ) where
  attr Shape stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "shape", value: prop' value }

instance Attr Area_ Shape (NonEmpty.NonEmpty Event.Event  String ) where
  attr Shape bothValues = unsafeAttribute $ Both (pure 
    { key: "shape", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "shape", value: prop' value })
instance Attr Area_ Shape (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Shape (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "shape", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "shape", value: prop' value })
instance Attr Area_ Shape  String  where
  attr Shape value = unsafeAttribute $ This $ pure $
    { key: "shape", value: prop' value }
instance Attr Area_ Shape (Event.Event  String ) where
  attr Shape eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "shape", value: prop' value }

instance Attr Area_ Shape (ST.ST Global.Global  String ) where
  attr Shape stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "shape", value: prop' value }

instance Attr everything Shape (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Shape bothValues = unsafeAttribute $ Both (pure  { key: "shape", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "shape", value: unset' })
instance Attr everything Shape (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Shape (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "shape", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "shape", value: unset' })
instance Attr everything Shape  Unit  where
  attr Shape _ = unsafeAttribute $ This $ pure $ { key: "shape", value: unset' }
instance Attr everything Shape (Event.Event  Unit ) where
  attr Shape eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "shape", value: unset' }

instance Attr everything Shape (ST.ST Global.Global  Unit ) where
  attr Shape stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "shape", value: unset' }
