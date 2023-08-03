module Deku.DOM.Attr.Method where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Method = Method

instance Attr Form_ Method (NonEmpty.NonEmpty Event.Event  String ) where
  attr Method bothValues = unsafeAttribute $ Both (pure 
    { key: "method", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "method", value: prop' value })
instance Attr Form_ Method (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Method (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "method", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "method", value: prop' value })
instance Attr Form_ Method  String  where
  attr Method value = unsafeAttribute $ This $ pure $
    { key: "method", value: prop' value }
instance Attr Form_ Method (Event.Event  String ) where
  attr Method eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "method", value: prop' value }

instance Attr Form_ Method (ST.ST Global.Global  String ) where
  attr Method stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "method", value: prop' value }

instance Attr TextPath_ Method (NonEmpty.NonEmpty Event.Event  String ) where
  attr Method bothValues = unsafeAttribute $ Both (pure 
    { key: "method", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "method", value: prop' value })
instance Attr TextPath_ Method (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Method (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "method", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "method", value: prop' value })
instance Attr TextPath_ Method  String  where
  attr Method value = unsafeAttribute $ This $ pure $
    { key: "method", value: prop' value }
instance Attr TextPath_ Method (Event.Event  String ) where
  attr Method eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "method", value: prop' value }

instance Attr TextPath_ Method (ST.ST Global.Global  String ) where
  attr Method stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "method", value: prop' value }

instance Attr everything Method (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Method bothValues = unsafeAttribute $ Both (pure 
    { key: "method", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "method", value: unset' })
instance Attr everything Method (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Method (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "method", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "method", value: unset' })
instance Attr everything Method  Unit  where
  attr Method _ = unsafeAttribute $ This $ pure $ { key: "method", value: unset' }
instance Attr everything Method (Event.Event  Unit ) where
  attr Method eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "method", value: unset' }

instance Attr everything Method (ST.ST Global.Global  Unit ) where
  attr Method stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "method", value: unset' }
