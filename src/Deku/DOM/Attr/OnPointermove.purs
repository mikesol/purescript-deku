module Deku.DOM.Attr.OnPointermove where

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

data OnPointermove = OnPointermove

instance Attr anything OnPointermove (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointermove bothValues = unsafeAttribute $ Both (pure 
    { key: "pointermove", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointermove", value: cb' value })
instance Attr anything OnPointermove (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnPointermove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointermove", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointermove", value: cb' value })
instance Attr anything OnPointermove  Cb  where
  attr OnPointermove value = unsafeAttribute $ This $ pure $
    { key: "pointermove", value: cb' value }
instance Attr anything OnPointermove (Event.Event  Cb ) where
  attr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointermove", value: cb' value }

instance Attr anything OnPointermove (ST.ST Global.Global  Cb ) where
  attr OnPointermove stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointermove", value: cb' value }

instance Attr anything OnPointermove (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointermove bothValues = unsafeAttribute $ Both (pure 
    { key: "pointermove", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointermove", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointermove (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnPointermove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointermove", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointermove", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointermove  (Effect Unit)  where
  attr OnPointermove value = unsafeAttribute $ This $ pure $
    { key: "pointermove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointermove (Event.Event  (Effect Unit) ) where
  attr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointermove (ST.ST Global.Global  (Effect Unit) ) where
  attr OnPointermove stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointermove (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointermove bothValues = unsafeAttribute $ Both (pure 
    { key: "pointermove", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointermove", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointermove (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnPointermove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointermove", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointermove", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointermove  (Effect Boolean)  where
  attr OnPointermove value = unsafeAttribute $ This $ pure $
    { key: "pointermove", value: cb' (Cb (const value)) }
instance Attr anything OnPointermove (Event.Event  (Effect Boolean) ) where
  attr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const value)) }

instance Attr anything OnPointermove (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnPointermove stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const value)) }

instance Attr everything OnPointermove (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointermove bothValues = unsafeAttribute $ Both (pure 
    { key: "pointermove", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointermove", value: unset' })
instance Attr everything OnPointermove (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnPointermove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "pointermove", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pointermove", value: unset' })
instance Attr everything OnPointermove  Unit  where
  attr OnPointermove _ = unsafeAttribute $ This $ pure $
    { key: "pointermove", value: unset' }
instance Attr everything OnPointermove (Event.Event  Unit ) where
  attr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointermove", value: unset' }

instance Attr everything OnPointermove (ST.ST Global.Global  Unit ) where
  attr OnPointermove stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "pointermove", value: unset' }
