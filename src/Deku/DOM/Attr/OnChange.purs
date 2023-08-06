module Deku.DOM.Attr.OnChange where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnChange = OnChange

instance Attr anything OnChange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnChange bothValues = unsafeAttribute $ Both (pure 
    { key: "change", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "change", value: cb' value })
instance Attr anything OnChange (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnChange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "change", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "change", value: cb' value })
instance Attr anything OnChange  Cb  where
  attr OnChange value = unsafeAttribute $ This $ pure $
    { key: "change", value: cb' value }
instance Attr anything OnChange (Event.Event  Cb ) where
  attr OnChange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "change", value: cb' value }

instance Attr anything OnChange (ST.ST Global.Global  Cb ) where
  attr OnChange iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "change", value: cb' value }

instance Attr anything OnChange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnChange bothValues = unsafeAttribute $ Both (pure 
    { key: "change", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "change", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnChange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnChange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "change", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "change", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnChange  (Effect Unit)  where
  attr OnChange value = unsafeAttribute $ This $ pure $
    { key: "change", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnChange (Event.Event  (Effect Unit) ) where
  attr OnChange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "change", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnChange (ST.ST Global.Global  (Effect Unit) ) where
  attr OnChange iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "change", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnChange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnChange bothValues = unsafeAttribute $ Both (pure 
    { key: "change", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "change", value: cb' (Cb (const value)) }
    )
instance Attr anything OnChange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnChange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "change", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "change", value: cb' (Cb (const value)) }
    )
instance Attr anything OnChange  (Effect Boolean)  where
  attr OnChange value = unsafeAttribute $ This $ pure $
    { key: "change", value: cb' (Cb (const value)) }
instance Attr anything OnChange (Event.Event  (Effect Boolean) ) where
  attr OnChange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "change", value: cb' (Cb (const value)) }

instance Attr anything OnChange (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnChange iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "change", value: cb' (Cb (const value)) }

instance Attr everything OnChange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnChange bothValues = unsafeAttribute $ Both (pure 
    { key: "change", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "change", value: unset' })
instance Attr everything OnChange (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnChange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "change", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "change", value: unset' })
instance Attr everything OnChange  Unit  where
  attr OnChange _ = unsafeAttribute $ This $ { key: "change", value: unset' }
instance Attr everything OnChange (Event.Event  Unit ) where
  attr OnChange eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "change", value: unset' }

instance Attr everything OnChange (ST.ST Global.Global  Unit ) where
  attr OnChange iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "change", value: unset' }
