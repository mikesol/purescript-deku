module Deku.DOM.Attr.Bgcolor where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Bgcolor = Bgcolor

instance Attr Body_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both (pure 
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Body_ Bgcolor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Bgcolor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "bgcolor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Body_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This $ pure $
    { key: "bgcolor", value: prop' value }
instance Attr Body_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Body_ Bgcolor (ST.ST Global.Global  String ) where
  attr Bgcolor stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Col_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both (pure 
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Col_ Bgcolor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Bgcolor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "bgcolor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Col_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This $ pure $
    { key: "bgcolor", value: prop' value }
instance Attr Col_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Col_ Bgcolor (ST.ST Global.Global  String ) where
  attr Bgcolor stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Colgroup_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both (pure 
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Colgroup_ Bgcolor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Bgcolor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "bgcolor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Colgroup_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This $ pure $
    { key: "bgcolor", value: prop' value }
instance Attr Colgroup_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Colgroup_ Bgcolor (ST.ST Global.Global  String ) where
  attr Bgcolor stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Table_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both (pure 
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Table_ Bgcolor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Bgcolor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "bgcolor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Table_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This $ pure $
    { key: "bgcolor", value: prop' value }
instance Attr Table_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Table_ Bgcolor (ST.ST Global.Global  String ) where
  attr Bgcolor stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Tbody_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both (pure 
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Tbody_ Bgcolor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Bgcolor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "bgcolor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Tbody_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This $ pure $
    { key: "bgcolor", value: prop' value }
instance Attr Tbody_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Tbody_ Bgcolor (ST.ST Global.Global  String ) where
  attr Bgcolor stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Tfoot_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both (pure 
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Tfoot_ Bgcolor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Bgcolor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "bgcolor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Tfoot_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This $ pure $
    { key: "bgcolor", value: prop' value }
instance Attr Tfoot_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Tfoot_ Bgcolor (ST.ST Global.Global  String ) where
  attr Bgcolor stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Td_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both (pure 
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Td_ Bgcolor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Bgcolor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "bgcolor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Td_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This $ pure $
    { key: "bgcolor", value: prop' value }
instance Attr Td_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Td_ Bgcolor (ST.ST Global.Global  String ) where
  attr Bgcolor stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Th_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both (pure 
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Th_ Bgcolor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Bgcolor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "bgcolor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Th_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This $ pure $
    { key: "bgcolor", value: prop' value }
instance Attr Th_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Th_ Bgcolor (ST.ST Global.Global  String ) where
  attr Bgcolor stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Tr_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both (pure 
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Tr_ Bgcolor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Bgcolor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "bgcolor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Tr_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This $ pure $
    { key: "bgcolor", value: prop' value }
instance Attr Tr_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Tr_ Bgcolor (ST.ST Global.Global  String ) where
  attr Bgcolor stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr everything Bgcolor (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both (pure 
    { key: "bgcolor", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "bgcolor", value: unset' })
instance Attr everything Bgcolor (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Bgcolor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "bgcolor", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "bgcolor", value: unset' })
instance Attr everything Bgcolor  Unit  where
  attr Bgcolor _ = unsafeAttribute $ This $ pure $ { key: "bgcolor", value: unset' }
instance Attr everything Bgcolor (Event.Event  Unit ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "bgcolor", value: unset' }

instance Attr everything Bgcolor (ST.ST Global.Global  Unit ) where
  attr Bgcolor stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "bgcolor", value: unset' }
