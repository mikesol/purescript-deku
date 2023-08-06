module Deku.DOM.Attr.Scope where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scope = Scope

instance Attr Th_ Scope (NonEmpty.NonEmpty Event.Event  String ) where
  attr Scope bothValues = unsafeAttribute $ Both (pure 
    { key: "scope", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "scope", value: prop' value })
instance Attr Th_ Scope (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Scope (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "scope", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "scope", value: prop' value })
instance Attr Th_ Scope  String  where
  attr Scope value = unsafeAttribute $ This $ pure $
    { key: "scope", value: prop' value }
instance Attr Th_ Scope (Event.Event  String ) where
  attr Scope eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scope", value: prop' value }

instance Attr Th_ Scope (ST.ST Global.Global  String ) where
  attr Scope iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "scope", value: prop' value }

instance Attr everything Scope (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Scope bothValues = unsafeAttribute $ Both (pure  { key: "scope", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "scope", value: unset' })
instance Attr everything Scope (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Scope (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "scope", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "scope", value: unset' })
instance Attr everything Scope  Unit  where
  attr Scope _ = unsafeAttribute $ This $ { key: "scope", value: unset' }
instance Attr everything Scope (Event.Event  Unit ) where
  attr Scope eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "scope", value: unset' }

instance Attr everything Scope (ST.ST Global.Global  Unit ) where
  attr Scope iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "scope", value: unset' }
